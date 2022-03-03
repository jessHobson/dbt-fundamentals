with payments as (

    select * from {{ ref('stg_payments')}}

),

orders as (

    select * from {{ ref('stg_orders') }}

),
customer_orders as (

    select
        a.customer_id,
        a.order_id,
        b.amount

    from orders a
    left join payments b 
    on a.order_id = b.order_id

)




select * from customer_orders