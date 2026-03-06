{{ config(materialized='table') }}

select
    row_number() over (order by store_id) as store_key,
    store_id,
    store_name,
    street,
    city,
    state
from {{ source('oliver', 'STORE') }}