/*1. Crea una base de datos llamada "MiBaseDeDatos".*/
    
    CREATE DATABASE MiBaseDeDatos;
    
/*2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "edad" (entero).*/
    
    CREATE TABLE IF NOT EXISTS usuario(
    
    id SERIAL PRIMARY KEY,
    
    nombre VARCHAR (255),
    
    edad INT
    
    )
    
/*3. Inserta dos registros en la tabla "Usuarios".*/
    
    INSERT INTO usuario (nombre,edad)
    VALUES ('Juan', 25),
    ('María', 30),
    ('Pedro', 28);
    
/*4. Actualiza la edad de un usuario en la tabla "Usuarios".*/
    
    UPDATE usuario
    SET edad=18
    WHERE id=2
    
/*5. Elimina un usuario de la tabla "Usuarios".*/
    
    DELETE FROM public.usuario
    WHERE edad<20;
    
    Nivel de dificultad: Moderado
    
/*6. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "pais" (texto).*/
    
    CREATE TABLE IF NOT EXISTS ciudades(
    
    id SERIAL PRIMARY KEY NOT NULL,
    
    nombre VARCHAR (255),
    
    pais VARCHAR (255)
    
    )
    
/*7. Inserta al menos tres registros en la tabla "Ciudades".*/
    
    INSERT INTO ciudades (nombre,pais)
    VALUES ('Buenos Aires', 'Argentina'),
    ('Madrid', 'España'),
    ('Berlin', 'Alemania');
    
/*8. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id"
de la tabla "Ciudades".*/
    
    ALTER TABLE public.usuario
    ADD COLUMN id_ciudad INT REFERENCES ciudades(id)
    
/*9. Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN). */
    
    SELECT u.nombre AS Usuario, ciu.nombre AS ciudad, ciu.pais 
    FROM public.usuario u
    LEFT JOIN public.ciudades ciu ON u.id_ciudad=[ciu.id](http://ciu.id/)
    
/*10. Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN). */
    
    SELECT u.nombre AS Usuario, ciu.nombre AS ciudad, ciu.pais FROM public.usuario u
    LEFT JOIN public.ciudades ciu ON u.id_ciudad=[ciu.id](http://ciu.id/)