{{ config(materialized='table') }}

select
    fs.cust_key,
    c.customerid,
    c.firstname,
    c.lastname,
    c.email,
    c.phonenumber,
    c.state as customer_state,

    fs.date_key,
    d.date_id,
    d.dayofweek,
    d.month,
    d.quarter,
    d.year,

    fs.store_key,
    s.store_id,
    s.store_name,
    s.street,
    s.city,
    s.state as store_state,

    fs.product_key,
    p.product_id,
    p.product_name,
    p.description,

    fs.quantity,
    fs.dollars_sold,
    fs.unit_price
from {{ ref('fact_sales') }} fs
join {{ ref('oliver_dim_customer') }} c
    on fs.cust_key = c.cust_key
join {{ ref('oliver_dim_date') }} d
    on fs.date_key = d.date_key
join {{ ref('oliver_dim_store') }} s
    on fs.store_key = s.store_key
join {{ ref('oliver_dim_product') }} p
    on fs.product_key = p.product_key