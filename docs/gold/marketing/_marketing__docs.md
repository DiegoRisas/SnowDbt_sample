{% docs purchase_segment %}
Segmento de compra del usuario según el número de pedidos que ha realizado.
Se usa en la capa Gold de marketing para agrupar usuarios en campañas de captación, reactivación y fidelización.
| Valor | Pedidos del usuario | Descripción |
|---|---|---|
| never_bought | 0 | Usuario registrado que nunca ha comprado. Objetivo de campañas de primera compra. |
| one_purchase | 1 | Ha comprado una sola vez. Objetivo de campañas de recompra. |
| two_purchases | 2 | Ya repite compra. Cliente en proceso de fidelización. |
| three_or_more | 3 o más | Cliente recurrente. Objetivo de programas de fidelidad. |
Los segmentos son excluyentes: cada usuario pertenece a uno solo.
{% enddocs %}