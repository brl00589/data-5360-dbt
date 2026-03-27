{{ config(materialized='view') }}

select
    order_line_id,
    order_id,
    product_id,
    campaign_id,
    quantity,
    discount,
    promotional_campaign,
    price_after_discount
from {{ source('ecoessentials_landing', 'order_line') }}