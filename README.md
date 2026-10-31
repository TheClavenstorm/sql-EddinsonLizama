# Checkpoint 1: Estructura Base y SELECT Básicos - SQL Server 2026

## 📌 Descripción del Proyecto y Escenario
Este repositorio contiene la arquitectura de datos inicial y las consultas de validación para el sistema de **Control de Inventarios de una Tienda de Ropa**, desarrollado como primer gran hito del proyecto Capstone en la Masterclass de SQL Server 2026.

El escenario aborda la necesidad de gestionar el catálogo de productos de prendas de vestir, clasificarlos por categorías y registrar los movimientos de entradas (reabastecimiento/importaciones) y salidas (ventas) del almacén central para garantizar una trazabilidad y control de stock óptimos.

---

## 🛠️ Tecnologías Utilizadas
* **Motor de Base de Datos:** SQL Server 2025 / 2026
* **Herramientas de Administración:** SQL Server Management Studio (SSMS) / Azure Data Studio / Visual Studio Code (extensión MSSQL)
* **Lenguaje:** Transact-SQL (T-SQL)

---

## 📁 Estructura del Repositorio

```text
sql-EddinsonLizama/
│
├── README.md                           # Documentación principal del proyecto
└── scripts/
    ├── 01_tablas_base.sql              # Script DDL: Creación de BD, tablas, PK/FK y seed data
    └── 02_consultas_iniciales.sql      # Script DML: Consultas SELECT, filtros WHERE, AND/OR e IS NULL