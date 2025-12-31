select
    us_state,

    count() as tx_cnt,
    sum(target) as fraud_cnt,
    (sum(target) / count()) * 100 as fraud_rate_pct,

    countDistinct(concat(name_1, ' ', name_2)) as unique_customers,
    countDistinct(merch) as unique_merchants,

    sum(amount) as total_amount,
    sum(if(target = 1, amount, 0)) as fraud_amount
from {{ ref('stg_transactions') }}
group by us_state
order by fraud_rate_pct desc
