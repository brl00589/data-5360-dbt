{{ config(materialized='table') }}

select
    c.cust_key,
    d.date_key,
    s.store_key,
    p.product_key,
    ol.quantity,
    ol.quantity * ol.unit_price as dollars_sold,
    ol.unit_price
from {{ source('oliver', 'ORDERLINE') }} ol
join {{ source('oliver', 'ORDERS') }} o
    on ol.order_id = o.order_id
join {{ ref('oliver_dim_customer') }} c
    on o.customer_id = c.customerid
join {{ ref('oliver_dim_date') }} d
    on cast(o.order_date as date) = d.date_id
join {{ ref('oliver_dim_store') }} s
    on o.store_id = s.store_id
join {{ ref('oliver_dim_product') }} p
    on ol.product_id = p.product_id