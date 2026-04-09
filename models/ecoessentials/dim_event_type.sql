{{ config(
    materialized = 'table',
    schema = 'dw_ecoessentials'
) }}

SELECT
    {{ dbt_utils.generate_surrogate_key(['eventtype']) }} as event_type_key,
    eventtype
FROM {{ ref('stg_marketingemails') }}
where eventtype is not null
group by eventtype