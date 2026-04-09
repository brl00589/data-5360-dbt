{{ config(
    materialized = 'table',
    schema = 'dw_ecoessentials'
) }}

with all_dates as (

    select distinct cast(order_timestamp as date) as date_day
    from {{ ref('stg_order') }}

    union

    select distinct cast(eventtimestamp as date) as date_day
    from {{ ref('stg_marketingemails') }}
    where eventtimestamp is not null

    union

    select distinct cast(sendtimestamp as date) as date_day
    from {{ ref('stg_marketingemails') }}
    where sendtimestamp is not null
)

select
    date_day as date_key,
    date_day,
    dayofweek(date_day) as day_of_week,
    month(date_day) as month_of_year,
    monthname(date_day) as month_name,
    quarter(date_day) as quarter_of_year,
    year(date_day) as year_number
from all_dates
order by date_day