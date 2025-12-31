select
    cat_id,

    count() as tx_cnt,
    sum(target) as fraud_cnt,
    (sum(target) / count()) * 100 as fraud_rate_pct,

    sum(amount) as total_amount,
    sum(if(target = 1, amount, 0)) as fraud_amount
from {{ ref('stg_transactions') }}
group by cat_id
order by fraud_rate_pct desc
