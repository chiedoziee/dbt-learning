with payments as (

    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status,
        {{ cents_to_dollars( 'amount' ), 4}} as amount, -- rounding off in the table/view file overrides the decimal place round off in the macro file
        created

    from {{ source('stripe', 'payment')}}

)

select * from payments 