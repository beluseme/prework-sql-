/*Nivel de dificultad: Experto

1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave
primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y
"id_producto" (entero, clave foránea de la tabla "Productos").*/
    
    CREATE TABLE IF NOT EXISTS pedidos(
    
    id SERIAL PRIMARY KEY,
    
    id_usuario INT NOT NULL,
    
    id_producto INT NOT NULL,
    
    CONSTRAINT FK_usuario_id FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    
    CONSTRAINT FK_producto_id FOREIGN KEY (id_producto) REFERENCES producto(id) )
    
/*2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con
productos.*/
    
    INSERT INTO pedidos (id_usuario,id_producto)
    
    VALUES (2,4),
    
    (4,3),
    
    (3,6)
    
/*3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de
los productos que han comprado, incluidos aquellos que no han realizado
ningún pedido (utiliza LEFT JOIN y **COALESCE**).*/
    
    SELECT usuarios.nombres, COALESCE(productos.nombre, 'Sin pedido') AS Nombre_producto
    FROM usuarios
    LEFT JOIN pedidos ped
    ON ped.cliente_id=[cli.id](http://cli.id/)
    
/*4. Realiza una consulta que muestre los nombres de los usuarios que han
realizado un pedido, pero también los que no han realizado ningún pedido
(utiliza LEFT JOIN).*/
    
    SELECT usuarios.nombres FROM usuarios
    LEFT JOIN pedidos ped
    ON ped.cliente_id=[cli.id](http://cli.id/)
    
/*5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza
los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)*/
    
    ALTER TABLE pedidos
    ADD COLUMN cantidad INT
    
    UPDATE Pedidos
    SET cantidad = 1;