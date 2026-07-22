USE calzado_toapanta;

-- CREACION DE TABLAS NORMALIZADAS

-- TABLA: clientes

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    cedula VARCHAR(10) NOT NULL UNIQUE,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    telefono VARCHAR(10) NOT NULL,
    correo VARCHAR(150) NOT NULL UNIQUE,
    provincia VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,

    CONSTRAINT chk_cliente_cedula
        CHECK (CHAR_LENGTH(cedula) = 10),

    CONSTRAINT chk_cliente_telefono
        CHECK (CHAR_LENGTH(telefono) = 10)
);

-- TABLA: empleados

CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    cedula VARCHAR(10) NOT NULL UNIQUE,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    rol VARCHAR(50) NOT NULL,
    telefono VARCHAR(10) NOT NULL,
    correo VARCHAR(150) NOT NULL UNIQUE,

    CONSTRAINT chk_empleado_cedula
        CHECK (CHAR_LENGTH(cedula) = 10),

    CONSTRAINT chk_empleado_telefono
        CHECK (CHAR_LENGTH(telefono) = 10),

    CONSTRAINT chk_empleado_rol
        CHECK (rol IN ('Administrador', 'Gerente', 'Cajero', 'Vendedor', 'Auditor'))
);

-- TABLA: proveedores

CREATE TABLE proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proveedor VARCHAR(150) NOT NULL UNIQUE,
    pais VARCHAR(100) NOT NULL,
    tipo_proveedor VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    correo VARCHAR(150) NOT NULL UNIQUE,

    CONSTRAINT chk_tipo_proveedor
        CHECK (tipo_proveedor IN ('Nacional', 'Internacional'))
);

-- TABLA: categorias

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL UNIQUE,
    descripcion VARCHAR(200),
    estado VARCHAR(20) NOT NULL DEFAULT 'Activa',

    CONSTRAINT chk_categoria_estado
        CHECK (estado IN ('Activa', 'Inactiva'))
);

-- TABLA: promociones

CREATE TABLE promociones (
    id_promocion INT AUTO_INCREMENT PRIMARY KEY,
    nombre_promocion VARCHAR(150) NOT NULL UNIQUE,
    porcentaje_descuento DECIMAL(5,2) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'Activa',

    CONSTRAINT chk_promocion_descuento
        CHECK (porcentaje_descuento >= 0 AND porcentaje_descuento <= 100),

    CONSTRAINT chk_promocion_fechas
        CHECK (fecha_fin >= fecha_inicio),

    CONSTRAINT chk_promocion_estado
        CHECK (estado IN ('Activa', 'Inactiva'))
);

-- TABLA: productos

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(150) NOT NULL,
    tipo_producto VARCHAR(50) NOT NULL,
    talla VARCHAR(20) NOT NULL,
    color VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'Activo',
    id_categoria INT NOT NULL,
    id_proveedor INT NOT NULL,

    CONSTRAINT uq_producto_unico
        UNIQUE (nombre_producto, talla, color),

    CONSTRAINT chk_producto_tipo
        CHECK (tipo_producto IN ('Nacional', 'Importado')),

    CONSTRAINT chk_producto_precio
        CHECK (precio > 0),

    CONSTRAINT chk_producto_estado
        CHECK (estado IN ('Activo', 'Inactivo')),

    CONSTRAINT fk_producto_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categorias(id_categoria)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_producto_proveedor
        FOREIGN KEY (id_proveedor)
        REFERENCES proveedores(id_proveedor)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- TABLA: ventas

CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    nro_factura VARCHAR(20) NOT NULL UNIQUE,
    fecha_venta DATE NOT NULL,
    tipo_venta VARCHAR(50) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    descuento DECIMAL(10,2) NOT NULL DEFAULT 0,
    iva DECIMAL(10,2) NOT NULL DEFAULT 0,
    total DECIMAL(10,2) NOT NULL,
    id_cliente INT NOT NULL,
    id_empleado INT NOT NULL,
    id_promocion INT NULL,

    CONSTRAINT chk_venta_tipo
        CHECK (tipo_venta IN ('Mayorista', 'Minorista')),

    CONSTRAINT chk_venta_valores
        CHECK (subtotal >= 0 AND descuento >= 0 AND iva >= 0 AND total >= 0),

    CONSTRAINT fk_venta_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_venta_empleado
        FOREIGN KEY (id_empleado)
        REFERENCES empleados(id_empleado)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_venta_promocion
        FOREIGN KEY (id_promocion)
        REFERENCES promociones(id_promocion)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

-- TABLA: detalle_venta

CREATE TABLE detalle_venta (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,

    CONSTRAINT chk_detalle_cantidad
        CHECK (cantidad > 0),

    CONSTRAINT chk_detalle_valores
        CHECK (precio_unitario > 0 AND subtotal >= 0),

    CONSTRAINT fk_detalle_venta
        FOREIGN KEY (id_venta)
        REFERENCES ventas(id_venta)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_detalle_producto
        FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- TABLA: inventario

CREATE TABLE inventario (
    id_inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL UNIQUE,
    stock_actual INT NOT NULL,
    stock_minimo INT NOT NULL,
    ubicacion VARCHAR(100) NOT NULL,

    CONSTRAINT chk_inventario_stock
        CHECK (stock_actual >= 0 AND stock_minimo >= 0),

    CONSTRAINT fk_inventario_producto
        FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- TABLA: movimientos_inventario

CREATE TABLE movimientos_inventario (
    id_movimiento INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    tipo_movimiento VARCHAR(50) NOT NULL,
    cantidad INT NOT NULL,
    fecha_movimiento DATE NOT NULL,
    motivo VARCHAR(200) NOT NULL,
    id_empleado INT NOT NULL,

    CONSTRAINT chk_movimiento_tipo
        CHECK (tipo_movimiento IN ('Entrada', 'Salida', 'Devolucion', 'Ajuste')),

    CONSTRAINT chk_movimiento_cantidad
        CHECK (cantidad > 0),

    CONSTRAINT fk_movimiento_producto
        FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_movimiento_empleado
        FOREIGN KEY (id_empleado)
        REFERENCES empleados(id_empleado)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- TABLA: devoluciones

CREATE TABLE devoluciones (
    id_devolucion INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    fecha_devolucion DATE NOT NULL,
    cantidad INT NOT NULL,
    motivo VARCHAR(200) NOT NULL,
    estado VARCHAR(50) NOT NULL DEFAULT 'Procesada',

    CONSTRAINT chk_devolucion_cantidad
        CHECK (cantidad > 0),

    CONSTRAINT chk_devolucion_estado
        CHECK (estado IN ('Pendiente', 'Procesada', 'Rechazada')),

    CONSTRAINT fk_devolucion_venta
        FOREIGN KEY (id_venta)
        REFERENCES ventas(id_venta)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_devolucion_producto
        FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- TABLA: quejas

CREATE TABLE quejas (
    id_queja INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha_queja DATE NOT NULL,
    tipo_queja VARCHAR(50) NOT NULL,
    descripcion TEXT NOT NULL,
    estado VARCHAR(50) NOT NULL DEFAULT 'Pendiente',

    CONSTRAINT chk_queja_tipo
        CHECK (tipo_queja IN ('Reclamo', 'Sugerencia', 'Otro')),

    CONSTRAINT chk_queja_estado
        CHECK (estado IN ('Pendiente', 'En proceso', 'Resuelta')),

    CONSTRAINT fk_queja_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

SHOW TABLES;