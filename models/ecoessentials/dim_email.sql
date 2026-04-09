{{ config(
    materialized = 'table',
    schema = 'dw_ecoessentials'
) }}

SELECT distinct
    {{ dbt_utils.generate_surrogate_key(['emailid']) }} as email_key,
    emailid,
    emailname
FROM {{ ref('stg_marketingemails') }}
where emailid is not null