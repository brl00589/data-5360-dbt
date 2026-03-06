{{ config(materialized='table') }}

with dates as (
    select distinct
        cast(order_date as date) as date_id
    from {{ source('oliver', 'ORDERS') }}
)

select
    row_number() over (order by date_id) as date_key,
    date_id,
    dayname(date_id) as dayofweek,
    month(date_id) as month,
    quarter(date_id) as quarter,
    year(date_id) as year
from dates