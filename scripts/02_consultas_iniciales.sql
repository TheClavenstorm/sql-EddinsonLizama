-- ==========================================================
-- MASTERCLASS SQL SERVER 2026 - CHECKPOINT 1
-- Dominio: Control de Inventarios - Tienda de Ropa
-- Script 02: Consultas de Validación y Filtrado (DML)
-- ==========================================================

USE DB_InventarioRopa;
GO

-- ----------------------------------------------------------
-- 1. SELECT * para cada tabla
-- ----------------------------------------------------------
SELECT * FROM Categorias;
SELECT * FROM Productos;
SELECT * FROM MovimientosInventario;

-- ----------------------------------------------------------
-- 2. Consultas con WHERE, Operadores Lógicos (AND / OR) y Comparaciones
-- ----------------------------------------------------------

-- Consulta A: Productos con precio mayor a 100 y stock escaso (menor a 20 unidades)

SELECT 
    ProductoID, 
    NombreProducto, 
    PrecioUnitario, 
    StockActual 
FROM Productos
WHERE PrecioUnitario > 100.00 AND StockActual < 20;

-- Consulta B: Movimientos de tipo 'Salida' O movimientos de cantidad mayor a 25 unidades
SELECT 
    MovimientoID, 
    ProductoID, 
    TipoMovimiento, 
    Cantidad, 
    FechaMovimiento 
FROM MovimientosInventario
WHERE TipoMovimiento = 'Salida' OR Cantidad > 25;

-- ----------------------------------------------------------
-- 3. Consulta de filtrado usando IS NULL / IS NOT NULL
-- ----------------------------------------------------------

-- Consulta A: Categorías que NO tienen una descripción registrada (IS NULL)
SELECT 
    CategoriaID, 
    NombreCategoria 
FROM Categorias
WHERE Descripcion IS NULL;

-- Consulta B: Movimientos que SÍ cuentan con una observación detallada (IS NOT NULL)
SELECT 
    MovimientoID, 
    ProductoID, 
    TipoMovimiento, 
    Observaciones 
FROM MovimientosInventario
WHERE Observaciones IS NOT NULL;
GO