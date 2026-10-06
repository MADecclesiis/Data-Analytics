# RetailPro - Proyecto de Data Analytics

## Descripción

RetailPro es un proyecto de Data Analytics orientado al análisis de información comercial y de ventas.

El proyecto permite analizar la facturación, el comportamiento de productos y clientes y la evolución de las ventas. Integra distintas etapas del trabajo de un analista de datos, desde el diseño de una base de datos relacional y la creación de consultas SQL hasta procesos ETL, modelado y análisis en Power BI.

## Herramientas utilizadas

- SQL Server
- SQL Server Management Studio (SSMS)
- Power BI
- Power Query
- DAX
- GitHub

## Modelo de datos

El proyecto trabaja con información relacionada con:

- Ventas
- Clientes
- Productos
- Categorías
- Territorios

Las tablas se relacionan mediante claves primarias y foráneas para permitir el análisis de la información comercial.

## Archivos SQL

### ventas_tech_db.sql

Contiene la creación y carga de la base de datos utilizada en el proyecto.

### m4_consultas_negocio.sql

Contiene consultas orientadas al análisis del negocio, incluyendo:

- Resumen ejecutivo mensual.
- Ranking de productos.
- Clientes recurrentes.
- Comparación de la facturación mensual con el promedio.

### m5_consultas_joins.sql

Contiene consultas que utilizan:

- INNER JOIN
- LEFT JOIN
- UNION ALL

Estas consultas permiten integrar información proveniente de distintas tablas del modelo.

## Power BI

El proyecto continúa en Power BI mediante los archivos:

- `Pipeline_ETL_Decclesiis_Matias.pbix`
- `Decclesiis_Matias_Checkpoint2.pbix`

Se realizaron procesos de limpieza y transformación mediante Power Query y posteriormente se construyó el modelo de datos.

También se incorporó una tabla calendario `Dim_Fechas` y una tabla `_Medidas` para centralizar las medidas DAX.

Entre las medidas desarrolladas se encuentran:

- Total Ventas
- Ventas Online
- Ventas YTD
- Ventas LY
- % Crecimiento Anual

Estas medidas permiten analizar las ventas y realizar comparaciones temporales.

## Cómo ejecutar los scripts SQL

1. Abrir SQL Server Management Studio (SSMS).
2. Conectarse a una instancia de SQL Server.
3. Ejecutar `ventas_tech_db.sql` para crear y cargar la base de datos.
4. Ejecutar `m4_consultas_negocio.sql` para realizar los análisis de negocio.
5. Ejecutar `m5_consultas_joins.sql` para analizar las relaciones entre las distintas tablas.
6. Verificar los resultados obtenidos antes de utilizarlos para el análisis.

## Objetivo

El objetivo de RetailPro es aplicar distintas herramientas y técnicas de Data Analytics para transformar datos comerciales en información útil para la toma de decisiones, integrando SQL Server y Power BI dentro de un mismo flujo de trabajo.
