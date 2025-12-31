with src as (
    select
        transaction_time,
        toDate(transaction_time) as transaction_date,
        toHour(transaction_time) as transaction_hour,
        toDayOfWeek(transaction_time) as dow, -- 1=Mon ... 7=Sun (ClickHouse)
        merch,
        cat_id,
        toFloat64(amount) as amount,
        name_1,
        name_2,
        gender,
        us_state,
        lat,
        lon,
        merchant_lat,
        merchant_lon,
        toUInt8(target) as target
    from {{ source('transactions_db', 'transactions') }}
)

select
    *,
    {{ amount_bucket('amount') }} as amount_bucket,
    amount >= 200 as is_large_amount
from src
