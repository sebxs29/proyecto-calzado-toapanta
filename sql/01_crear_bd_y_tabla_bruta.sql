CREATE DATABASE IF NOT EXISTS calzado_toapanta
CHARACTER SET utf8mb4
COLLATE utf8mb4_spanish_ci;

USE calzado_toapanta;

DROP TABLE IF EXISTS ventas_historicas_bruto;

CREATE TABLE ventas_historicas_bruto (
    id_registro VARCHAR(20),
    nro_factura VARCHAR(20),
    fecha_venta VARCHAR(20),
    tipo_venta VARCHAR(50),

    cedula_cliente VARCHAR(20),
    nombres_cliente VARCHAR(100),
    apellidos_cliente VARCHAR(100),
    telefono_cliente VARCHAR(20),
    correo_cliente VARCHAR(150),
    provincia_cliente VARCHAR(100),
    fecha_nacimiento_cliente VARCHAR(20),

    cedula_empleado VARCHAR(20),
    nombres_empleado VARCHAR(100),
    apellidos_empleado VARCHAR(100),
    cargo_empleado VARCHAR(100),
    rol_empleado VARCHAR(100),
    telefono_empleado VARCHAR(20),
    correo_empleado VARCHAR(150),

    nombre_producto VARCHAR(150),
    tipo_producto VARCHAR(50),
    categoria_producto VARCHAR(100),
    talla VARCHAR(20),
    color VARCHAR(50),
    precio_unitario VARCHAR(20),

    nombre_proveedor VARCHAR(150),
    pais_proveedor VARCHAR(100),
    tipo_proveedor VARCHAR(100),
    telefono_proveedor VARCHAR(20),
    correo_proveedor VARCHAR(150),

    cantidad VARCHAR(20),
    subtotal_linea VARCHAR(20),

    nombre_promocion VARCHAR(150),
    porcentaje_descuento VARCHAR(20),
    descuento_linea VARCHAR(20),
    iva_linea VARCHAR(20),
    total_linea VARCHAR(20),

    stock_antes VARCHAR(20),
    stock_despues VARCHAR(20),
    tipo_movimiento VARCHAR(50),
    motivo_movimiento VARCHAR(150),

    tiene_devolucion VARCHAR(10),
    fecha_devolucion VARCHAR(20),
    cantidad_devolucion VARCHAR(20),
    motivo_devolucion VARCHAR(150),

    tiene_queja VARCHAR(10),
    tipo_queja VARCHAR(50),
    descripcion_queja TEXT,
    estado_queja VARCHAR(50)
);

USE calzado_toapanta;

SELECT COUNT(*) AS total_registros
FROM ventas_historicas_bruto;

SELECT *
FROM ventas_historicas_bruto
LIMIT 10;
