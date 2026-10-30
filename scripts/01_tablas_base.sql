-- ==========================================================
-- MASTERCLASS SQL SERVER 2026 - CHECKPOINT 1
-- Dominio: Control de Inventarios - Tienda de Ropa
-- Script 01: Creación de Base de Datos y Tablas (DDL/DML)
-- ==========================================================

CREATE DATABASE DB_InventarioRopa;
GO

USE DB_InventarioRopa;
GO

-- 1. Tabla Categorias
CREATE TABLE Categorias (
    CategoriaID INT IDENTITY(1,1) PRIMARY KEY,
    NombreCategoria VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(150) NULL -- Permite NULL para validaciones
);

-- 2. Tabla Productos
CREATE TABLE Productos (
    ProductoID INT IDENTITY(1,1) PRIMARY KEY,
    NombreProducto NVARCHAR(100) NOT NULL,
    Talla VARCHAR(10) NOT NULL,
    PrecioUnitario DECIMAL(10,2) NOT NULL,
    StockActual INT NOT NULL,
    CategoriaID INT NOT NULL,
    CONSTRAINT FK_Productos_Categorias FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID)
);

-- 3. Tabla MovimientosInventario
CREATE TABLE MovimientosInventario (
    MovimientoID INT IDENTITY(1,1) PRIMARY KEY,
    ProductoID INT NOT NULL,
    TipoMovimiento VARCHAR(20) NOT NULL, -- 'Entrada' o 'Salida'
    Cantidad INT NOT NULL,
    FechaMovimiento DATE NOT NULL,
    Observaciones VARCHAR(200) NULL, -- Permite NULL para validaciones
    CONSTRAINT FK_Movimientos_Productos FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);
GO

-- ==========================================================
-- Carga de Datos Iniciales (5 registros por tabla)
-- ==========================================================

INSERT INTO Categorias (NombreCategoria, Descripcion) VALUES
('Polos y Camisetas', 'Prendas superiores casuales de algodón'),
('Pantalones y Jeans', 'Prendas inferiores masculinas y femeninas'),
('Casacas y Polerones', NULL), -- Categoria sin descripción (NULL)
('Calzado', 'Zapatillas y zapatos urbanos'),
('Accesorios', NULL); -- Categoria sin descripción (NULL)

INSERT INTO Productos (NombreProducto, Talla, PrecioUnitario, StockActual, CategoriaID) VALUES
('Polo Oversize Negro', 'L', 59.90, 45, 1),
('Jeans Slim Fit Azul', '32', 129.00, 12, 2),
('Poleron Hoodie Gris', 'M', 149.50, 8, 3),
('Zapatillas Urbanas White', '41', 219.00, 25, 4),
('Gorra Corduroy', 'Estándar', 35.00, 50, 5);

INSERT INTO MovimientosInventario (ProductoID, TipoMovimiento, Cantidad, FechaMovimiento, Observaciones) VALUES
(1, 'Entrada', 50, '2026-10-01', 'Reabastecimiento de almacén principal'),
(2, 'Salida', 3, '2026-10-05', 'Venta en tienda física'),
(3, 'Salida', 2, '2026-10-10', NULL), -- Movimiento sin observación (NULL)
(4, 'Entrada', 30, '2026-10-15', 'Importación lote 2026'),
(5, 'Salida', 5, '2026-10-20', NULL); -- Movimiento sin observación (NULL)
GO