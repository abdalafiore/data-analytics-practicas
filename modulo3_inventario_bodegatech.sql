-- ══════════════════════════════════════════════════════════════════════════
-- BodegaTech — Script de Inventario
-- Autor: Fiorella Abdala
-- Fecha: 2026-11-25
-- ══════════════════════════════════════════════════════════════════════════

-- ── SECCIÓN DDL (Definición de Estructura) ────────────────────────────────

-- Paso 1: Eliminar la tabla si existe para permitir reejecuciones limpias
DROP TABLE IF EXISTS inventario;

-- Paso 2: Crear la estructura de la tabla inventario
CREATE TABLE inventario (
    -- INT: Ideal para identificadores numéricos únicos sin decimales IDENTITY: Para que sea autoincrementable
    id_producto INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
    
    -- VARCHAR(100): Texto de longitud variable que optimiza almacenamiento para nombres
    nombre_producto VARCHAR(100) NOT NULL,
    
    -- VARCHAR(50): Cadena variable suficiente para clasificar los rubros del catálogo
    categoria VARCHAR(50) NOT NULL,
    
    -- DECIMAL(10,2): Obligatorio para valores monetarios; evita errores de redondeo de FLOAT
    precio_unitario DECIMAL(10,2) NOT NULL,
    
    -- INT: Las cantidades físicas de unidades en almacén siempre son números enteros
    stock_actual INT NOT NULL,
    stock_minimo INT NOT NULL,
    
    -- DATE: Almacena únicamente Año-Mes-Día sin hora, ideal para fechas de ingreso
    fecha_ingreso DATE NOT NULL,
    
    -- TINYINT: En SQL Server ocupa solo 1 byte (0 a 255) y es ideal para estados binarios (1 = activo, 0 = descontinuado)
    activo TINYINT NOT NULL
);
 
-- ── SECCIÓN DML (Manipulación de Datos) ───────────────────────────────────

-- Paso 3: Cargar los 10 productos iniciales del inventario
INSERT INTO inventario (
    nombre_producto, 
    categoria, 
    precio_unitario, 
    stock_actual, 
    stock_minimo, 
    fecha_ingreso, 
    activo
)
VALUES
    ('Laptop Pro 15', 'Computación', 1200.00, 15, 3, '2024-01-10', 1),
    ('Mouse Inalámbrico', 'Accesorios', 28.00, 80, 10, '2024-01-10', 1),
    ('Monitor 4K 27"', 'Computación', 450.00, 12, 2, '2024-01-15', 1),
    ('Teclado Mecánico', 'Accesorios', 95.00, 40, 5, '2024-01-15', 1),
    ('Laptop Basic 14', 'Computación', 650.00, 20, 3, '2024-02-01', 1),
    ('Auriculares BT Pro', 'Audio', 120.00, 35, 5, '2024-02-01', 1),
    ('Hub USB-C 7 puertos', 'Accesorios', 45.00, 60, 10, '2024-02-10', 1),
    ('Webcam HD 1080p', 'Accesorios', 85.00, 25, 5, '2024-02-10', 1),
    ('SSD Externo 1TB', 'Almacenamiento', 130.00, 18, 3, '2024-03-01', 1),
    ('Parlante Bluetooth', 'Audio', 60.00, 45, 8, '2024-03-01', 1);

-- Paso 4: Registrar las ventas del día descontando el stock actual
-- Venta 1: Laptop Pro 15 (id: 1) -> 3 unidades vendidas (15 - 3 = 12)
UPDATE inventario
SET stock_actual = stock_actual - 3
WHERE id_producto = 1;

-- Venta 2: Mouse Inalámbrico (id: 2) -> 12 unidades vendidas (80 - 12 = 68)
UPDATE inventario
SET stock_actual = stock_actual - 12
WHERE id_producto = 2;

-- Venta 3: Auriculares BT Pro (id: 6) -> 5 unidades vendidas (35 - 5 = 30)
UPDATE inventario
SET stock_actual = stock_actual - 5
WHERE id_producto = 6;

-- Paso 5: Marcar como descontinuada (activo = 0) la Webcam HD 1080p (id: 8)
UPDATE inventario
SET activo = 0
WHERE id_producto = 8;

-- Paso 6: Consulta de validación para verificar la carga y las actualizaciones
SELECT * FROM inventario;
