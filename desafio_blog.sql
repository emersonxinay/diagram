-- requerimiento 1
-- Crear una base de datos llamada blog.
CREATE DATABASE blog;
\c blog

-- Requerimiento 2
-- Crear las tablas indicadas de acuerdo al modelo de datos.
CREATE TABLE usuarios(
  id SERIAL PRIMARY KEY,
  email VARCHAR(40) NOT NULL UNIQUE
);
CREATE TABLE posts(
  id SERIAL PRIMARY KEY,
  usuarios_id INTEGER NOT NULL REFERENCES usuarios(id),
  titulo VARCHAR(100) NOT NULL UNIQUE,
  fecha date
);
CREATE TABLE comentarios(
  id SERIAL PRIMARY KEY,
  posts_id INTEGER NOT NULL REFERENCES posts(id),
  usuarios_id INTEGER NOT NULL REFERENCES usuarios(id),
  texto VARCHAR(500) NOT NULL,
  fecha date
);

-- Requerimiento 3
-- Insertar los siguientes registros
-- USUARIOS
  INSERT INTO USUARIOS(EMAIL) VALUES ('usuario01@hotmail.com');
  INSERT INTO USUARIOS(EMAIL) VALUES ('usuario02@gmail.com');
  INSERT INTO USUARIOS(EMAIL) VALUES ('usuario03@gmail.com');
  INSERT INTO USUARIOS(EMAIL) VALUES ('usuario04@hotmail.com');
  INSERT INTO USUARIOS(EMAIL) VALUES ('usuario05@yahoo.com');
  INSERT INTO USUARIOS(EMAIL) VALUES ('usuario06@hotmail.com');
  INSERT INTO USUARIOS(EMAIL) VALUES ('usuario07@yahoo.com');
  INSERT INTO USUARIOS(EMAIL) VALUES ('usuario08@yahoo.com');
  INSERT INTO USUARIOS(EMAIL) VALUES ('usuario09@yahoo.com');

-- POST
INSERT INTO POST (USUARIOS_ID, TITULO, FECHA) VALUES (1, 'Post 1: Esto esmalo ', '2020-06-29');
INSERT INTO POST (USUARIOS_ID, TITULO, FECHA) VALUES (5, 'Post 2: Esto esmalo ', '2020-06-20');
INSERT INTO POST (USUARIOS_ID, TITULO, FECHA) VALUES (1, 'Post 3: Esto esexcelente ', '2020-05-30');
INSERT INTO POST (USUARIOS_ID, TITULO, FECHA) VALUES (9, 'Post 4: Esto esbueno ', '2020-05-09');
INSERT INTO POST (USUARIOS_ID, TITULO, FECHA) VALUES (7, 'Post 5: Esto esbueno ', '2020-07-10');
INSERT INTO POST (USUARIOS_ID, TITULO, FECHA) VALUES (5, 'Post 6: Esto esexcelente ', '2020-07-18');
INSERT INTO POST (USUARIOS_ID, TITULO, FECHA) VALUES (8, 'Post 7: Esto esexcelente ', '2020-07-07');
INSERT INTO POST (USUARIOS_ID, TITULO, FECHA) VALUES (5, 'Post 8: Esto esexcelente ', '2020-05-14');
INSERT INTO POST (USUARIOS_ID, TITULO, FECHA) VALUES (2, 'Post 9: Esto esbueno ', '2020-05-08');
INSERT INTO POST (USUARIOS_ID, TITULO, FECHA) VALUES (6, 'Post 10: Esto es bueno ', '2020-06-02');
INSERT INTO POST (USUARIOS_ID, TITULO, FECHA) VALUES (4, 'Post 11: Esto es bueno ', '2020-05-05');
INSERT INTO POST (USUARIOS_ID, TITULO, FECHA) VALUES (9, 'Post 12: Esto es malo ', '2020-07-23');
INSERT INTO POST (USUARIOS_ID, TITULO, FECHA) VALUES (5, 'Post 13: Esto es excelente', '2020-05-30');
INSERT INTO POST (USUARIOS_ID, TITULO, FECHA) VALUES (8, 'Post 14: Esto es excelente', '2020-05-01');
INSERT INTO POST (USUARIOS_ID, TITULO, FECHA) VALUES (7, 'Post 15: Esto es malo ', '2020-06-17');

-- COMENTARIO
INSERT INTO COMENTARIO (USUARIOS_ID, POST_ID, TEXTO, FECHA) VALUES (1,3,'Este es el comentario 1 ','2020-07-08');
INSERT INTO COMENTARIO (USUARIOS_ID, POST_ID, TEXTO, FECHA) VALUES (2,4,'Este es el comentario 2 ','2020-06-07');
INSERT INTO COMENTARIO (USUARIOS_ID, POST_ID, TEXTO, FECHA) VALUES (3,6,'Este es el comentario 3 ','2020-06-16');
INSERT INTO COMENTARIO (USUARIOS_ID, POST_ID, TEXTO, FECHA) VALUES (4,2,'Este es el comentario 4 ','2020-06-15');
INSERT INTO COMENTARIO (USUARIOS_ID, POST_ID, TEXTO, FECHA) VALUES (5,6,'Este es el comentario 5 ','2020-05-14');
INSERT INTO COMENTARIO (USUARIOS_ID, POST_ID, TEXTO, FECHA) VALUES (6,3,'Este es el comentario 6 ','2020-07-08');
INSERT INTO COMENTARIO (USUARIOS_ID, POST_ID, TEXTO, FECHA) VALUES (7,6,'Este es el comentario 7 ','2020-05-22');
INSERT INTO COMENTARIO (USUARIOS_ID, POST_ID, TEXTO, FECHA) VALUES (8,6,'Este es el comentario 8 ','2020-07-09');
INSERT INTO COMENTARIO (USUARIOS_ID, POST_ID, TEXTO, FECHA) VALUES (9,8,'Este es el comentario 9 ','2020-06-30');
INSERT INTO COMENTARIO (USUARIOS_ID, POST_ID, TEXTO, FECHA) VALUES (10,8,'Este es el comentario 10','2020-06-19');
INSERT INTO COMENTARIO (USUARIOS_ID, POST_ID, TEXTO, FECHA) VALUES (11,5,'Este es el comentario 11','2020-05-09');
INSERT INTO COMENTARIO (USUARIOS_ID, POST_ID, TEXTO, FECHA) VALUES (12,8,'Este es el comentario 12','2020-06-17');
INSERT INTO COMENTARIO (USUARIOS_ID, POST_ID, TEXTO, FECHA) VALUES (13,1,'Este es el comentario 13','2020-05-01');
INSERT INTO COMENTARIO (USUARIOS_ID, POST_ID, TEXTO, FECHA) VALUES (14,2,'Este es el comentario 14','2020-05-31');
INSERT INTO COMENTARIO (USUARIOS_ID, POST_ID, TEXTO, FECHA) VALUES (15,4,'Este es el comentario 15','2020-06-28');

-- Requerimiento 4
-- Seleccionar el correo, id y título de todos los post publicados por el usuarioS 5.
select email, u.id, titulo
from usuarioS u
join post p on u.id = p.usuarioS_id
where u.id = 5;

-- Requerimiento 5
-- Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados por el
-- usuarioS con email usuarioS06@hotmail.com.
select email, u.id, texto, fecha
from usuarioS u
join comentario c on u.id = c.usuarioS_id
where u.email != 'usuarioS06@hotmail.com';

-- Requerimiento 6
-- Listar los usuarioSs que no han publicado ningún post.
select *
from usuarioS u
left join post p on u.id = p.usuarioS_id
where p.id is null;

-- Requerimiento 7
-- Listar todos los post con sus comentarios (incluyendo aquellos que no poseen
-- comentarios).
select *
from post p
full outer join comentario c on p.id = c.post_id;

-- Requerimiento 8
-- Listar todos los usuarioSs que hayan publicado un post en Junio.
select distinct u.*
from usuarioS u
inner join post p on u.id = p.usuarioS_id
where p.fecha between '2020-06-01' and '2020-06-30';