select
    transaction_date,
    us_state,

    count() as tx_cnt,
    sum(amount) as total_amount,
    avg(amount) as avg_check,
    quantile(0.95)(amount) as p95_amount,
    avg(if(is_large_amount, 1, 0)) as large_tx_share
from {{ ref('stg_transactions') }}
group by
    transaction_date,
    us_state
