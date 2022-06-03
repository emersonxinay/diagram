/**
* ?                      🧤DÍA 01 - Relaciones y operaciones transacccionales🧤
* ?    SELECT columnas FROM tabla1 INNER JOIN       tabla2 ON tabla1.columna = tabla2.columna WHERE ...
* ?    SELECT columnas FROM tabla1 LEFT|RIGHT JOIN  tabla2 ON tabla1.columna = tabla2.columna WHERE ...
* ?    SELECT columnas FROM tabla1 FULL OUTER JOIN  tabla2 ON tabla1.columna = tabla2.columna WHERE ...
*/

/* 📒 BASE DE DATOS DE EMPRESA */
/* 
* 🗓 usuarios
*   |   rut     |   nombre  |   telefono    |   mail    |   genero  |   fecha_nacimiento    |
* 🗓 roles
*   |   id     |   nombre  |   descripcion    |
*/
/*❓ 1. Crear la base de datos empresa */
CREATE DATABASE empresa;
\c empresa
/*❓ 2. Crear las tablas solicitadas */
CREATE TABLE roles(
  id          SERIAL,
  nombre      VARCHAR,
  descripcion VARCHAR,
  PRIMARY KEY (id)
);

CREATE TABLE usuarios(
    rut               VARCHAR,
    nombre            VARCHAR,
    telefono          INTEGER,
    mail              VARCHAR,
    genero            VARCHAR,
    fecha_nacimiento  DATE,
    rol_id            INTEGER,
    PRIMARY KEY(rut),
    FOREIGN KEY(rol_id) REFERENCES roles(id)
);
/*❓ 3. Insertar los datos solicitados */

INSERT INTO roles(nombre, descripcion)
VALUES
('administrador', 'control total'),
('marketing',     'editar y crear anuncios'),
('editor',        'editar artículos'),
('subscriptor',   'leer artículos')
;

INSERT INTO usuarios (rut, nombre, telefono, mail, genero, fecha_nacimiento, rol_id)
VALUES
('1-9', 'Juan Soto', 9999999, 'juan.soto@gmail.com', 'M', '2000-06-24', 1),
('2-7', 'Jorge Perez', 8888888, 'jorge.perez@hotmail.com', 'M', '1998-03-12', 4),
('3-5', 'Sara Morales', 7777777, 'sara.morales@gmail.com', 'F', '1990-02-11', null)
;

/*❓ 4. Realizar un INNER JOIN entre las tablar para analizar el resultado */
SELECT * FROM usuarios
INNER JOIN roles
ON usuarios.rol_id = roles.id;


/*❓ 5. Mostrar el rut, nombre, mail y nombre de rol de los usuarios que sean Admin */
SELECT usuarios.rut, usuarios.nombre, usuarios.mail, roles.nombre as rol
FROM usuarios
INNER JOIN roles ON usuarios.rol_id = roles.id
WHERE roles.nombre = 'administrador';

/*❓ 6. Obtener todos los roles que NO tengan usuario utilizando un LEFT | RIGHT JOIN */
/* tabla de la izquierda */
/* tabla de la izquierda */
SELECT * FROM usuarios 
LEFT JOIN roles ON usuarios.rol_id = roles.id;

SELECT * FROM roles 
LEFT JOIN usuarios ON roles.id = usuarios.rol_id;

/*❓ 7. Obtener todos los roles que no tienen usuarios */
SELECT * FROM roles
LEFT JOIN usuarios ON roles.id = usuarios.rol_id
WHERE usuarios.rut IS NULL;

/*❓ 8. Consultar todas los registros de las dos tablas utilizando el FULL OUTER JOIN */
SELECT * FROM usuarios
FULL OUTER JOIN roles
ON usuarios.rol_id = roles.id;

/*❓ 9. FULL OUTER JOIN con un hueco en la mitad */
SELECT * FROM usuarios
FULL OUTER JOIN roles
ON usuarios.rol_id = roles.id
WHERE usuarios.rut is NULL OR rolES.id IS NULL;


