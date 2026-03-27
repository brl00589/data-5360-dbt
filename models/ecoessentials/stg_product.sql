{{ config(materialized='view') }}

select
    product_id,
    product_type,
    product_name,
    price
from {{ source('ecoessentials_landing', 'product') }}