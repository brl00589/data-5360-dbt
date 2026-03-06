{{ config(materialized='table') }}

select
    row_number() over (order by product_id) as product_key,
    product_id,
    product_name,
    description
from {{ source('oliver', 'PRODUCT') }}