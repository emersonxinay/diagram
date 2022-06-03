-- Descripción
-- La empresa Stanislavski Spa funciona como una contratista de actores para teatro, películas
-- de cine y series de televisión, está por sacar su sitio web con las últimas noticias y el
-- sistema para postulaciones de talentos emergentes, en paralelo a esto ha solicitado a un
-- especialista en bases de datos de preferencia Full Stack Developer para la construcción del
-- modelo de datos propuesto por su departamento de informática. Este modelo atiende la
-- iniciativa de incluir un blog básico en la página web que registre, usuarios por su correo
-- electrónico puedan hacer posts y comentarios a los posts publicados.
-- En el siguiente desafío trabajaremos de acuerdo al siguiente modelo de datos:

CREATE DATABASE blog_desafio;

CREATE TABLE usuarios(
id SERIAL PRIMARY KEY,
email VARCHAR
);
CREATE TABLE posts(
id SERIAL PRIMARY KEY,
usuario_id FOREIGN KEY (id) REFERENCES usuarios(id)
);
CREATE TABLE comentarios(
id SERIAL PRIMARY KEY,
texto VARCHAR,
fecha DATE,
post_id FOREIGN KEY (id) REFERENCES posts(id)
);



--- :::::::::: con René en clase :::::::::::::: -----

/* 📚 BLOG 📚 */

/* 1. Crear base de datos llamada Blog */
CREATE DATABASE Blog;
\c blog
/* 2. Crear las tablas indicadas */
CREATE TABLE usuarios(
  id    SERIAL,
  email VARCHAR,
  PRIMARY KEY(id)
);
CREATE TABLE posts(
  id          SERIAL,
  titulo      VARCHAR,
  fecha       DATE,
  usuario_id  INTEGER,
  PRIMARY KEY(id),
  FOREIGN KEY(usuario_id) REFERENCES usuarios(id)
);
CREATE TABLE comentarios(
  id          SERIAL,
  texto       VARCHAR,
  fecha       DATE,
  post_id     INTEGER,
  usuario_id  INTEGER,
  PRIMARY KEY(id),
  FOREIGN KEY(post_id) REFERENCES posts(id),
  FOREIGN KEY(usuario_id) REFERENCES usuarios(id)
);
/* 3. Insertar los datos */
INSERT INTO usuarios(email)
VALUES
('usuario01@hotmail.com'),
('usuario02@gmail.com'),
('usuario03@gmail.com'),
('usuario04@hotmail.com'),
('usuario05@yahoo.com'),
('usuario06@hotmail.com'),
('usuario07@yahoo.com'),
('usuario08@yahoo.com'),
('usuario09@yahoo.com')
;

INSERT INTO posts(usuarios_id, titulo, fecha)
VALUES
(1,'Post 1: Esto es malo','2020-06-29'),
(5,'Post 2: Esto es malo','2020-06-20'),
(1,'Post 3: Esto es excelente','2020-05-30'),
(9,'Post 4: Esto es bueno','2020-05-09'),
(7,'Post 5: Esto es bueno','2020-07-10'),
(5,'Post 6: Esto es excelente','2020-07-18'),
(8,'Post 7 Esto es excelente','2020-07-07'),
(5,'Post 8: Esto es excelente','2020-05-14'),
(2,'Post 9: Esto es bueno','2020-05-08'),
(6,'Post 10: Esto es bueno','2020-06-02'),
(4,'Post 11: Esto es bueno','2020-05-05'),
(9,'Post 12: Esto es malo','2020-07-23'),
(5,'Post 13: Esto es excelente','2020-05-30'),
(8,'Post 14: Esto es excelente','2020-05-01'),
(7,'Post 15: Esto es malo','2020-06-17')
;

INSERT INTO comentarios(post_id, usuario_id, texto, fecha)
VALUES
(6,   3, 'Este es un comentario 1', '2020-07-08'),
(2,   4, 'Este es un comentario 2', '2020-07-07'),
(4,   6, 'Este es un comentario 3', '2020-07-16'),
(13,  2, 'Este es un comentario 4', '2020-07-15'),
(6,   6, 'Este es un comentario 5', '2020-05-14'),
(3,   3, 'Este es un comentario 6', '2020-07-08'),
(1,   6, 'Este es un comentario 7', '2020-05-22'),
(7,   6, 'Este es un comentario 8', '2020-07-09'),
(13,  8, 'Este es un comentario 9', '2020-06-30'),
(6,   8, 'Este es un comentario 10', '2020-06-19'),
(1,   5, 'Este es un comentario 11', '2020-05-09'),
(15,  8, 'Este es un comentario 12', '2020-06-17'),
(9,   1, 'Este es un comentario 13', '2020-05-01'),
(5,   2, 'Este es un comentario 14', '2020-05-31'),
(3,   4, 'Este es un comentario 15', '2020-06-28')
;

/* 4. Seleccionar el correo, id y título de todos los post publicados por el usuario 5. */
SELECT usuario.email, post.id, post.titulo
FROM usuario
INNER JOIN post
ON usuario.id = post.usuario_id
WHERE usuario.id = 5;

/* 5. Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados
por el usuario con email usuario06@hotmail.com.
*/

/* Con un SELECT anidado */
select usuarios.email, comentarios.id, comentarios.texto from comentarios
inner JOIN usuarios
on comentarios.usuario_id = usuarios.id
where ((select (id) from usuarios where email='usuarios06@hotmail.com'))<> comentarios.usuario_id;

/* Buscando por correo */
select usuarios.email, comentarios.id, comentarios.texto from comentarios
inner JOIN usuarios
on comentarios.usuario_id = usuarios.id
where 6 <> comentarios.usuario_id;

/* Filtrando por correo */
select usuarios.email, comentarios.id, comentarios.texto from comentarios
inner JOIN usuarios
on comentarios.usuario_id = usuarios.id
where 'usuarios06@hotmail.com' <> usuarios.email;

/* Utilizando != */
SELECT usuarios.email, comentarios.post_id, comentarios.texto
FROM usuarios
INNER JOIN comentarios
ON usuarios.id = comentarios.usuario_id
WHERE usuarios.email != 'usuario06@hotmail.com';

/* 6. Listar los usuarios que no han publicado ningún post. */
SELECT usuarios.email
FROM usuarios
LEFT JOIN posts
ON usuarios.id = posts.usuarios_id
WHERE posts.id IS NULL;

/* 7. Listar todos los post con sus comentarios (incluyendo aquellos que no poseen comentarios).
*/

SELECT *
FROM posts
LEFT JOIN comentarios
ON posts.id = comentarios.post_id ORDER BY posts.id
;

-- mas especifico 

SELECT posts.titulo, comentarios.texto
FROM posts
LEFT JOIN comentarios
ON posts.id = comentarios.post_id ORDER BY posts.id
;

/* 8. Listar todos los usuarios que hayan publicado un post en Junio. */

-- vemos que podemos hacer con los datos 
SELECT * FROM posts WHERE fecha BETWEEN '2020-06-01' AND '2020-06-30';

-- probando mejor 
SELECT usuarios.email
FROM posts
INNER JOIN usuarios
ON posts.usuario_id = usuarios.id
WHERE posts.fecha BETWEEN '2020-06-01' AND '2020-06-30';