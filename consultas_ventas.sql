-- PREPARACIÓN: Creamos una tabla de ejemplo con datos de ventas.
-- Estos datos son ficticios y sirven para probar las consultas.

CREATE TABLE ventas_tecnologia (
    id_venta INTEGER PRIMARY KEY,
    producto TEXT NOT NULL,
    categoria TEXT,
    precio_unitario REAL NOT NULL,
    cantidad INTEGER NOT NULL,
    fecha TEXT,
    pais TEXT
);

-- Cargamos registros de prueba para analizar las ventas.
-- Incluimos una categoría NULL y ventas que permiten probar el HAVING.

INSERT INTO ventas_tecnologia
    (id_venta, producto, categoria, precio_unitario, cantidad, fecha, pais)
VALUES
    (1, 'Laptop', 'Computación', 1200, 2, '2026-09-10', 'Colombia'),
    (2, 'Monitor', 'Computación', 700, 10, '2026-09-11', 'Colombia'),
    (3, 'Teclado', 'Accesorios', 80, 20, '2026-09-12', 'Argentina'),
    (4, 'Tablet', 'Computación', 600, 2, '2026-09-13', 'Colombia'),
    (5, 'Mouse', 'Accesorios', 25, 10, '2026-09-14', 'Chile'),
    (6, 'Auriculares', NULL, 150, 5, '2026-09-15', 'Colombia'),
    (7, 'Laptop', 'Computación', 1200, 1, '2026-09-16', 'Argentina');

-- CONSULTA 1: ¿Cuáles son los productos y sus precios, ordenados alfabéticamente?
SELECT producto, precio_unitario
FROM ventas_tecnologia
ORDER BY producto ASC;


-- CONSULTA 2: ¿Qué ventas se realizaron en Colombia con un precio unitario mayor a 500?
SELECT *
FROM ventas_tecnologia
WHERE pais = 'Colombia'
  AND precio_unitario > 500;


-- CONSULTA 3: ¿Qué ventas tienen la categoría sin completar (NULL)?
SELECT *
FROM ventas_tecnologia
WHERE categoria IS NULL;


-- CONSULTA 4: ¿Cuántos ingresos totales generó cada categoría?
SELECT
    categoria,
    SUM(cantidad * precio_unitario) AS ingresos_totales
FROM ventas_tecnologia
GROUP BY categoria;


-- CONSULTA 5: ¿Qué categorías generaron más de 10.000 en ingresos?
SELECT
    categoria,
    SUM(cantidad * precio_unitario) AS ingresos_totales
FROM ventas_tecnologia
GROUP BY categoria
HAVING SUM(cantidad * precio_unitario) > 10000;
