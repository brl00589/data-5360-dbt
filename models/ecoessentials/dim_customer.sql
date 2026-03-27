{{ config(
    materialized = 'table',
    schema = 'dw_ecoessentials'
) }}

SELECT
    {{ dbt_utils.generate_surrogate_key(['c.customer_id']) }} as customer_key,
    c.customer_id,
    me.subscriberid,
    c.customer_first_name,
    c.customer_last_name,
    c.customer_email,
    c.customer_phone,
    c.customer_address,
    c.customer_city,
    c.customer_state,
    c.customer_zip,
    c.customer_country
FROM {{ ref('stg_customer') }} as c
LEFT JOIN (
    SELECT
        customerid,
        min(subscriberid) as subscriberid
    FROM {{ ref('stg_marketingemails') }}
    WHERE customerid is not null
    GROUP BY customerid
) as me
    ON c.customer_id = me.customerid