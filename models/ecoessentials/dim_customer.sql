{{ config(
    materialized = 'table',
    schema = 'dw_ecoessentials'
) }}

with customer_base as (
    select
        customer_id,
        customer_first_name,
        customer_last_name,
        customer_email,
        customer_phone,
        customer_address,
        customer_city,
        customer_state,
        customer_zip,
        customer_country
    from {{ ref('stg_customer') }}
),

subscriber_base as (
    select
        subscriberid,
        min(customerid) as customer_id,
        min(subscriberemail) as subscriber_email,
        min(subscriberfirstname) as subscriber_first_name,
        min(subscriberlastname) as subscriber_last_name
    from {{ ref('stg_marketingemails') }}
    group by subscriberid
),

combined as (
    select
        coalesce(c.customer_id, s.customer_id) as customer_id,
        s.subscriberid,
        coalesce(c.customer_first_name, s.subscriber_first_name) as customer_first_name,
        coalesce(c.customer_last_name, s.subscriber_last_name) as customer_last_name,
        coalesce(c.customer_email, s.subscriber_email) as customer_email,
        c.customer_phone,
        c.customer_address,
        c.customer_city,
        c.customer_state,
        c.customer_zip,
        c.customer_country
    from customer_base c
    full outer join subscriber_base s
        on c.customer_id = s.customer_id
)

select
    {{ dbt_utils.generate_surrogate_key([
        "coalesce(cast(customer_id as varchar), '')",
        "coalesce(cast(subscriberid as varchar), '')"
    ]) }} as customer_key,
    customer_id,
    subscriberid,
    customer_first_name,
    customer_last_name,
    customer_email,
    customer_phone,
    customer_address,
    customer_city,
    customer_state,
    customer_zip,
    customer_country
from combined