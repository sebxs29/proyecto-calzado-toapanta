USE calzado_toapanta;

-- 1. Vista: Clientes Frecuentes

CREATE OR REPLACE VIEW vista_clientes_frecuentes AS
SELECT 
    c.id_cliente AS IdCliente,
    c.nombres AS Nombres,
    c.apellidos AS Apellidos,
    c.provincia AS Provincia,
    COUNT(v.id_venta) AS TotalCompras,
    COALESCE(SUM(v.total), 0) AS MontoAcumulado
FROM clientes c
LEFT JOIN ventas v ON c.id_cliente = v.id_cliente
GROUP BY 
    c.id_cliente, 
    c.nombres, 
    c.apellidos, 
    c.provincia
ORDER BY MontoAcumulado DESC;

SELECT * FROM vista_clientes_frecuentes;

-- 2. Vista: Ventas Consolidadas

CREATE OR REPLACE VIEW vista_ventas_consolidadas AS
SELECT 
    v.id_venta AS IdVenta,
    v.fecha_venta AS FechaVenta,
    CONCAT(c.nombres, ' ', c.apellidos) AS Cliente,
    CONCAT(e.nombres, ' ', e.apellidos) AS Vendedor,
    v.tipo_venta AS TipoVenta,
    v.subtotal AS Subtotal,
    v.descuento AS Descuento,
    v.total AS Total
FROM ventas v
INNER JOIN clientes c ON v.id_cliente = c.id_cliente
INNER JOIN empleados e ON v.id_empleado = e.id_empleado;

SELECT * FROM vista_ventas_consolidadas;

-- 3. Vista: Productos con Bajo Stock

CREATE OR REPLACE VIEW vista_productos_bajo_stock AS
SELECT 
    p.id_producto AS IdProducto,
    p.nombre_producto AS NombreProducto,
    cat.nombre_categoria AS Categoria,
    i.stock_actual AS StockActual,
    i.stock_minimo AS StockMinimo
FROM productos p
INNER JOIN inventario i ON p.id_producto = i.id_producto
INNER JOIN categorias cat ON p.id_categoria = cat.id_categoria
WHERE i.stock_actual <= i.stock_minimo;

SELECT * FROM vista_productos_bajo_stock;

-- 4. Vista: Promociones Aplicadas

CREATE OR REPLACE VIEW vista_promociones_aplicadas AS
SELECT 
    v.id_venta AS IdVenta,
    CONCAT(c.nombres, ' ', c.apellidos) AS Cliente,
    p.nombre_promocion AS Promocion,
    v.descuento AS DescuentoAplicado,
    v.fecha_venta AS FechaVenta
FROM ventas v
INNER JOIN clientes c ON v.id_cliente = c.id_cliente
INNER JOIN promociones p ON v.id_promocion = p.id_promocion
WHERE v.id_promocion IS NOT NULL;

SELECT * FROM vista_promociones_aplicadas;

-- 5. Vista: Devoluciones

CREATE OR REPLACE VIEW vista_devoluciones AS
SELECT 
    d.id_devolucion AS IdDevolucion,
    d.fecha_devolucion AS Fecha,
    CONCAT(c.nombres, ' ', c.apellidos) AS Cliente,
    p.nombre_producto AS Producto,
    d.cantidad AS Cantidad,
    d.motivo AS Motivo
FROM devoluciones d
INNER JOIN ventas v ON d.id_venta = v.id_venta
INNER JOIN clientes c ON v.id_cliente = c.id_cliente
INNER JOIN productos p ON d.id_producto = p.id_producto;

SELECT * FROM vista_devoluciones;

-- 6. Vista: Desempeño de Vendedores

CREATE OR REPLACE VIEW vista_desempeno_vendedores AS
SELECT 
    e.id_empleado AS IdEmpleado,
    CONCAT(e.nombres, ' ', e.apellidos) AS NombreEmpleado,
    COALESCE(vt.TotalVentas, 0) AS TotalVentas,
    COALESCE(vt.MontoGenerado, 0) AS MontoGenerado,
    COALESCE(dt.TotalDevoluciones, 0) AS TotalDevoluciones
FROM empleados e
LEFT JOIN (
    -- Subconsulta para totalizar ventas y monto por empleado sin duplicar
    SELECT 
        id_empleado, 
        COUNT(id_venta) AS TotalVentas, 
        SUM(total) AS MontoGenerado
    FROM ventas
    GROUP BY id_empleado
) vt ON e.id_empleado = vt.id_empleado
LEFT JOIN (
    -- Subconsulta para contar devoluciones asociadas a las ventas del empleado
    SELECT 
        v.id_empleado, 
        COUNT(d.id_devolucion) AS TotalDevoluciones
    FROM devoluciones d
    INNER JOIN ventas v ON d.id_venta = v.id_venta
    GROUP BY v.id_empleado
) dt ON e.id_empleado = dt.id_empleado
WHERE e.rol IN ('Vendedor', 'Administrador', 'Gerente'); 
SELECT * FROM vista_desempeno_vendedores;