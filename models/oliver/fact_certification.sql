select
    de.employee_key,
    dd.date_key,
    sec.certification_name,
    sec.certification_cost
from {{ ref('stg_employee_certifications') }} sec
join {{ ref('oliver_dim_employee') }} de
    on sec.employee_id = de.employeeid
join {{ ref('oliver_dim_date') }} dd
    on sec.certification_awarded_date = dd.date_id