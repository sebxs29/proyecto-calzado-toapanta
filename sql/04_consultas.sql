USE calzado_toapanta;

-- SCRIPT 04: CONSULTAS SQL

-- CONSULTA 1: Listar todos los clientes registrados
SELECT
    id_cliente,
    cedula,
    nombres,
    apellidos,
    telefono,
    correo,
    provincia
FROM clientes
ORDER BY apellidos, nombres;


-- CONSULTA 2: Mostrar productos disponibles con categoria, proveedor y stock
SELECT
    p.id_producto,
    p.nombre_producto,
    c.nombre_categoria,
    pr.nombre_proveedor,
    p.talla,
    p.color,
    p.precio,
    i.stock_actual,
    i.stock_minimo
FROM productos p
INNER JOIN categorias c
    ON p.id_categoria = c.id_categoria
INNER JOIN proveedores pr
    ON p.id_proveedor = pr.id_proveedor
INNER JOIN inventario i
    ON p.id_producto = i.id_producto
ORDER BY p.nombre_producto;


-- CONSULTA 3: Consultar ventas por rango de fechas
SELECT
    v.id_venta,
    v.nro_factura,
    v.fecha_venta,
    CONCAT(c.nombres, ' ', c.apellidos) AS cliente,
    CONCAT(e.nombres, ' ', e.apellidos) AS empleado,
    v.subtotal,
    v.descuento,
    v.iva,
    v.total
FROM ventas v
INNER JOIN clientes c
    ON v.id_cliente = c.id_cliente
INNER JOIN empleados e
    ON v.id_empleado = e.id_empleado
WHERE v.fecha_venta BETWEEN '2026-06-01' AND '2026-12-31'
ORDER BY v.fecha_venta;


-- CONSULTA 4: Listar proveedores registrados
SELECT
    id_proveedor,
    nombre_proveedor,
    pais,
    tipo_proveedor,
    telefono,
    correo
FROM proveedores
ORDER BY nombre_proveedor;


-- CONSULTA 5: Mostrar empleados agrupados por rol
SELECT
    rol,
    COUNT(*) AS total_empleados
FROM empleados
GROUP BY rol
ORDER BY total_empleados DESC;


-- CONSULTA 6: Mostrar clientes con sus compras
SELECT
    c.id_cliente,
    CONCAT(c.nombres, ' ', c.apellidos) AS cliente,
    v.nro_factura,
    v.fecha_venta,
    v.total
FROM clientes c
INNER JOIN ventas v
    ON c.id_cliente = v.id_cliente
ORDER BY c.id_cliente, v.fecha_venta;


-- CONSULTA 7: Mostrar ventas con el vendedor o empleado responsable
SELECT
    v.nro_factura,
    v.fecha_venta,
    CONCAT(e.nombres, ' ', e.apellidos) AS empleado,
    e.rol,
    v.total
FROM ventas v
INNER JOIN empleados e
    ON v.id_empleado = e.id_empleado
ORDER BY v.fecha_venta;


-- CONSULTA 8: Mostrar detalle de productos vendidos por factura
SELECT
    v.nro_factura,
    v.fecha_venta,
    p.nombre_producto,
    p.talla,
    p.color,
    dv.cantidad,
    dv.precio_unitario,
    dv.subtotal
FROM detalle_venta dv
INNER JOIN ventas v
    ON dv.id_venta = v.id_venta
INNER JOIN productos p
    ON dv.id_producto = p.id_producto
ORDER BY v.nro_factura, p.nombre_producto;


-- CONSULTA 9: Mostrar productos con su proveedor
SELECT
    p.nombre_producto,
    p.tipo_producto,
    p.talla,
    p.color,
    p.precio,
    pr.nombre_proveedor,
    pr.pais,
    pr.tipo_proveedor
FROM productos p
INNER JOIN proveedores pr
    ON p.id_proveedor = pr.id_proveedor
ORDER BY pr.nombre_proveedor, p.nombre_producto;


-- CONSULTA 10: Mostrar devoluciones con cliente, factura y producto
SELECT
    d.id_devolucion,
    v.nro_factura,
    CONCAT(c.nombres, ' ', c.apellidos) AS cliente,
    p.nombre_producto,
    d.fecha_devolucion,
    d.cantidad,
    d.motivo,
    d.estado
FROM devoluciones d
INNER JOIN ventas v
    ON d.id_venta = v.id_venta
INNER JOIN clientes c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos p
    ON d.id_producto = p.id_producto
ORDER BY d.fecha_devolucion;


-- CONSULTA 11: Calcular total vendido por empleado

SELECT
    e.id_empleado,
    CONCAT(e.nombres, ' ', e.apellidos) AS empleado,
    e.rol,
    COUNT(v.id_venta) AS cantidad_ventas,
    SUM(v.total) AS total_vendido
FROM empleados e
INNER JOIN ventas v
    ON e.id_empleado = v.id_empleado
GROUP BY
    e.id_empleado,
    e.nombres,
    e.apellidos,
    e.rol
ORDER BY total_vendido DESC;


-- CONSULTA 12: Mostrar productos mas vendidos
SELECT
    p.id_producto,
    p.nombre_producto,
    p.talla,
    p.color,
    SUM(dv.cantidad) AS cantidad_vendida,
    SUM(dv.subtotal) AS total_generado
FROM productos p
INNER JOIN detalle_venta dv
    ON p.id_producto = dv.id_producto
GROUP BY
    p.id_producto,
    p.nombre_producto,
    p.talla,
    p.color
ORDER BY cantidad_vendida DESC;


-- CONSULTA 13: Calcular ventas por mes
SELECT
    YEAR(fecha_venta) AS anio,
    MONTH(fecha_venta) AS mes,
    COUNT(*) AS cantidad_ventas,
    SUM(subtotal) AS subtotal_vendido,
    SUM(descuento) AS total_descuentos,
    SUM(iva) AS total_iva,
    SUM(total) AS total_vendido
FROM ventas
GROUP BY
    YEAR(fecha_venta),
    MONTH(fecha_venta)
ORDER BY anio, mes;


-- CONSULTA 14: Calcular total de compras por cliente
SELECT
    c.id_cliente,
    CONCAT(c.nombres, ' ', c.apellidos) AS cliente,
    COUNT(v.id_venta) AS cantidad_compras,
    SUM(v.total) AS total_comprado
FROM clientes c
INNER JOIN ventas v
    ON c.id_cliente = v.id_cliente
GROUP BY
    c.id_cliente,
    c.nombres,
    c.apellidos
ORDER BY total_comprado DESC;


-- CONSULTA 15: Mostrar devoluciones por empleado responsable de la venta
SELECT
    e.id_empleado,
    CONCAT(e.nombres, ' ', e.apellidos) AS empleado,
    COUNT(d.id_devolucion) AS total_devoluciones
FROM empleados e
INNER JOIN ventas v
    ON e.id_empleado = v.id_empleado
INNER JOIN devoluciones d
    ON v.id_venta = d.id_venta
GROUP BY
    e.id_empleado,
    e.nombres,
    e.apellidos
ORDER BY total_devoluciones DESC;


-- CONSULTA 16: Clientes con compras superiores al promedio
-- Subconsulta
SELECT
    c.id_cliente,
    CONCAT(c.nombres, ' ', c.apellidos) AS cliente,
    SUM(v.total) AS total_comprado
FROM clientes c
INNER JOIN ventas v
    ON c.id_cliente = v.id_cliente
GROUP BY
    c.id_cliente,
    c.nombres,
    c.apellidos
HAVING SUM(v.total) > (
    SELECT AVG(total_cliente)
    FROM (
        SELECT
            SUM(total) AS total_cliente
        FROM ventas
        GROUP BY id_cliente
    ) AS promedio_clientes
)
ORDER BY total_comprado DESC;


-- CONSULTA 17: Productos con precio mayor al promedio
-- Subconsulta
SELECT
    id_producto,
    nombre_producto,
    talla,
    color,
    precio
FROM productos
WHERE precio > (
    SELECT AVG(precio)
    FROM productos
)
ORDER BY precio DESC;


-- CONSULTA 18: Empleados con ventas superiores al promedio
-- Subconsulta
SELECT
    e.id_empleado,
    CONCAT(e.nombres, ' ', e.apellidos) AS empleado,
    SUM(v.total) AS total_vendido
FROM empleados e
INNER JOIN ventas v
    ON e.id_empleado = v.id_empleado
GROUP BY
    e.id_empleado,
    e.nombres,
    e.apellidos
HAVING SUM(v.total) > (
    SELECT AVG(total_empleado)
    FROM (
        SELECT
            SUM(total) AS total_empleado
        FROM ventas
        GROUP BY id_empleado
    ) AS promedio_empleados
)
ORDER BY total_vendido DESC;


-- CONSULTA 19: Productos que nunca se han vendido
-- LEFT JOIN
SELECT
    p.id_producto,
    p.nombre_producto,
    p.talla,
    p.color,
    p.precio
FROM productos p
LEFT JOIN detalle_venta dv
    ON p.id_producto = dv.id_producto
WHERE dv.id_producto IS NULL;


-- CONSULTA 20: Clientes que no han realizado compras
-- LEFT JOIN
SELECT
    c.id_cliente,
    c.cedula,
    CONCAT(c.nombres, ' ', c.apellidos) AS cliente,
    c.telefono,
    c.correo
FROM clientes c
LEFT JOIN ventas v
    ON c.id_cliente = v.id_cliente
WHERE v.id_cliente IS NULL;