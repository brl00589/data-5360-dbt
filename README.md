## Project Overview

This project involved designing and implementing a modern data warehouse as data management consultants.

Eco Essentials, an eco-friendly cookware company, required a centralized data solution to better store, organize, and analyze their operational and customer data. The goal of this project was to design and build a scalable data warehouse that would enable more effective business insights and decision-making.

## Tech Stack
- Fivetran (data ingestion)
- Snowflake (cloud data warehouse)
- dbt (data transformation)
- Tableau (data visualization)

## Data Warehouse Design

The first phase of the project focused on designing the data warehouse. This involved creating a dimensional model, including an entity relationship diagram (ERD), defining the grain of each table, and identifying appropriate fact and dimension tables.

By structuring the data using a star schema approach, we ensured that the warehouse would support efficient querying and scalable analytics. Key business processes were translated into fact tables, while descriptive attributes were organized into dimension tables.

## Data Model

The warehouse was structured using a star schema, including key tables such as:

- dim_campaign
- dim_customer
- dim_date
- dim_email
- dim_event_type
- dim_product
- fact_orders
- fact_email_sent

These tables were connected through surrogate keys to ensure consistency and efficient querying.

## Data Pipeline (ELT Process)

After finalizing the data model, we implemented an end-to-end ELT pipeline.

- Extraction & Loading: Data was extracted from multiple sources, including an Amazon S3 bucket and a transactional database, using Fivetran. This data was loaded into Snowflake landing tables.
- Transformation: Using dbt Cloud, we transformed the raw data into clean, structured dimensional models. This included generating surrogate keys, establishing relationships between tables, and ensuring data consistency.

This phase required significant iteration to ensure that all models were correctly built and aligned with the intended schema.

## Testing & Automation

To ensure data quality and reliability, we implemented dbt tests across all models, including:

- unique
- not_null
- accepted_values
- relationships

Once validated, we configured automated pipelines by scheduling daily data syncs in Fivetran and dbt jobs to rebuild the models. This ensured that the data warehouse remained up-to-date and production-ready.

## Data Analysis & Insights

In the final phase, we connected our Snowflake data warehouse to Tableau to create visualizations and analyze the data.

Two key insights emerged:

1. Misaligned Campaign Timing: Certain holiday-themed email campaigns were sent at inconsistent times. For example, an Earth Day campaign was distributed in January instead of April, potentially reducing engagement and causing confusion among customers.
2. Mismatch Between Campaign Volume and Email Activity: Months with a higher number of campaigns, such as April, did not correspond with increased email activity. This suggests an opportunity for the company to better align email outreach with campaign intensity to maximize customer engagement.

## Challenges & Learnings

One challenge encountered was ensuring proper relationships between tables when building visualizations in Tableau, as some fields initially appeared unrelated. This required revisiting the data model and confirming key relationships.

Additionally, transforming raw data into a clean dimensional model required careful handling of null values, data types, and surrogate key generation in dbt.

## Key Takeaways

This project demonstrated the ability to:

- Design and implement a dimensional data warehouse
- Build ELT pipelines using modern data tools (Fivetran, Snowflake, dbt)
- Ensure data quality through testing and automation
- Translate raw data into actionable business insights through visualization

This project simulates a real-world data engineering workflow, from raw data ingestion to business-facing insights.
