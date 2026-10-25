
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
