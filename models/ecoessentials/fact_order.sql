{{ config(
    materialized = 'table',
    schema = 'dw_ecoessentials'
) }}

SELECT
    o.order_id,
    c.customer_key,
    cm.campaign_key,
    p.product_key,
    d.date_key,
    ol.quantity,
    ol.price_after_discount as price,
    ol.discount
FROM {{ ref('stg_order_line') }} as ol
INNER JOIN {{ ref('stg_order') }} as o
    ON ol.order_id = o.order_id
INNER JOIN {{ ref('dim_customer') }} as c
    ON o.customer_id = c.customer_id
INNER JOIN {{ ref('dim_campaign') }} as cm
    ON ol.campaign_id = cm.campaign_id
INNER JOIN {{ ref('dim_product') }} as p
    ON ol.product_id = p.product_id
INNER JOIN {{ ref('dim_date') }} as d
    ON cast(o.order_timestamp as date) = d.date_day