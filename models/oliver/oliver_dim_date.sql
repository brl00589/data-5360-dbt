{{ config(materialized='table') }}

with order_dates as (
    select distinct
        cast(order_date as date) as date_id
    from {{ source('oliver', 'ORDERS') }}
),

certification_dates as (
    select distinct
        cast(certification_awarded_date as date) as date_id
    from {{ ref('stg_employee_certifications') }}
),

dates as (
    select date_id from order_dates
    union
    select date_id from certification_dates
)

select
    row_number() over (order by date_id) as date_key,
    date_id,
    dayname(date_id) as dayofweek,
    month(date_id) as month,
    quarter(date_id) as quarter,
    year(date_id) as year
from dates