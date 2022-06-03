-- usando left join 
SELECT * FROM pokemones LEFT JOIN capturados ON pokemones.pokedex=capturados.pokedex WHERE capturados IS NULL ORDER BY nombre;

-- 
SELECT * FROM pokemones LEFT JOIN capturados ON pokemones.pokedex=capturados.pokedex ORDER BY nombre;


-- FUll OFTER JOIN
SELECT * FROM pokemones FULL OUTER JOIN capturados ON pokemones.pokedex=capturados.pokedex ORDER BY nombre;
-- selecciona todos los registros

-- de la tabla pokemones

-- en relación con la tabla capturados

-- a través de la columna pokedex

-- ordenados por nombre