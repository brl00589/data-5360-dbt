{{ config(materialized='view') }}

select
    order_id,
    customer_id,
    order_timestamp
from {{ source('ecoessentials_landing', 'order_tbl') }}