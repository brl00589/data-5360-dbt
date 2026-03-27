{{ config(materialized='view') }}

select
    campaign_id,
    campaign_name,
    campaign_discount
from {{ source('ecoessentials_landing', 'promotional_campaign') }}