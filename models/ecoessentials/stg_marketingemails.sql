{{ config(materialized='view') }}

select
    emaileventid,
    emailid,
    emailname,
    campaignid,
    campaignname,
    try_to_number(nullif(customerid, 'NULL')) as customerid,
    nullif(trim(subscriberid), 'NULL') as subscriberid,
    subscriberemail,
    subscriberfirstname,
    subscriberlastname,
    sendtimestamp,
    eventtype,
    eventtimestamp
from {{ source('ecoemails_landing', 'marketingemails') }}