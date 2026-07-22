USE calzado_toapanta;

-- SCRIPT 10: USUARIOS Y PRIVILEGIOS

-- 1. CREAR USUARIOS
CREATE USER 'usuario_admin'@'localhost'
IDENTIFIED BY 'Admin_123';

CREATE USER 'usuario_gerente'@'localhost'
IDENTIFIED BY 'Gerente_123';

CREATE USER 'usuario_cajero'@'localhost'
IDENTIFIED BY 'Cajero_123';

CREATE USER 'usuario_vendedor'@'localhost'
IDENTIFIED BY 'Vendedor_123';

CREATE USER 'usuario_auditor'@'localhost'
IDENTIFIED BY 'Auditor_123';


-- 2. PRIVILEGIOS PARA ADMINISTRADOR
-- Tiene control total sobre la base del proyecto.
GRANT ALL PRIVILEGES
ON calzado_toapanta.*
TO 'usuario_admin'@'localhost'
WITH GRANT OPTION;


-- 3. PRIVILEGIOS PARA GERENTE
-- Puede consultar informacion general, reportes, vistas
-- y ejecutar funciones/procedimientos.
-- No puede eliminar estructuras de la base.
GRANT SELECT, SHOW VIEW
ON calzado_toapanta.*
TO 'usuario_gerente'@'localhost';

GRANT EXECUTE
ON calzado_toapanta.*
TO 'usuario_gerente'@'localhost';


-- 4. PRIVILEGIOS PARA CAJERO
-- Puede consultar clientes, productos, promociones e inventario.
-- Puede registrar ventas, detalles de venta y devoluciones.
-- Tambien puede ejecutar procedimientos relacionados.

GRANT SELECT
ON calzado_toapanta.clientes
TO 'usuario_cajero'@'localhost';

GRANT SELECT
ON calzado_toapanta.productos
TO 'usuario_cajero'@'localhost';

GRANT SELECT
ON calzado_toapanta.promociones
TO 'usuario_cajero'@'localhost';

GRANT SELECT
ON calzado_toapanta.inventario
TO 'usuario_cajero'@'localhost';

GRANT SELECT, INSERT
ON calzado_toapanta.ventas
TO 'usuario_cajero'@'localhost';

GRANT SELECT, INSERT
ON calzado_toapanta.detalle_venta
TO 'usuario_cajero'@'localhost';

GRANT SELECT, INSERT
ON calzado_toapanta.devoluciones
TO 'usuario_cajero'@'localhost';

GRANT EXECUTE
ON calzado_toapanta.*
TO 'usuario_cajero'@'localhost';


-- 5. PRIVILEGIOS PARA VENDEDOR
-- Puede consultar clientes, productos, inventario y promociones.
-- Puede registrar ventas y quejas de clientes.
GRANT SELECT
ON calzado_toapanta.clientes
TO 'usuario_vendedor'@'localhost';

GRANT SELECT
ON calzado_toapanta.productos
TO 'usuario_vendedor'@'localhost';

GRANT SELECT
ON calzado_toapanta.inventario
TO 'usuario_vendedor'@'localhost';

GRANT SELECT
ON calzado_toapanta.promociones
TO 'usuario_vendedor'@'localhost';

GRANT SELECT, INSERT
ON calzado_toapanta.ventas
TO 'usuario_vendedor'@'localhost';

GRANT SELECT, INSERT
ON calzado_toapanta.detalle_venta
TO 'usuario_vendedor'@'localhost';

GRANT SELECT, INSERT
ON calzado_toapanta.quejas
TO 'usuario_vendedor'@'localhost';

GRANT EXECUTE
ON calzado_toapanta.*
TO 'usuario_vendedor'@'localhost';


-- 6. PRIVILEGIOS PARA AUDITOR
-- Solo puede consultar informacion.
-- No puede insertar, actualizar ni eliminar datos.
GRANT SELECT, SHOW VIEW
ON calzado_toapanta.*
TO 'usuario_auditor'@'localhost';


-- 7. APLICAR CAMBIOS DE PRIVILEGIOS
FLUSH PRIVILEGES;


-- 9. VERIFICACION DE USUARIOS CREADOS
SELECT
    user,
    host
FROM mysql.user
WHERE user IN (
    'usuario_admin',
    'usuario_gerente',
    'usuario_cajero',
    'usuario_vendedor',
    'usuario_auditor'
);

-- 10. VERIFICACION DE PRIVILEGIOS

SHOW GRANTS FOR 'usuario_admin'@'localhost';
SHOW GRANTS FOR 'usuario_gerente'@'localhost';
SHOW GRANTS FOR 'usuario_cajero'@'localhost';
SHOW GRANTS FOR 'usuario_vendedor'@'localhost';
SHOW GRANTS FOR 'usuario_auditor'@'localhost';