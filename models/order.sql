WITH stg_payment AS(
    SELECT * FROM {{ ref('stg_payment') }}
),
stg_orders as (
    select * from  {{ ref('stg_orders') }}
),
stg_customers as (
    select * from  {{ ref('stg_customers') }}
)

select so.order_id,
sc.customer_id,
sp.amount
from stg_customers sc
inner join stg_orders so on sc.customer_id = so.customer_id
left outer join stg_payment sp on so.order_id = sp.order_id