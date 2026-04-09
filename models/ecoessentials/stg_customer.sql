{{ config(materialized='view') }}

select
    customer_id,
    customer_first_name,
    customer_last_name,
    customer_phone,
    customer_address,
    customer_city,
    customer_state,
    customer_zip,
    customer_country,
    customer_email
from {{ source('ecoessentials_landing', 'customer') }}