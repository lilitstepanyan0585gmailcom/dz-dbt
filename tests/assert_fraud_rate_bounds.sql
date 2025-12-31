select *
from {{ ref('mart_fraud_by_category') }}
where fraud_rate_pct < 0 or fraud_rate_pct > 100
