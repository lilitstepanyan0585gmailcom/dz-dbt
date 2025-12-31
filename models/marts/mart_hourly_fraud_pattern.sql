select
    dow,
    transaction_hour,

    count() as tx_cnt,
    sum(target) as fraud_cnt,
    (sum(target) / count()) * 100 as fraud_rate_pct,
    avg(amount) as avg_amount
from {{ ref('stg_transactions') }}
group by
    dow,
    transaction_hour
order by
    dow,
    transaction_hour
