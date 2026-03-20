select
    certification_completion_id,
    first_name,
    last_name,
    email,
    employee_id,
    parse_json(certification_json):certification_name::string as certification_name,
    parse_json(certification_json):certification_cost::number as certification_cost,
    parse_json(certification_json):certification_awarded_date::date as certification_awarded_date
from {{ source('oliver', 'EMPLOYEE_CERTIFICATIONS') }}