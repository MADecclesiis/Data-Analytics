--- Consulta 1: Resumen ejecutivo mensual

SELECT
    MONTH(fecha_venta) AS Mes,
    SUM(cantidad * precio_unitario) AS Total_Facturado,
    COUNT(*) AS Cantidad_Pedidos,
    AVG(cantidad * precio_unitario) AS Ticket_Promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY Mes;


--- Consulta 2: Ranking de productos

SELECT TOP 5
    id_producto,
    SUM(cantidad) AS Unidades_Vendidas,
    SUM(cantidad * precio_unitario) AS Total_Facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;


--- Consulta 3: Clientes recurrentes

SELECT
    id_cliente,
    COUNT(*) AS Cantidad_Pedidos,
    SUM(cantidad * precio_unitario) AS Total_Gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY total_gastado DESC;


--- Consulta 4: Meses por encima / por debajo del promedio


SELECT
    Mes,
    Total_Facturado,
    CASE
        WHEN total_facturado > (
            SELECT AVG(total_mensual)
            FROM (
                SELECT
                    SUM(cantidad * precio_unitario) AS Total_Mensual
                FROM ventas
                GROUP BY MONTH(fecha_venta)
            ) AS promedio_mensual
        )
        THEN 'Por encima'
        ELSE 'Por debajo'
    END AS Comparacion_Promedio
FROM (
    SELECT
        MONTH(fecha_venta) AS Mes,
        SUM(cantidad * precio_unitario) AS Total_Facturado
    FROM ventas
    GROUP BY MONTH(fecha_venta)
) AS facturacion_mensual
ORDER BY Mes;


/*

HALLAZGOS

1) El producto con el Id_producto 1 genero el 55,9% de la facturacion total del mes,
   con 3 unidades vendidas a $1200 c/u.

2) El producto con el Id_producto 2 es el que vendio mas unidades de los que estan en el top 5,
   con 13 unidades, pero tambien es el que menos facturo de los que estan en el top.

3) Los clientes con el Id_cliente 1 y 5 gastaron $4740 entre los dos, el cual esto
   equivale al 73,6% de la facturacion total.


OBRSERVACION

-  En la consulta 4, como solo existen datos de facturacion de un mismo mes,
   coincide con el promedio general. La consulta lo clasifica como "Por debajo", por que
   el case solo contemplaba dos categorias, sin tener en cuenta, en este caso, igualdad.

*/