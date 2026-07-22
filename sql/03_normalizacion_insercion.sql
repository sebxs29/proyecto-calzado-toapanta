USE calzado_toapanta;

-- NORMALIZACION E INSERCION DE DATOS

-- 1. CLIENTES

INSERT INTO clientes (
    cedula,
    nombres,
    apellidos,
    telefono,
    correo,
    provincia,
    fecha_nacimiento
)
SELECT DISTINCT
    cedula_cliente,
    nombres_cliente,
    apellidos_cliente,
    telefono_cliente,
    correo_cliente,
    provincia_cliente,
    STR_TO_DATE(fecha_nacimiento_cliente, '%Y-%m-%d')
FROM ventas_historicas_bruto;

-- 2. EMPLEADOS

INSERT INTO empleados (
    cedula,
    nombres,
    apellidos,
    cargo,
    rol,
    telefono,
    correo
)
SELECT DISTINCT
    cedula_empleado,
    nombres_empleado,
    apellidos_empleado,
    cargo_empleado,
    rol_empleado,
    telefono_empleado,
    correo_empleado
FROM ventas_historicas_bruto;

-- 3. PROVEEDORES

INSERT INTO proveedores (
    nombre_proveedor,
    pais,
    tipo_proveedor,
    telefono,
    correo
)
SELECT DISTINCT
    nombre_proveedor,
    pais_proveedor,
    tipo_proveedor,
    telefono_proveedor,
    correo_proveedor
FROM ventas_historicas_bruto;

-- 4. CATEGORIAS

INSERT INTO categorias (
    nombre_categoria,
    descripcion,
    estado
)
SELECT DISTINCT
    categoria_producto,
    CONCAT('Categoria de calzado ', categoria_producto),
    'Activa'
FROM ventas_historicas_bruto;

-- 5. PROMOCIONES

INSERT INTO promociones (
    nombre_promocion,
    porcentaje_descuento,
    fecha_inicio,
    fecha_fin,
    estado
)
SELECT DISTINCT
    nombre_promocion,
    CAST(porcentaje_descuento AS DECIMAL(5,2)),
    '2026-06-01',
    '2026-12-31',
    'Activa'
FROM ventas_historicas_bruto;

-- 6. PRODUCTOS

INSERT INTO productos (
    nombre_producto,
    tipo_producto,
    talla,
    color,
    precio,
    estado,
    id_categoria,
    id_proveedor
)
SELECT DISTINCT
    b.nombre_producto,
    b.tipo_producto,
    b.talla,
    b.color,
    CAST(b.precio_unitario AS DECIMAL(10,2)),
    'Activo',
    c.id_categoria,
    p.id_proveedor
FROM ventas_historicas_bruto b
INNER JOIN categorias c
    ON b.categoria_producto = c.nombre_categoria
INNER JOIN proveedores p
    ON b.nombre_proveedor = p.nombre_proveedor;

-- 7. VENTAS
-- Una venta corresponde a una factura.
-- La tabla bruta tiene 200 filas, pero solo 50 facturas.
-- Por eso se agrupa por nro_factura.

INSERT INTO ventas (
    nro_factura,
    fecha_venta,
    tipo_venta,
    subtotal,
    descuento,
    iva,
    total,
    id_cliente,
    id_empleado,
    id_promocion
)
SELECT
    b.nro_factura,
    STR_TO_DATE(b.fecha_venta, '%Y-%m-%d'),
    b.tipo_venta,
    SUM(CAST(b.subtotal_linea AS DECIMAL(10,2))) AS subtotal,
    SUM(CAST(b.descuento_linea AS DECIMAL(10,2))) AS descuento,
    SUM(CAST(b.iva_linea AS DECIMAL(10,2))) AS iva,
    SUM(CAST(b.total_linea AS DECIMAL(10,2))) AS total,
    c.id_cliente,
    e.id_empleado,
    pr.id_promocion
FROM ventas_historicas_bruto b
INNER JOIN clientes c
    ON b.cedula_cliente = c.cedula
INNER JOIN empleados e
    ON b.cedula_empleado = e.cedula
INNER JOIN promociones pr
    ON b.nombre_promocion = pr.nombre_promocion
GROUP BY
    b.nro_factura,
    b.fecha_venta,
    b.tipo_venta,
    c.id_cliente,
    e.id_empleado,
    pr.id_promocion;

-- 8. DETALLE_VENTA
-- Cada fila de la tabla bruta representa un producto vendido.
-- Por eso detalle_venta queda con 200 registros.

INSERT INTO detalle_venta (
    id_venta,
    id_producto,
    cantidad,
    precio_unitario,
    subtotal
)
SELECT
    v.id_venta,
    p.id_producto,
    CAST(b.cantidad AS UNSIGNED),
    CAST(b.precio_unitario AS DECIMAL(10,2)),
    CAST(b.subtotal_linea AS DECIMAL(10,2))
FROM ventas_historicas_bruto b
INNER JOIN ventas v
    ON b.nro_factura = v.nro_factura
INNER JOIN productos p
    ON b.nombre_producto = p.nombre_producto
    AND b.talla = p.talla
    AND b.color = p.color;

-- 9. INVENTARIO
-- Se toma el ultimo stock_despues registrado por cada producto.

INSERT INTO inventario (
    id_producto,
    stock_actual,
    stock_minimo,
    ubicacion
)
SELECT
    p.id_producto,
    CAST(b.stock_despues AS UNSIGNED) AS stock_actual,
    20 AS stock_minimo,
    'Bodega principal' AS ubicacion
FROM ventas_historicas_bruto b
INNER JOIN (
    SELECT
        nombre_producto,
        talla,
        color,
        MAX(CAST(id_registro AS UNSIGNED)) AS ultimo_registro
    FROM ventas_historicas_bruto
    GROUP BY nombre_producto, talla, color
) ult
    ON b.nombre_producto = ult.nombre_producto
    AND b.talla = ult.talla
    AND b.color = ult.color
    AND CAST(b.id_registro AS UNSIGNED) = ult.ultimo_registro
INNER JOIN productos p
    ON b.nombre_producto = p.nombre_producto
    AND b.talla = p.talla
    AND b.color = p.color;

-- 10. MOVIMIENTOS_INVENTARIO
-- Se registra una salida de inventario por cada producto vendido.

INSERT INTO movimientos_inventario (
    id_producto,
    tipo_movimiento,
    cantidad,
    fecha_movimiento,
    motivo,
    id_empleado
)
SELECT
    p.id_producto,
    b.tipo_movimiento,
    CAST(b.cantidad AS UNSIGNED),
    STR_TO_DATE(b.fecha_venta, '%Y-%m-%d'),
    b.motivo_movimiento,
    e.id_empleado
FROM ventas_historicas_bruto b
INNER JOIN productos p
    ON b.nombre_producto = p.nombre_producto
    AND b.talla = p.talla
    AND b.color = p.color
INNER JOIN empleados e
    ON b.cedula_empleado = e.cedula;

-- 11. DEVOLUCIONES

INSERT INTO devoluciones (
    id_venta,
    id_producto,
    fecha_devolucion,
    cantidad,
    motivo,
    estado
)
SELECT
    v.id_venta,
    p.id_producto,
    STR_TO_DATE(b.fecha_devolucion, '%Y-%m-%d'),
    CAST(b.cantidad_devolucion AS UNSIGNED),
    b.motivo_devolucion,
    'Procesada'
FROM ventas_historicas_bruto b
INNER JOIN ventas v
    ON b.nro_factura = v.nro_factura
INNER JOIN productos p
    ON b.nombre_producto = p.nombre_producto
    AND b.talla = p.talla
    AND b.color = p.color
WHERE b.tiene_devolucion = 'Si';

-- 12. QUEJAS

INSERT INTO quejas (
    id_cliente,
    fecha_queja,
    tipo_queja,
    descripcion,
    estado
)
SELECT
    c.id_cliente,
    STR_TO_DATE(b.fecha_venta, '%Y-%m-%d'),
    b.tipo_queja,
    b.descripcion_queja,
    b.estado_queja
FROM ventas_historicas_bruto b
INNER JOIN clientes c
    ON b.cedula_cliente = c.cedula
WHERE b.tiene_queja = 'Si';

SELECT 'clientes' AS tabla, COUNT(*) AS total FROM clientes
UNION ALL
SELECT 'empleados', COUNT(*) FROM empleados
UNION ALL
SELECT 'proveedores', COUNT(*) FROM proveedores
UNION ALL
SELECT 'categorias', COUNT(*) FROM categorias
UNION ALL
SELECT 'productos', COUNT(*) FROM productos
UNION ALL
SELECT 'promociones', COUNT(*) FROM promociones
UNION ALL
SELECT 'ventas', COUNT(*) FROM ventas
UNION ALL
SELECT 'detalle_venta', COUNT(*) FROM detalle_venta
UNION ALL
SELECT 'inventario', COUNT(*) FROM inventario
UNION ALL
SELECT 'movimientos_inventario', COUNT(*) FROM movimientos_inventario
UNION ALL
SELECT 'devoluciones', COUNT(*) FROM devoluciones
UNION ALL
SELECT 'quejas', COUNT(*) FROM quejas;