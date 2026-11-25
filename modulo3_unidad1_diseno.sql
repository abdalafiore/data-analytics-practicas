-- =========================================================================
-- Módulo 3 - Unidad 1: Diseño de esquemas con DDL y tipos de datos
-- Sistema de gestión de ventas
-- =========================================================================

-- 1. Creación de la tabla de Clientes
CREATE TABLE clientes (
    -- INT: Ideal para identificadores numéricos únicos sin decimales
    id_cliente INT PRIMARY KEY,
    
    -- VARCHAR(100): Texto de longitud variable que optimiza espacio para nombres
    nombre VARCHAR(100) NOT NULL,
    
    -- VARCHAR(MAX): Permite almacenar bloques de texto extensos (notas o biografías) en SQL Server
    perfil_bio VARCHAR(MAX),
    
    -- DATE: Almacena únicamente la fecha (Año-Mes-Día) sin hora, ideal para registros históricos
    fecha_registro DATE NOT NULL
);

-- 2. Creación de la tabla de Productos
CREATE TABLE productos (
    -- INT: Identificador numérico entero para cada artículo del catálogo
    id_producto INT PRIMARY KEY,
    
    -- VARCHAR(255): Cadena de texto variable suficiente para describir el producto
    descripcion VARCHAR(255) NOT NULL,
    
    -- DECIMAL(10, 2): Obligatorio para valores monetarios; garantiza precisión exacta en centavos (evita errores de redondeo de FLOAT)
    precio DECIMAL(10, 2) NOT NULL,
    
    -- BIT: Tipo booleano en SQL Server (1 = activo/a la venta, 0 = inactivo); ocupa mínimo espacio y evita errores de tipeo frente a texto
    esta_activo BIT DEFAULT 1
);
