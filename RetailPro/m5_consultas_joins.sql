--- Consulta 1: Vista base del proyecto (INNER JOIN)

SELECT
    v.fecha_venta AS Fecha,
    c.id_cliente AS Id_Cliente,
    c.nombre AS Cliente,
    c.ciudad AS Ciudad,
    p.nombre_producto AS Producto,
    cat.nombre_categoria AS Categoria,
    v.cantidad AS Cantidad,
    v.precio_unitario AS Precio_Unitario,
    v.cantidad * v.precio_unitario AS Total_Venta
FROM ventas AS v
INNER JOIN clientes AS c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos AS p
    ON v.id_producto = p.id_producto
INNER JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria
ORDER BY v.fecha_venta;


--- Consulta 2: Clientes sin ventas (LEF JOIN)

SELECT
    c.nombre AS Cliente,
    c.email AS Email,
    c.fecha_registro AS Fecha_Registro
FROM clientes AS c
LEFT JOIN ventas AS v
    ON c.id_cliente = v.id_cliente
WHERE v.id_cliente IS NULL;


--- Consulta 3: Productos sin ventas (LEFT JOIN)


SELECT
    p.nombre_producto AS Producto,
    c.nombre_categoria AS Categoria,
    p.precio AS Precio
FROM productos AS p
INNER JOIN categorias AS c
    ON p.id_categoria = c.id_categoria
LEFT JOIN ventas AS v
    ON p.id_producto = v.id_producto
WHERE v.id_producto IS NULL;


--- Consulta 4: Consolidado por canal (UNION ALL)

SELECT
    Canal,
    SUM(Total) AS Total_Facturado
FROM (

    SELECT
        fecha_venta AS Fecha,
        cantidad * precio_unitario AS Total,
        'soloPC.com' AS Canal
    FROM ventas
    WHERE precio_unitario > 1000

    UNION ALL

    SELECT
        fecha_venta AS Fecha,
        cantidad * precio_unitario AS Total,
        'Tienda general' AS Canal
    FROM ventas
    WHERE precio_unitario <= 1000

) AS ventas_por_canal
GROUP BY Canal;