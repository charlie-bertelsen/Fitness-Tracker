# Fitness-Tracker

### Table of Contents

  - [Project Overview](#project-overview)
  - [Data Sources](#Data-Sources)
  - [Tools](#Tools)
  - [Data Cleaning and Processing](#Data-Cleaning-and-Processing)
  - [Exploratory Data Analysis](#Exploratory-Data-Analysis)
  - [SQL Schema](#SQL-Schema)
  - [Dashboards and Visualizations](#Dashboards-and-Visualizations)

    - [Overview](#Overview)

    - [Sleep](#Sleep)

    - [Workouts](#Workouts)

    - [Nutrition](#Nutrition)

    - [Stress](#Stress)
    
  - [Results](#Results)
  - [Future Work](#Future-Work)
  - [Limitations](#Limitations)

### Project Overview

This project is an end-to-end pipeline that tracks and analyzes personal fitness, nutrition, and wellness data. It extracts data from wearable exports .csv files, transforms it using Python, stores it in a MySQL database, and visualizes trends through Power BI dashboards.

### Data Sources

The data in this project is sourced from Garmin Connect and Cronometer. Both of these apps allow for .csv data export which I run through the ETL process, sorting the .csv files and uploading them to my fitness tracker database.

Garmin connect is an app that stores the fitness data collected by my garmin watch that I have been wearing consistently to track my progress. The information collected by the garmin includes my sleep, workout, heart rate, stress, weight and more. Cronometer is the nutrition tracking app that I use to enter in every single calorie and nutrient that I have been consuming. Cronometer details all information pertaining to nutrition including calories consumed, primary macronutrients, amino acids, minerals and vitamins. 

### Tools

- Python : Pandas, SQLAlchemy
- MySQL : Database creation, queries
- Microsoft PowerBI : Dashboards, data visualization

  
### Data Cleaning and Processing

### Exploratory Data Analysis


### Dashboards and Visualizations



### Overview

![image](https://github.com/user-attachments/assets/19f61038-9920-41e6-9887-ec8e2a7a4cf7)


### Sleep

![Sleep](https://github.com/user-attachments/assets/ef9b8054-2822-4bb7-a391-7fc0b4c20065)


### Workouts

![Workout](https://github.com/user-attachments/assets/c80a78c6-a5ba-4051-8cde-7a2b37c3e7e5)


### Nutrition

![Nutrition](https://github.com/user-attachments/assets/479f17af-e935-41d3-911a-ab2d975e649f)


### Stress

![Stress](https://github.com/user-attachments/assets/21315406-ca71-41b2-968f-b9e6521e074b)


### SQL Schema

![Updated_FT_ERD](https://github.com/user-attachments/assets/539373e2-2d7b-4165-b345-3b613c2cb674)


### Results

While 

### Future Work

To enhance the functionality of this fitness tracking system, several improvements and feature expansions are planned for future development:

#### 1. Automated Data Integration

Implement API connections to Garmin, Cronometer, and other platforms to automate data extraction and eliminate the need for manual CSV uploads.

#### 2. Multi-User Support

Extend the current schema to support multiple users.

#### 3. Predictive Analytics and Goal Tracking

Integrate machine learning models to predict various metrics and provide user-based recommendations.

### Limitations

While this project provides a comprehensive approach to tracking and analyzing personal fitness data, it has several limitations that users and reviewers should be aware of:

#### 1. Data Source Accuracy

While the garmin can be a very good tool at getting estimates, it may not always provide fully accurate measurements for calories burned, heart rate, or sleep quality. Variability across devices and sensor algorithms can lead to inconsistencies. Manually entered data introduces the potential for human error and inconsistency in logging.

#### 2. Manual Data

Certain data (e.g., nutrition logs or body composition metrics) require manual CSV export and import into the database. This process is time-consuming and prone to formatting issues or missing entries. There is currently no real-time automation or API integration which makes it more difficult to use.

#### 3. Single-User Focus

Although the database is designed to support multiple users, there is currently only one user. Additional development would be required to fully scale this for multi-user use cases, including user authentication and privacy features.

#### 4. Predictive Analytics

The current project focuses on data tracking and visualization rather than forecasting or goal-setting algorithms. Future versions could benefit greatly from integrating machine learning or predictive modeling to provide personalized insights.

