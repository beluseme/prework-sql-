/*1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio"  *(numérico).*/
    
    CREATE TABLE IF NOT EXISTS productos(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    precio DECIMAL NOT NULL
    
    )
    
/*2. Inserta al menos cinco registros en la tabla "Productos".*/
    
    INSERT INTO productos(nombre,precio)
    VALUES
    ('pan',0.6),
    ('harina avena',3),
    ('lentejas',5),
    ('arroz',4),
    ('fideos integrales',6)
    
/*3. Actualiza el precio de un producto en la tabla "Productos".*/
    
    UPDATE productos
    SET precio=10
    WHERE id=3
    
/*4. Elimina un producto de la tabla "Productos".*/
    
    DELETE FROM productos
    WHERE id=5