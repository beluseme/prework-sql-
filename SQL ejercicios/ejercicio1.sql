/*1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria), nombre (texto) y email (texto). */
    
    CREATE TABLE IF NOT EXISTS clientes(
    
    id INT PRIMARY KEY,
    
    nombre VARCHAR (255),
    
    email VARCHAT(255)
    
    )
    
/*2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y [email="juan@example.com](mailto:email=%22juan@example.com)". */
    
    INSERT INTO clientes(id, nombre, email)
    VALUES (1, 'Juan','juan@example.com')
    
/* 3. Actualizar el email del cliente con id=1 a "[juan@gmail.com](mailto:juan@gmail.com)".   */
    
    UPDATE clientes
    
    SET email='juan@gmail.com'
    
    WHERE id=1
    
/* 4. Eliminar el cliente con id=1 de la tabla "Clientes".  */
    
    DELETE FROM cliente WHERE id=1
    
/* 5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria), cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto (texto) y cantidad (entero). */
    
    CREATE TABLE IF NOT EXISTS pedidos(
    
    id INT PRIMARY KEY,
    
    cliente_id INT NOT NULL,
    
    producto VARCHAR (255),
    
    cantidad INT,
    
    CONSTRAINT FK_student_id FOREIGN KEY (cliente_id) REFERENCES cliente(id) )
    
/* 6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1, producto="Camiseta" y cantidad=2. */
    
    INSERT INTO pedidos(id,cliente_id,producto,cantidad)
    
    VALUES (1,1,'Camiseta','2')
    
/* 7. Actualizar la cantidad del pedido con id=1 a 3.  */
    
    UPDATE pedidos
    
    SET cantidad='3'
    
    WHERE id=1
    
/* 8. Eliminar el pedido con id=1 de la tabla "Pedidos".  */
    
    DELETE FROM pedidos WHERE id=1
    
/* 9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave primaria), nombre (texto) y precio (decimal).  */
    
    CREATE TABLE IF NOT EXISTS productos(
    
    id INT PRIMARY KEY,
    nombre_produ VARCHAR (255),
    precio DECIMAL NOT NULL
    )
    
/* 10. Insertar varios productos en la tabla "Productos" con diferentes valores.   */
    
    INSERT INTO productos(id,nombre_produ,precio)
    
    VALUES (1,'Camiseta','10')
    
    INSERT INTO productos(id,nombre_produ,precio)
    
    VALUES (2,'Pantalon','13.5')
    
    INSERT INTO productos(id,nombre_produ,precio)
    
    VALUES (3,'Campera','23.5')
    
/* 11. Consultar todos los clientes de la tabla "Clientes".  */
    
    SELECT * FROM clientes
    
/* 12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los clientes correspondientes. */
    
    SELECT ped.producto, ped.cantidad, cli.nombre FROM public.pedidos as ped
    INNER JOIN public.clientes cli
    ON ped.cliente_id=[cli.id](http://cli.id/)
    
/*13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50.*/
    
    SELECT * FROM public.productos
    WHERE precio>50
    
/*14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o igual a 5.*/
    
    SELECT * FROM public.pedidos
    WHERE cantidad>5
    
/* 15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra "A". */
    
    SELECT * FROM public.clientes
    WHERE nombre LIKE 'A%'
    
/*16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos*/
realizados por cada cliente.
    
    SELECT cli.nombre, ped.cantidad FROM public.pedidos as ped
    INNER JOIN public.clientes cli
    ON ped.cliente_id=[cli.id](http://cli.id/)
    
/*17. Realizar una consulta que muestre el nombre del producto y la cantidad total de
pedidos de ese producto.*/
    
    SELECT productos.nombre_produ AS Nombre_producto,
    SUM (pedidos.cantidad) AS Cant_total_pedidos
    FROM public.productos
    INNER JOIN public.pedidos ON productos.nombre_produ=pedidos.producto
    GROUP BY productos.nombre_produ;
    
/*18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha.*/
    
    ALTER TABLE public.pedidos
    ADD COLUMN fecha date
    
/*19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla
"Productos" en la columna "producto".*/
    
    ALTER TABLE public.pedidos
    ADD COLUMN id_product INT REFERENCES productos(id)
    
    UPDATE public.pedidos
    SET id_product = (SELECT id FROM productos WHERE pedidos.producto=productos.nombre_produ);
    
    ALTER TABLE public.pedidos
    ADD CONSTRAINT fk_producto
    FOREIGN KEY (id_product) REFERENCES productos(id);
    
/*20. Realizar una consulta que muestre los nombres de los clientes, los nombres de
los productos y las cantidades de los pedidos donde coincida la clave externa*/
    
    SELECT cli.nombre, produ.nombre_produ,pedi.cantidad FROM public.pedidos pedi
    INNER JOIN public.clientes cli ON pedi.cliente_id=[cli.id](http://cli.id/)
    INNER JOIN public.productos produ ON pedi.id_product=[produ.id](http://produ.id/)