{{ config(
    materialized = 'table',
    schema = 'dw_ecoessentials'
) }}

SELECT
    e.email_key,
    cm.campaign_key,
    et.event_type_key,
    c.customer_key,
    d.date_key,
    me.eventtimestamp as event_timestamp
FROM {{ ref('stg_marketingemails') }} as me
INNER JOIN {{ ref('dim_event_type') }} as et
    ON me.eventtype = et.eventtype
INNER JOIN {{ ref('dim_email') }} as e
    ON me.emailid = e.emailid
INNER JOIN {{ ref('dim_customer') }} as c
    ON me.customerid = c.customer_id
INNER JOIN {{ ref('dim_campaign') }} as cm
    ON me.campaignid = cm.campaign_id
INNER JOIN {{ ref('dim_date') }} as d
    ON cast(me.eventtimestamp as date) = d.date_day