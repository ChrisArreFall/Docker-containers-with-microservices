
//Constraints
CREATE CONSTRAINT ON (c:Cliente) ASSERT c.id IS UNIQUE;
CREATE CONSTRAINT ON (m:Mesa) ASSERT m.id IS UNIQUE;
CREATE CONSTRAINT ON (o:Orden) ASSERT o.id IS UNIQUE;
CREATE CONSTRAINT ON (p:Producto) ASSERT p.id IS UNIQUE;
CREATE CONSTRAINT ON (r:Reserva) ASSERT r.id IS UNIQUE;
CREATE CONSTRAINT ON (s:Sucursal) ASSERT s.id IS UNIQUE;

// Clientes
LOAD CSV WITH HEADERS FROM 'file:///CLIENTE.csv' AS line
CREATE (cliente:Cliente {id: TOINT(line.cliente_id) })
SET cliente.nombre = line.nombre,
    cliente.apellido = line.apellido
RETURN cliente;

// Mesas
LOAD CSV WITH HEADERS FROM 'file:///MESA.csv' AS line
CREATE (mesa:Mesa {id: TOINT(line.mesa_id) })
RETURN mesa;

// Ordenes
LOAD CSV WITH HEADERS FROM 'file:///ORDEN.csv' AS line
CREATE (orden:Orden {id: TOINT(line.orden_id) })
SET orden.fecha = line.fecha 
SET orden.total = TOINT(line.total)
RETURN orden;


// Productos
LOAD CSV WITH HEADERS FROM 'file:///PRODUCTO.csv' AS line
CREATE (producto:Producto {id: TOINT(line.producto_id) })
SET producto.nombre = line.nombre 
SET producto.precio = TOINT(line.precio)
RETURN producto;

// Reserva
LOAD CSV WITH HEADERS FROM 'file:///RESERVA.csv' AS line
CREATE (reserva:Reserva {id: line.reserva_id })
SET reserva.fecha = line.fecha
RETURN reserva;

// Sucursal
LOAD CSV WITH HEADERS FROM 'file:///SUCURSAL.csv' AS line
CREATE (sucursal:Sucursal {id: TOINT(line.sucursal_id) })
SET sucursal.nombre = line.nombre,
    sucursal.direccion = line.direccion
RETURN sucursal;

// Orden y cliente
LOAD CSV WITH HEADERS FROM 'file:///ORDEN.csv' AS line
MATCH (orden:Orden {id: TOINT(line.orden_id) })
MATCH (cliente:Cliente {id: line.cliente_id })
CREATE (orden)-[:HAS]->(cliente);


// Orden y sucursal
LOAD CSV WITH HEADERS FROM 'file:///ORDEN.csv' AS line
MATCH (orden:Orden {id: TOINT(line.orden_id) })
MATCH (sucursal:Sucursal {id: line.sucursal_id })
CREATE (orden)-[:IN]->(sucursal);


// Servicio y sucursal
LOAD CSV WITH HEADERS FROM 'file:///SERVICIO.csv' AS line
MATCH (servicio:Servicio {id: TOINT(line.servicio_id) })
MATCH (sucursal:Sucursal {id: line.sucursal_id })
CREATE (servicio)-[:IN]->(sucursal);


// Producto y sucursal
LOAD CSV WITH HEADERS FROM 'file:///PRODUCTO.csv' AS line
MATCH (producto:Producto {id: TOINT(line.producto_id) })
MATCH (sucursal:Sucursal {id: line.sucursal_id })
CREATE (producto)-[:IN]->(sucursal);


// Mesa y sucursal
LOAD CSV WITH HEADERS FROM 'file:///SERVICIO.csv' AS line
MATCH (mesa:Mesa {id: TOINT(line.mesa_id) })
MATCH (sucursal:Sucursal {id: line.sucursal_id })
CREATE (mesa)-[:IN]->(sucursal);


// Orden x Producto
LOAD CSV WITH HEADERS FROM 'file:///ORDENXPRODUCTO.csv' AS line
MATCH (orden:Orden {id: TOINT(line.orden_id) })
MATCH (producto:Producto {id: TOINT(line.producto_id) })
CREATE (orden)-[:HAS]->(producto)
RETURN orden, producto;

// Orden x Producto
LOAD CSV WITH HEADERS FROM 'file:///ORDENXSERVICIO.csv' AS line
MATCH (orden:Orden {id: TOINT(line.orden_id) })
MATCH (servicio:Producto {id: TOINT(line.servicio_id) })
CREATE (orden)-[:HAS]->(servicio)
RETURN orden, servicio;

// Sucursal x Mesa
LOAD CSV WITH HEADERS FROM 'file:///SUCURSALXMESA.csv' AS line
MATCH (sucursal:Sucursal {id: TOINT(line.sucursal_id) })
MATCH (mesa:Mesa {id: TOINT(line.mesa_id) })
CREATE (sucursal)-[:HAS]->(mesa)
RETURN sucursal, mesa;