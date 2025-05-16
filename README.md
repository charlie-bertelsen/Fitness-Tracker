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

### Project Questions

1. How does my actual sleep duration compare to my sleep needed?
2. How do my average daily macronutrient intakes compare with my nutritional goals?
3. How important is consistency in reaching my fitness goals?

### Data Sources

The data in this project is sourced from Garmin Connect and Cronometer. Both of these apps allow for .csv data export which I run through the ETL process, sorting the .csv files and uploading them to my fitness tracker database.

Garmin connect is an app that stores the fitness data collected by my garmin watch that I have been wearing consistently to track my progress. The information collected by the garmin includes my sleep, workout, heart rate, stress, weight and more. Cronometer is the nutrition tracking app that I use to enter in every single calorie and nutrient that I have been consuming. Cronometer details all information pertaining to nutrition including calories consumed, primary macronutrients, amino acids, minerals and vitamins. 

### Tools

![Python](https://img.shields.io/badge/Python-3.10-blue)
![Power BI](https://img.shields.io/badge/Power%20BI-Data%20Visualization-yellow)
![MySQL](https://img.shields.io/badge/MySQL-Relational%20Database-blue)
  
### Data Cleaning and Processing

The data in this project was obtained by exporting .csv files from Garmin and Cronometer. It was then cleaned and standardized using Python. The ETL script handled these steps:

- Date formatting and consistency across all sources

- Missing value handling, filtering out incomplete entries

- Unit conversions

- Column renaming

- Duplicate row removal

After these steps were completed, processed data was then loaded into a MySQL database via SQLAlchemy which sorted the data into various tables.

### Dashboards and Visualizations

This project features a series of interactive Power BI dashboards that provide actionable insights across multiple aspects of personal health and fitness. Key metrics such as sleep quality, stress levels, heart rate, and nutritional intake are visualized through a mix of KPI cards, time series charts, scatter plots, and various other visuals visuals. The dashboards are designed for clarity, interactivity, and performance tracking, with an overview page that summarizes the key charts and findings.

Below are screenshots and explanations of each dashboard designed in Power BI to explore different facets of fitness tracking:

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

This project has revealed several key insights into my current health and fitness habits. First, I found that my actual sleep duration consistently fell short of my sleep needs, often by over an hour, which can have compounding effects on recovery, cognitive performance, and training readiness. While I was still maintaining an average of 7.97 hours of sleep a night, my goal of 9 hours of sleep would optimize muscle synthesis and recovery. Additionally, in examining my macronutrient intake, I discovered that I was consuming significantly more fat than needed while consistently under-consuming both protein and carbohydrates. This imbalance not only moves me further from my goal of eating in a surplus to support muscle growth, but also limits my ability to fuel workouts effectively. Even If I am disciplined throughout the week, one poor day of eating can be detrimental to reaching long-term caloric and nutrient goals.

The results of this project have emphasized the critical role of consistency. Even a couple of poor sleep or nutrition days can offset disciplined effort, undermining overall progress. These findings reinforce the idea that sustained daily habits are the key to reaching long-term fitness goals. Improving consistency in both sleep and nutrition will be essential to move forward with my fitness goals.

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

