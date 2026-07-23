use calzado_toapanta;

-- 1. Auditoria INSERT Clientes

DELIMITER //
CREATE TRIGGER trg_auditoria_insert_clientes
AFTER INSERT ON clientes
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_clientes (operacion, usuario, fecha, id_cliente, cedula, datos_nuevos)
    VALUES (
        'INSERT', 
        CURRENT_USER(), 
        NOW(), 
        NEW.id_cliente, 
        NEW.cedula, 
        CONCAT('Nombres: ', NEW.nombres, ' ', NEW.apellidos, ' - Correo: ', NEW.correo)
    );
END //
DELIMITER ;

-- 2. Auditoria UPDATE Clientes

DELIMITER //
CREATE TRIGGER trg_auditoria_update_clientes
AFTER UPDATE ON clientes
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_clientes (operacion, usuario, fecha, id_cliente, cedula, datos_anteriores, datos_nuevos)
    VALUES (
        'UPDATE', 
        CURRENT_USER(), 
        NOW(), 
        NEW.id_cliente, 
        NEW.cedula,
        CONCAT('Telf: ', OLD.telefono, ' Correo: ', OLD.correo),
        CONCAT('Telf: ', NEW.telefono, ' Correo: ', NEW.correo)
    );
END //
DELIMITER ;

-- 3. Auditoria DELETE Clientes

DELIMITER //
CREATE TRIGGER trg_auditoria_delete_clientes
BEFORE DELETE ON clientes
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_clientes (operacion, usuario, fecha, id_cliente, cedula, datos_anteriores)
    VALUES (
        'DELETE', 
        CURRENT_USER(), 
        NOW(), 
        OLD.id_cliente, 
        OLD.cedula, 
        CONCAT('Nombres: ', OLD.nombres, ' ', OLD.apellidos)
    );
END //
DELIMITER ;

-- 4. Descontar stock por venta

DELIMITER //
CREATE TRIGGER trg_descontar_stock_venta
AFTER INSERT ON detalle_venta
FOR EACH ROW
BEGIN
    UPDATE inventario
    SET stock_actual = stock_actual - NEW.cantidad
    WHERE id_producto = NEW.id_producto;
END //
DELIMITER ;

-- 5. Incrementar stock por devolucion

DELIMITER //
CREATE TRIGGER trg_incrementar_stock_devolucion
AFTER INSERT ON devoluciones
FOR EACH ROW
BEGIN
    UPDATE inventario
    SET stock_actual = stock_actual + NEW.cantidad
    WHERE id_producto = NEW.id_producto;
END //
DELIMITER ;

-- 6. Control de stock negativo

DELIMITER //
CREATE TRIGGER trg_control_stock_negativo
BEFORE INSERT ON detalle_venta
FOR EACH ROW
BEGIN
    DECLARE v_stock_actual INT;
    
    -- Consultamos cuánto stock hay en bodega
    SELECT stock_actual INTO v_stock_actual 
    FROM inventario 
    WHERE id_producto = NEW.id_producto;
    
    -- Validamos
    IF (v_stock_actual - NEW.cantidad) < 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: Stock insuficiente. La cantidad solicitada supera el inventario actual.';
    END IF;
END //
DELIMITER ;

-- 7. Registro de cambio de precio

DELIMITER //
CREATE TRIGGER trg_cambio_precio
AFTER UPDATE ON productos
FOR EACH ROW
BEGIN
    -- Validamos si el precio realmente cambió
    IF OLD.precio <> NEW.precio THEN
        INSERT INTO auditoria_precios (id_producto, precio_anterior, precio_nuevo, usuario, fecha)
        VALUES (
            NEW.id_producto, 
            OLD.precio, 
            NEW.precio, 
            CURRENT_USER(), 
            NOW()
        );
    END IF;
END //
DELIMITER ;