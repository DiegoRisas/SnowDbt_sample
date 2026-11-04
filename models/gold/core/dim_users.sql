-- =============================================================================
-- dim_users
-- =============================================================================
-- Dimensión de usuarios. Grano: una fila por usuario.
-- =============================================================================

with users as (
    select * from {{ ref('slv_sql_server_dbo__users') }}
),

final as (
    select
          user_id
        , first_name
        , last_name
        , first_name || ' ' || last_name        as full_name
        , email
        , phone_number
        , address_id
        , created_at_utc                        as created_at_utc
        , updated_at_utc                        as updated_at_utc
        , date_load
    from users
)

select * from final