-- Eddinson Lizama - 02-11-2026
--Consulta 1 (Métrica Global): 
--Contar el total de registros (COUNT)
--y la suma total de volumen/stock (SUM).
Select 
COUNT(Cantidad) AS TotalRegistros
FROM MovimientosInventario;

SELECT
SUM(StockActual) AS TotalStock
FROM Productos;

--Consulta 2 (Extremos y Promedios): Hallar el valor máximo (MAX),
--mínimo (MIN) y promedio (AVG) de una columna 
--numérica (ej. precios de productos).
SELECT 
MAX(PrecioUnitario) AS PrendaMasCara,
MIN(PrecioUnitario) AS PrendaMasBarata,
AVG(PrecioUnitario) AS PromedioPrecioPrendas
FROM Productos;



--Consulta 3 (Agrupamiento Simple): Usar GROUP BY 
--para agrupar por una categoría/tipo
--(ej. agrupar por CategoriaID o TipoMovimiento)
--calculando al menos 2 métricas (COUNT, SUM, etc.).
SELECT 
    TipoMovimiento,
    COUNT(*) AS TotalOperaciones,
    SUM(Cantidad) AS SumaTotalCantidad
FROM MovimientosInventario
GROUP BY TipoMovimiento;

--Consulta 4 (Agrupamiento con Orden): Igual a la anterior, 
--pero ordenada de mayor
--a menor (ORDER BY ... DESC) según una métrica.
SELECT 
    TipoMovimiento,
    COUNT(*) AS TotalOperaciones,
    SUM(Cantidad) AS SumaTotalCantidad
FROM MovimientosInventario
GROUP BY TipoMovimiento
ORDER BY TotalOperaciones DESC;

--Consulta 5 (Filtro de Negocio): Usar GROUP BY+ HAVING 
--para filtrar y  mostrar solo los grupos que 
--superen o estén por debajo de un umbral
--especifico (ej. categorías con stock 
--promedio muy bajo o movimientos con alto volumen).

SELECT  TipoMovimiento,
SUM(Cantidad) AS PrendasMovidas
FROM MovimientosInventario
GROUP BY TipoMovimiento
HAVING SUM(Cantidad) > 5;

SELECT * from Productos
SELECT * from MovimientosInventario
SELECT * from Categorias