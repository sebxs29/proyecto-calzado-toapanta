USE calzado_toapanta;

-- Creación de la tabla de Auditoria
CREATE TABLE IF NOT EXISTS auditoria (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    accion VARCHAR(100) NOT NULL,
    usuario VARCHAR(100) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    tabla_afectada VARCHAR(100) NOT NULL
);

-- Tabla para guardar el historial de clientes
CREATE TABLE IF NOT EXISTS auditoria_clientes (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    operacion VARCHAR(15),
    usuario VARCHAR(100),
    fecha DATETIME,
    id_cliente INT,
    cedula VARCHAR(10),
    datos_anteriores TEXT,
    datos_nuevos TEXT
);

-- Tabla para el historial de precios de productos
CREATE TABLE IF NOT EXISTS auditoria_precios (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    precio_anterior DECIMAL(10,2),
    precio_nuevo DECIMAL(10,2),
    usuario VARCHAR(100),
    fecha DATETIME
);

-- Tabla para el registro de accesos 
CREATE TABLE IF NOT EXISTS registro_accesos (
    id_acceso INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(100),
    fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    accion VARCHAR(50)
);