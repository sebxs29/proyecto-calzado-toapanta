USE calzado_toapanta;

-- 1. Venta Completa

DELIMITER //
CREATE PROCEDURE tx_venta_completa(
    IN p_nro_factura VARCHAR(20), 
    IN p_tipo_venta VARCHAR(50), 
    IN p_id_cliente INT, 
    IN p_id_empleado INT, 
    IN p_id_producto INT, 
    IN p_cantidad INT, 
    IN p_id_promocion INT
)
BEGIN
    DECLARE v_precio DECIMAL(10,2);
    DECLARE v_subtotal DECIMAL(10,2);
    DECLARE v_descuento DECIMAL(10,2) DEFAULT 0;
    DECLARE v_porcentaje_desc DECIMAL(5,2) DEFAULT 0;
    DECLARE v_iva DECIMAL(10,2);
    DECLARE v_total DECIMAL(10,2);
    DECLARE v_id_venta INT;
    
    -- Manejador de errores para asegurar COMMIT o ROLLBACK
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error en la Venta Completa. Se ejecutó ROLLBACK.';
    END;

    START TRANSACTION;

    -- 1. Obtener precio unitario del producto
    SELECT precio INTO v_precio FROM productos WHERE id_producto = p_id_producto;
    SET v_subtotal = v_precio * p_cantidad;
    
    -- 2. Validar y calcular descuento si se incluye una promoción activa
    IF p_id_promocion IS NOT NULL THEN
        SELECT porcentaje_descuento INTO v_porcentaje_desc 
        FROM promociones 
        WHERE id_promocion = p_id_promocion AND estado = 'Activa' AND CURDATE() BETWEEN fecha_inicio AND fecha_fin;
        
        SET v_descuento = v_subtotal * (v_porcentaje_desc / 100);
    END IF;
    
    -- 3. Calcular IVA (15%) y Total
    SET v_iva = (v_subtotal - v_descuento) * 0.15;
    SET v_total = (v_subtotal - v_descuento) + v_iva;

    -- 4. Insertar cabecera de venta
    INSERT INTO ventas (nro_factura, fecha_venta, tipo_venta, subtotal, descuento, iva, total, id_cliente, id_empleado, id_promocion)
    VALUES (p_nro_factura, CURDATE(), p_tipo_venta, v_subtotal, v_descuento, v_iva, v_total, p_id_cliente, p_id_empleado, p_id_promocion);
    
    SET v_id_venta = LAST_INSERT_ID();
    
    -- 5. Insertar detalle de venta
    INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario, subtotal)
    VALUES (v_id_venta, p_id_producto, p_cantidad, v_precio, v_subtotal);
    
    -- 6. Actualizar inventario (descontar stock actual)
    UPDATE inventario 
    SET stock_actual = stock_actual - p_cantidad 
    WHERE id_producto = p_id_producto;

    -- Todo correcto, guardamos cambios de forma permanente
    COMMIT;
END //
DELIMITER ;

-- 2. Devolucion completa

DELIMITER //
CREATE PROCEDURE tx_devolucion_completa(
    IN p_id_venta INT, 
    IN p_id_producto INT, 
    IN p_cantidad INT, 
    IN p_motivo VARCHAR(200)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error en la Devolución Completa. Se ejecutó ROLLBACK.';
    END;

    START TRANSACTION;

    -- 1. Registrar la devolución
    INSERT INTO devoluciones (id_venta, id_producto, fecha_devolucion, cantidad, motivo, estado)
    VALUES (p_id_venta, p_id_producto, CURDATE(), p_cantidad, p_motivo, 'Procesada');
    
    -- 2. Incrementar de vuelta el stock en el inventario
    UPDATE inventario 
    SET stock_actual = stock_actual + p_cantidad 
    WHERE id_producto = p_id_producto;

    COMMIT;
END //
DELIMITER ;

CALL tx_devolucion_completa(
    1,              -- id_venta (una venta previamente registrada)
    1,              -- id_producto
    1,              -- Cantidad a devolver
    'Producto defectuoso de fábrica' -- Motivo
);

-- 3. Compra a proveedor

DELIMITER //
CREATE PROCEDURE tx_compra_proveedor(
    IN p_id_producto INT, 
    IN p_cantidad INT, 
    IN p_id_empleado INT, 
    IN p_motivo VARCHAR(200)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error en la Compra a Proveedor. Se ejecutó ROLLBACK.';
    END;

    START TRANSACTION;

    -- 1. Registrar el movimiento de entrada en el inventario
    INSERT INTO movimientos_inventario (id_producto, tipo_movimiento, cantidad, fecha_movimiento, motivo, id_empleado)
    VALUES (p_id_producto, 'Entrada', p_cantidad, CURDATE(), p_motivo, p_id_empleado);
    
    -- 2. Actualizar el stock actual sumando la nueva mercadería
    UPDATE inventario 
    SET stock_actual = stock_actual + p_cantidad 
    WHERE id_producto = p_id_producto;

    COMMIT;
END //
DELIMITER ;


-- 4. Actualizacion masiva de inventario
DELIMITER //
CREATE PROCEDURE tx_actualizacion_masiva_inventario()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error en la Actualización Masiva. Se ejecutó ROLLBACK.';
    END;

    START TRANSACTION;

    -- Ejemplo: Incrementa en un 10% el stock mínimo de todos los productos activos 
    -- asegurando que la operación masiva ocurra completamente o no ocurra en absoluto.
    UPDATE inventario i
    INNER JOIN productos p ON i.id_producto = p.id_producto
    SET i.stock_minimo = CEIL(i.stock_minimo * 1.10)
    WHERE p.estado = 'Activo';

    COMMIT;
END //
DELIMITER ;

CALL tx_compra_proveedor(
    1,              -- id_producto
    50,             -- Cantidad que ingresa
    1,              -- id_empleado que recibe
    'Lote nuevo de zapatos deportivos' -- Motivo
);