USE calzado_toapanta;

-- 1. Funcion: Calcular IVA

DELIMITER //
CREATE FUNCTION fn_calcular_iva(monto DECIMAL(10,2)) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN monto * 0.15;
END //
DELIMITER ;

SELECT fn_calcular_iva(80.50) AS ValorIVA;

-- 2. Funcion: Calcular Descuento

DELIMITER //
CREATE FUNCTION fn_calcular_descuento(monto DECIMAL(10,2), porcentaje DECIMAL(5,2)) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN monto * (porcentaje / 100);
END //
DELIMITER ;

-- Se tiene un subtotal de 250.00 y se aplica un 10% de descuento
SELECT fn_calcular_descuento(250.00, 10.00) AS MontoDescontado;

-- 3. Funcion: Calcular Edad

DELIMITER //
CREATE FUNCTION fn_calcular_edad(fecha_nacimiento DATE) 
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE());
END //
DELIMITER ;

-- Funcion a tabla clientes para ver la edad de todos
SELECT 
    nombres, 
    apellidos, 
    fecha_nacimiento, 
    fn_calcular_edad(fecha_nacimiento) AS Edad 
FROM clientes;

-- 4. Funcion: Calcular Comision
DELIMITER //
CREATE FUNCTION fn_calcular_comision(p_id_empleado INT, p_porcentaje DECIMAL(5,2)) 
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
    DECLARE total_ventas DECIMAL(10,2);
    DECLARE comision DECIMAL(10,2);

    -- Sumamos todas las ventas del empleado
    SELECT COALESCE(SUM(total), 0) INTO total_ventas
    FROM ventas
    WHERE id_empleado = p_id_empleado;

    -- Calculamos la comisión
    SET comision = total_ventas * (p_porcentaje / 100);
    
    RETURN comision;
END //
DELIMITER ;

-- Calcular una comision del 5% para el empleado con ID 2
SELECT 
    nombres, 
    apellidos, 
    fn_calcular_comision(id_empleado, 5.00) AS ComisionGanada 
FROM empleados 
WHERE id_empleado = 2;

-- 5. Funcion: Contar Productos con Bajo Stock

DELIMITER //
CREATE FUNCTION fn_total_productos_bajo_stock() 
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE total_bajo_stock INT;

    SELECT COUNT(*) INTO total_bajo_stock
    FROM productos p
    INNER JOIN inventario i ON p.id_producto = i.id_producto
    WHERE i.stock_actual < i.stock_minimo;

    RETURN total_bajo_stock;
END //
DELIMITER ;

-- Obtener la cantidad de productos 
SELECT fn_total_productos_bajo_stock() AS CantidadProductosBajoStock;

-- 6. Funcion: Verificar si un Cliente es Frecuente

DELIMITER //
CREATE FUNCTION fn_es_cliente_frecuente(p_id_cliente INT) 
RETURNS VARCHAR(3)
READS SQL DATA
BEGIN
    DECLARE total_compras INT;

    -- Contar las compras del cliente
    SELECT COUNT(*) INTO total_compras
    FROM ventas
    WHERE id_cliente = p_id_cliente;

    -- Si tiene más de 2 compras, se considera frecuente
    IF total_compras > 2 THEN
        RETURN 'Sí';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

-- Consultar el listado de clientes
SELECT 
    id_cliente, 
    nombres, 
    apellidos, 
    fn_es_cliente_frecuente(id_cliente) AS EsFrecuente
FROM clientes;