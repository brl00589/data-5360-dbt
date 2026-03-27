{{ config(
    materialized = 'table',
    schema = 'dw_ecoessentials'
) }}

SELECT
    {{ dbt_utils.generate_surrogate_key(['campaign_id']) }} as campaign_key,
    campaign_id,
    campaign_name
FROM {{ ref('stg_promotional_campaign') }}