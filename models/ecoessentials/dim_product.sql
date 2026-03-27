{{ config(
    materialized = 'table',
    schema = 'dw_ecoessentials'
) }}

SELECT
    {{ dbt_utils.generate_surrogate_key(['product_id']) }} as product_key,
    product_id,
    product_type,
    product_name
FROM {{ ref('stg_product') }}