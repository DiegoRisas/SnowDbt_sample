-- =============================================================================
-- fct_orders
-- =============================================================================
-- Hechos de pedidos (orders). Grano: una fila por pedido.
-- =============================================================================

with orders as (
    select * from {{ ref('slv_sql_server_dbo__orders') }}
),

final as (
    select
          order_id
        , user_id
        , address_id
        , promo_id
        , order_status
        , created_at_utc                        as order_at_utc
        , estimated_delivery_at_utc
        , delivered_at_utc
        , tracking_id
        , shipping_service
        , shipping_cost_usd
        , order_cost_usd
        , order_total_usd
        , date_load
    from orders
)

select * from final