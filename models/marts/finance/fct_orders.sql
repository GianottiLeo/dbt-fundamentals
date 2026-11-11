
with payments as (
select * from {{ref('stg_stripe__payments')}}
),
customers as (
select * from {{ref('stg_jaffle_shop__customers')}}
),
orders as (
select * from {{ref('stg_jaffle_shop__orders')}}
),
final as (
select
    p.order_id,
    c.customer_id,
    p.amount
from payments p
left join orders o
on o.order_id = p.order_id
left join customers c
on c.customer_id = o.customer_id
)
select * from final