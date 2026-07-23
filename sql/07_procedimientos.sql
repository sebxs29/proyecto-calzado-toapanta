USE calzado_toapanta;

-- 1. Procedimiento: Registrar Cliente

DELIMITER //
CREATE PROCEDURE sp_registrar_cliente(
    IN p_cedula VARCHAR(10), IN p_nombres VARCHAR(100), IN p_apellidos VARCHAR(100),
    IN p_telefono VARCHAR(10), IN p_correo VARCHAR(150), IN p_provincia VARCHAR(100),
    IN p_fecha_nacimiento DATE
)
BEGIN
    -- Validar si ya existe
    IF EXISTS(SELECT 1 FROM clientes WHERE cedula = p_cedula OR correo = p_correo) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El cliente ya existe (cédula o correo duplicado).';
    ELSE
        INSERT INTO clientes (cedula, nombres, apellidos, telefono, correo, provincia, fecha_nacimiento)
        VALUES (p_cedula, p_nombres, p_apellidos, p_telefono, p_correo, p_provincia, p_fecha_nacimiento);
    END IF;
END //
DELIMITER ;

CALL sp_registrar_cliente('1723456789', 'Ana', 'Gómez', '0987654321', 'ana.gomez@mail.com', 'Guayas', '1995-10-20');

-- 2. Procedimiento: Registrar Producto
DELIMITER //
CREATE PROCEDURE sp_registrar_producto(
    IN p_nombre VARCHAR(150), IN p_tipo VARCHAR(50), IN p_talla VARCHAR(20),
    IN p_color VARCHAR(50), IN p_precio DECIMAL(10,2), IN p_id_categoria INT,
    IN p_id_proveedor INT, IN p_stock_inicial INT, IN p_stock_minimo INT, IN p_ubicacion VARCHAR(100)
)
BEGIN
    DECLARE v_id_producto INT;
    
    IF p_tipo NOT IN ('Nacional', 'Importado') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Tipo debe ser "Nacional" o "Importado".';
    ELSE
        -- 1. Registrar el producto
        INSERT INTO productos (nombre_producto, tipo_producto, talla, color, precio, id_categoria, id_proveedor)
        VALUES (p_nombre, p_tipo, p_talla, p_color, p_precio, p_id_categoria, p_id_proveedor);
        
        SET v_id_producto = LAST_INSERT_ID();
        
        -- 2. Registrar su inventario
        INSERT INTO inventario (id_producto, stock_actual, stock_minimo, ubicacion)
        VALUES (v_id_producto, p_stock_inicial, p_stock_minimo, p_ubicacion);
    END IF;
END //
DELIMITER ;

CALL sp_registrar_producto('Zapato de Cuero', 'Nacional', '40', 'Negro', 65.50, 1, 1, 100, 10, 'Bodega A');

-- 3. Procedimiento: Registrar Venta 

DELIMITER //
CREATE PROCEDURE sp_registrar_venta(
    IN p_nro_factura VARCHAR(20), IN p_tipo_venta VARCHAR(50), 
    IN p_id_cliente INT, IN p_id_empleado INT, IN p_id_producto INT, 
    IN p_cantidad INT, IN p_id_promocion INT
)
BEGIN
    DECLARE v_precio DECIMAL(10,2);
    DECLARE v_subtotal DECIMAL(10,2);
    DECLARE v_descuento DECIMAL(10,2) DEFAULT 0;
    DECLARE v_iva DECIMAL(10,2);
    DECLARE v_total DECIMAL(10,2);
    DECLARE v_porcentaje_desc DECIMAL(5,2) DEFAULT 0;
    DECLARE v_id_venta INT;
    
    -- Obtener precio base
    SELECT precio INTO v_precio FROM productos WHERE id_producto = p_id_producto;
    SET v_subtotal = v_precio * p_cantidad;
    
    -- Aplicar promoción si existe y está activa
    IF p_id_promocion IS NOT NULL THEN
        SELECT porcentaje_descuento INTO v_porcentaje_desc 
        FROM promociones 
        WHERE id_promocion = p_id_promocion AND estado = 'Activa' AND CURDATE() BETWEEN fecha_inicio AND fecha_fin;
        
        SET v_descuento = v_subtotal * (v_porcentaje_desc / 100);
    END IF;
    
    -- Calcular totales
    SET v_iva = (v_subtotal - v_descuento) * 0.15;
    SET v_total = (v_subtotal - v_descuento) + v_iva;
    
    -- Insertar Cabecera de Venta
    INSERT INTO ventas (nro_factura, fecha_venta, tipo_venta, subtotal, descuento, iva, total, id_cliente, id_empleado, id_promocion)
    VALUES (p_nro_factura, CURDATE(), p_tipo_venta, v_subtotal, v_descuento, v_iva, v_total, p_id_cliente, p_id_empleado, p_id_promocion);
    
    SET v_id_venta = LAST_INSERT_ID();
    
    -- Insertar Detalle
    INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario, subtotal)
    VALUES (v_id_venta, p_id_producto, p_cantidad, v_precio, v_subtotal);
    
    -- Descontar del inventario
    UPDATE inventario SET stock_actual = stock_actual - p_cantidad WHERE id_producto = p_id_producto;
END //
DELIMITER ;

-- Registra una venta minorista de 2 unidades del producto ID 1, sin promo (NULL)
CALL sp_registrar_venta('FAC-001-0002', 'Minorista', 1, 2, 1, 2, NULL);

-- 4. Procedimiento: Registrar Devolucion

DELIMITER //
CREATE PROCEDURE sp_registrar_devolucion(
    IN p_id_venta INT, IN p_id_producto INT, IN p_cantidad INT, IN p_motivo VARCHAR(200)
)
BEGIN
    -- Crear registro de devolución
    INSERT INTO devoluciones (id_venta, id_producto, fecha_devolucion, cantidad, motivo)
    VALUES (p_id_venta, p_id_producto, CURDATE(), p_cantidad, p_motivo);
    
    -- Devolver stock a la bodega
    UPDATE inventario SET stock_actual = stock_actual + p_cantidad WHERE id_producto = p_id_producto;
END //
DELIMITER ;

CALL sp_registrar_devolucion(1, 1, 1, 'Talla incorrecta');

-- 5. Procedimiento: Aplicar Promocion

DELIMITER //
CREATE PROCEDURE sp_aplicar_promocion(
    IN p_id_venta INT, IN p_id_promocion INT
)
BEGIN
    DECLARE v_subtotal DECIMAL(10,2);
    DECLARE v_porcentaje DECIMAL(5,2);
    DECLARE v_descuento DECIMAL(10,2);
    
    SELECT subtotal INTO v_subtotal FROM ventas WHERE id_venta = p_id_venta;
    SELECT porcentaje_descuento INTO v_porcentaje FROM promociones WHERE id_promocion = p_id_promocion AND estado = 'Activa';
    
    SET v_descuento = v_subtotal * (v_porcentaje / 100);
    
    -- Actualizar factura
    UPDATE ventas 
    SET descuento = v_descuento, 
        id_promocion = p_id_promocion, 
        iva = (subtotal - v_descuento) * 0.15, 
        total = (subtotal - v_descuento) * 1.15
    WHERE id_venta = p_id_venta;
END //
DELIMITER ;

-- Aplica la promocion 2 a la venta 1
CALL sp_aplicar_promocion(1, 2); 

-- 6. Procedimiento: Calcular Ventas Mensuales
DELIMITER //
CREATE PROCEDURE sp_calcular_ventas_mensuales(IN p_anio INT)
BEGIN
    SELECT 
        MONTH(fecha_venta) AS Mes, 
        SUM(total) AS TotalVentas
    FROM ventas
    WHERE YEAR(fecha_venta) = p_anio
    GROUP BY MONTH(fecha_venta)
    ORDER BY Mes;
END //
DELIMITER ;

-- ventas en el año 2026
CALL sp_calcular_ventas_mensuales(2026);

-- 7. Procedimiento: Registrar Proveedor

DELIMITER //
CREATE PROCEDURE sp_registrar_proveedor(
    IN p_nombre VARCHAR(150), IN p_pais VARCHAR(100), IN p_tipo VARCHAR(50), 
    IN p_telefono VARCHAR(20), IN p_correo VARCHAR(150)
)
BEGIN
    IF p_tipo NOT IN ('Nacional', 'Internacional') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Tipo debe ser Nacional o Internacional.';
    ELSE
        INSERT INTO proveedores (nombre_proveedor, pais, tipo_proveedor, telefono, correo)
        VALUES (p_nombre, p_pais, p_tipo, p_telefono, p_correo);
    END IF;
END //
DELIMITER ;

CALL sp_registrar_proveedor('Calzados Nike', 'Estados Unidos', 'Internacional', '1800-555-000', 'ventas@nike.com');

-- 8. Procedimiento: Actualizar Inventario

DELIMITER //
CREATE PROCEDURE sp_actualizar_inventario(
    IN p_id_producto INT, IN p_tipo_movimiento VARCHAR(50), 
    IN p_cantidad INT, IN p_motivo VARCHAR(200), IN p_id_empleado INT
)
BEGIN
    -- 1. Dejar huella del movimiento
    INSERT INTO movimientos_inventario (id_producto, tipo_movimiento, cantidad, fecha_movimiento, motivo, id_empleado)
    VALUES (p_id_producto, p_tipo_movimiento, p_cantidad, CURDATE(), p_motivo, p_id_empleado);
    
    -- 2. Ajustar stock según el tipo
    IF p_tipo_movimiento IN ('Entrada', 'Devolucion') THEN
        UPDATE inventario SET stock_actual = stock_actual + p_cantidad WHERE id_producto = p_id_producto;
    ELSEIF p_tipo_movimiento IN ('Salida', 'Ajuste') THEN
        UPDATE inventario SET stock_actual = stock_actual - p_cantidad WHERE id_producto = p_id_producto;
    END IF;
END //
DELIMITER ;

CALL sp_actualizar_inventario(3, 'Entrada', 150, 'Ingreso de nuevo lote', 1);

-- 9. Procedimiento: Registrar Queja

DELIMITER //
CREATE PROCEDURE sp_registrar_queja(
    IN p_id_cliente INT, IN p_tipo VARCHAR(50), IN p_descripcion TEXT
)
BEGIN
    IF p_tipo NOT IN ('Reclamo', 'Sugerencia', 'Otro') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El tipo debe ser Reclamo, Sugerencia u Otro.';
    ELSE
        INSERT INTO quejas (id_cliente, fecha_queja, tipo_queja, descripcion)
        VALUES (p_id_cliente, CURDATE(), p_tipo, p_descripcion);
    END IF;
END //
DELIMITER ;

CALL sp_registrar_queja(5, 'Sugerencia', 'Deberían abrir los domingos.');

-- 10. Procedimiento: Registrar auditoria

DELIMITER //
CREATE PROCEDURE sp_registrar_auditoria(
    IN p_accion VARCHAR(100), IN p_usuario VARCHAR(100), IN p_tabla VARCHAR(100)
)
BEGIN
    INSERT INTO auditoria (accion, usuario, tabla_afectada)
    VALUES (p_accion, p_usuario, p_tabla);
END //
DELIMITER ;

CALL sp_registrar_auditoria('UPDATE', 'admin_marcos', 'ventas');