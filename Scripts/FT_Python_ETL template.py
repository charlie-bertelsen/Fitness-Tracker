import os
import shutil
import pandas as pd
from sqlalchemy import create_engine, text
import config
import re

# Setup Database Connection
def get_engine():
    return create_engine(f"mysql+mysqlconnector://{config.DB_USER}:{config.DB_PASSWORD}@{config.DB_HOST}:{config.DB_PORT}/{config.DB_NAME}")

# Load and Clean a CSV File
def load_csv(file_path):
    df = pd.read_csv(file_path)
    df.replace({'--': None, 'FALSE': False, 'TRUE': True}, inplace=True)
    return df

# Convert '7h 30min' to total minutes
def parse_duration_to_minutes(duration_str):
    match = re.match(r'(?:(\d+)h)?\s*(?:(\d+)min)?', str(duration_str))
    if match:
        hours = int(match.group(1)) if match.group(1) else 0
        minutes = int(match.group(2)) if match.group(2) else 0
        return hours * 60 + minutes
    return None

# Delete existing rows
def delete_existing_rows(engine, table, user_id, dates, date_column='entry_date'):
    if dates:
        placeholders = ", ".join([":date" + str(i) for i in range(len(dates))])
        sql = f"DELETE FROM {table} WHERE user_id = :user_id AND {date_column} IN ({placeholders})"
        params = {"user_id": user_id}
        for i, date in enumerate(dates):
            params[f"date{i}"] = date
        with engine.begin() as conn:
            conn.execute(text(sql), params)

# Main ETL Process
def run_etl():
    engine = get_engine()
    user_id = 1

    if not os.path.exists("Data/Uploaded_Data"):
        os.makedirs("Data/Uploaded_Data")

    for filename in os.listdir("Data/Data_To_Upload"):
        file_path = os.path.join("Data", "Data_To_Upload", filename)

        if filename.lower().startswith("nutrition"):
            nutrition_df = load_csv(file_path)
            nutrition_df['entry_date'] = pd.to_datetime(nutrition_df['Date']).dt.date
            nutrition_df['user_id'] = user_id

            primary_cols = ['user_id', 'entry_date', 'Energy (kcal)', 'Carbs (g)', 'Net Carbs (g)', 'Fiber (g)', 'Starch (g)', 'Sugars (g)', 'Added Sugars (g)', 'Fat (g)', 'Saturated (g)', 'Monounsaturated (g)', 'Polyunsaturated (g)', 'Cholesterol (mg)', 'Protein (g)', 'Water (g)', 'Completed']
            primary_nutrition = nutrition_df[primary_cols]
            primary_nutrition.columns = ['user_id', 'entry_date', 'calories', 'carbs_g', 'net_carbs_g', 'fiber_g', 'starch_g', 'sugars_g', 'added_sugars_g', 'fat_g', 'saturated_fat_g', 'monounsaturated_fat_g', 'polyunsaturated_fat_g', 'cholesterol_mg', 'protein_g', 'water_g', 'completed']
            delete_existing_rows(engine, "primary_nutrition", user_id, [str(d) for d in primary_nutrition['entry_date']])
            primary_nutrition.to_sql('primary_nutrition', con=engine, if_exists='append', index=False)

            print("✅ Nutrition data uploaded.")

        elif filename.lower().startswith("sleep"):
            sleep_df_raw = load_csv(file_path)
            sleep_df_raw.rename(columns=lambda x: x.strip(), inplace=True)
            sleep_df = pd.DataFrame()
            sleep_df['entry_date'] = pd.to_datetime(sleep_df_raw['Sleep Score 7 Days']).dt.date
            sleep_df['user_id'] = user_id
            sleep_df['sleep_score'] = sleep_df_raw['Score']
            sleep_df['resting_heart_rate'] = sleep_df_raw['Resting Heart Rate']
            sleep_df['body_battery'] = sleep_df_raw['Body Battery']
            sleep_df['respiration_rate'] = sleep_df_raw['Respiration']
            sleep_df['hrv_status'] = pd.to_numeric(sleep_df_raw['HRV Status'], errors='coerce')
            sleep_df['quality'] = sleep_df_raw['Quality']
            sleep_df['duration_min'] = sleep_df_raw['Duration'].apply(parse_duration_to_minutes)
            sleep_df['sleep_need_min'] = sleep_df_raw['Sleep Need'].apply(parse_duration_to_minutes)
            sleep_df['bedtime'] = pd.to_datetime(sleep_df_raw['Bedtime']).dt.time
            sleep_df['wake_time'] = pd.to_datetime(sleep_df_raw['Wake Time']).dt.time
            delete_existing_rows(engine, "sleep", user_id, [str(d) for d in sleep_df['entry_date']])
            sleep_df.to_sql('sleep', con=engine, if_exists='append', index=False)
            print("✅ Sleep data uploaded.")

        # Skipping weight upload for now
        # elif filename.lower().startswith("weight"):
        #     pass

        elif filename.lower().startswith("workouts"):
            workouts_df = load_csv(file_path)
            workouts_df.rename(columns=lambda x: x.strip(), inplace=True)
            workouts_df['workout_date'] = pd.to_datetime(workouts_df['Date'])
            workouts_df['entry_date'] = workouts_df['workout_date'].dt.date
            workouts_df['user_id'] = user_id

            delete_existing_rows(engine, "workouts", user_id, [str(d) for d in workouts_df['entry_date']], date_column="workout_date")

            for _, row in workouts_df.iterrows():
                steps = int(str(row['Steps']).replace(',', '')) if pd.notnull(row['Steps']) else None

                workout = {
                    'user_id': row['user_id'],
                    'workout_date': row['workout_date'].date(),
                    'activity_type': row['Activity Type'],
                    'calories': row['Calories'],
                    'duration': row['Time'],
                    'avg_hr': row['Avg HR'],
                    'max_hr': row['Max HR'],
                    'aerobic_te': row['Aerobic TE']
                }

                with engine.begin() as conn:
                    result = conn.execute(text("""
                        INSERT INTO workouts (user_id, workout_date, activity_type, calories, duration, avg_hr, max_hr, aerobic_te)
                        VALUES (:user_id, :workout_date, :activity_type, :calories, :duration, :avg_hr, :max_hr, :aerobic_te)
                    """), workout)
                    workout_id = result.lastrowid

                if row['Activity Type'] == 'Running':
                    running_metrics = {
                        'workout_id': workout_id,
                        'title': row['Title'],
                        'distance_miles': row['Distance'],
                        'cadence_avg': row['Avg Run Cadence'],
                        'cadence_max': row['Max Run Cadence'],
                        'avg_pace': row['Avg Pace'],
                        'best_pace': row['Best Pace'],
                        'elevation_gain_ft': row['Total Ascent'],
                        'elevation_loss_ft': row['Total Descent'],
                        'stride_length': row['Avg Stride Length'],
                        'vertical_ratio': row['Avg Vertical Ratio'],
                        'vertical_oscillation': row['Avg Vertical Oscillation'],
                        'ground_contact_time_ms': row['Avg Ground Contact Time'],
                        'avg_gap': row['Avg GAP'],
                        'steps': steps
                    }
                    pd.DataFrame([running_metrics]).to_sql('running_workouts', con=engine, if_exists='append', index=False)

                elif row['Activity Type'] == 'Strength Training':
                    strength_metrics = {
                        'workout_id': workout_id,
                        'steps': steps,
                        'total_reps': row['Total Reps'],
                        'total_sets': row['Total Sets']
                    }
                    pd.DataFrame([strength_metrics]).to_sql('strength_workouts', con=engine, if_exists='append', index=False)

            print("✅ Workouts data uploaded.")

        shutil.move(file_path, os.path.join("Data", "Uploaded_Data", filename))

if __name__ == "__main__":
    run_etl()