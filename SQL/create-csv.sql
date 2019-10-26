#sucursales, servicios, menús, disponibilidad de agendas y sus respectivas relaciones.
#comprados por los clientes para poder a través del catalog-service ofrecer un listado de los productos que son más populares en una sucursa


SELECT 'cliente_id', 'nombre', 'apellido'
UNION 
SELECT cliente_id, nombre, apellido FROM CLIENTE 
INTO OUTFILE '/tmp/CLIENTE.csv'
FIELDS ENCLOSED BY '"' TERMINATED BY ',' ESCAPED BY ''
LINES TERMINATED BY '\r\n';

SELECT 'mesa_id', 'sucursal_id'
UNION 
SELECT mesa_id, sucursal_id FROM MESA 
INTO OUTFILE '/tmp/MESA.csv'
FIELDS ENCLOSED BY '"' TERMINATED BY ',' ESCAPED BY ''
LINES TERMINATED BY '\r\n';

SELECT 'orden_id', 'cliente_id', 'sucursal_id', 'fecha', 'total'
UNION 
SELECT orden_id, cliente_id, sucursal_id, fecha, total FROM ORDEN 
INTO OUTFILE '/tmp/ORDEN.csv'
FIELDS ENCLOSED BY '"' TERMINATED BY ',' ESCAPED BY ''
LINES TERMINATED BY '\r\n';

SELECT 'product_id', 'sucursal_id', 'nombre', 'precio'
UNION 
SELECT product_id, sucursal_id, nombre, precio FROM PRODUCTO 
INTO OUTFILE '/tmp/PRODUCTO.csv'
FIELDS ENCLOSED BY '"' TERMINATED BY ',' ESCAPED BY ''
LINES TERMINATED BY '\r\n';

SELECT 'reserva_id', 'cliente_id', 'sucursal_id', 'mesa_id', 'fecha'
UNION 
SELECT reserva_id, cliente_id, sucursal_id, mesa_id, fecha FROM RESERVA 
INTO OUTFILE '/tmp/RESERVA.csv'
FIELDS ENCLOSED BY '"' TERMINATED BY ',' ESCAPED BY ''
LINES TERMINATED BY '\r\n';

SELECT 'sucursal_id', 'nombre', 'direccion'
UNION 
SELECT sucursal_id, nombre, direccion FROM SUCURSAL 
INTO OUTFILE '/tmp/SUCURSAL.csv'
FIELDS ENCLOSED BY '"' TERMINATED BY ',' ESCAPED BY ''
LINES TERMINATED BY '\r\n';

SELECT 'sucursalXmesa_id', 'orden_id', 'servicio_id'
UNION 
SELECT sucursalXmesa_id, orden_id, servicio_id FROM ORDENXSERVICIO 
INTO OUTFILE '/tmp/ORDENXSERVICIO.csv'
FIELDS ENCLOSED BY '"' TERMINATED BY ',' ESCAPED BY ''
LINES TERMINATED BY '\r\n';


SELECT 'ordenXproducto_id', 'orden_id', 'product_id'
UNION 
SELECT ordenXproducto_id, orden_id, product_id FROM ORDENXPRODUCTO 
INTO OUTFILE '/tmp/ORDENXPRODUCTO.csv'
FIELDS ENCLOSED BY '"' TERMINATED BY ',' ESCAPED BY ''
LINES TERMINATED BY '\r\n';


SELECT 'sucursalXmesa_id', 'sucursal_id', 'mesa_id'
UNION 
SELECT sucursalXmesa_id, sucursal_id, mesa_id FROM SUCURSALXMESA 
INTO OUTFILE '/tmp/SUCURSALXMESA.csv'
FIELDS ENCLOSED BY '"' TERMINATED BY ',' ESCAPED BY ''
LINES TERMINATED BY '\r\n';

