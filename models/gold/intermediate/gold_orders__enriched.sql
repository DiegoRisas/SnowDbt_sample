-- =============================================================================
-- gold_orders__enriched
-- =============================================================================
-- Capa Gold (Intermediate): Unifica la información de los pedidos con
-- los datos de las direcciones (addresses) y las promociones (promos).
-- =============================================================================

with orders as (
    select * from {{ ref('slv_sql_server_dbo__orders') }}
),

addresses as (
    select * from {{ ref('slv_sql_server_dbo__addresses') }}
),

promos as (
    select * from {{ ref('slv_sql_server_dbo__promos') }}
),

enriched_orders as (
    select
        -- Columnas base de Orders
        o.order_id,
        o.user_id,
        o.address_id,
        o.promo_id,
        o.created_at_utc,
        o.estimated_delivery_at_utc,
        o.delivered_at_utc,
        o.tracking_id,
        o.shipping_service,
        o.shipping_cost_usd,
        o.order_cost_usd,
        o.order_total_usd,
        o.order_status,
        
        -- Columnas de Addresses (desde slv_sql_server_dbo__addresses)
        a.country,
        a.state,
        a.zipcode,
        a.address_line,
        
        -- Columnas de Promos (desde promos / slv_promos)
        p.discount_usd as promo_discount_usd, 
        p.promo_status as promo_status

    from orders o
    left join addresses a 
        on o.address_id = a.address_id
    left join promos p 
        on o.promo_id = p.promo_id
)

select * from enriched_orders