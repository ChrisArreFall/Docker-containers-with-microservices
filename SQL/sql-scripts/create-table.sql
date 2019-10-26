DROP TABLE IF EXISTS `USUARIO`;
DROP TABLE IF EXISTS `CLIENTE`;
DROP TABLE IF EXISTS `ORDENXSERVICIO`;
DROP TABLE IF EXISTS `ORDENXPRODUCTO`;
DROP TABLE IF EXISTS `ORDEN`;
DROP TABLE IF EXISTS `SERVICIO`;
DROP TABLE IF EXISTS `PRODUCTO`;
DROP TABLE IF EXISTS `SUCURSALXMESA`;
DROP TABLE IF EXISTS `RESERVA`;
DROP TABLE IF EXISTS `SUCURSAL`;
DROP TABLE IF EXISTS `MESA`;


CREATE TABLE SUCURSAL (
    sucursal_id int NOT NULL AUTO_INCREMENT,
    nombre varchar(25),
    direccion  varchar(255),
    PRIMARY KEY (sucursal_id)
);


CREATE TABLE USUARIO (
    usuario_id int NOT NULL AUTO_INCREMENT,
    nombre varchar(25),
    apellido  varchar(25),
    usuario varchar(25),
    contrasenha varchar(25),
    PRIMARY KEY (usuario_id)
);

CREATE TABLE CLIENTE (
    cliente_id int NOT NULL AUTO_INCREMENT,
    nombre varchar(25),
    apellido  varchar(25),
    PRIMARY KEY (cliente_id)
);


CREATE TABLE MESA (
    mesa_id int NOT NULL AUTO_INCREMENT,
    sucursal_id int,
    PRIMARY KEY (mesa_id),
    FOREIGN KEY (sucursal_id) REFERENCES SUCURSAL(sucursal_id)
);


CREATE TABLE ORDEN (
    orden_id int NOT NULL AUTO_INCREMENT,
    cliente_id int,
    sucursal_id int,
    fecha date,
    total  int,
    PRIMARY KEY (orden_id),
    FOREIGN KEY (cliente_id) REFERENCES CLIENTE(cliente_id),
    FOREIGN KEY (sucursal_id) REFERENCES SUCURSAL(sucursal_id)
);

CREATE TABLE SERVICIO (
    servicio_id int NOT NULL AUTO_INCREMENT,
    sucursal_id int,
    nombre varchar(100),
    precio  int,
    PRIMARY KEY (servicio_id),
    FOREIGN KEY (sucursal_id) REFERENCES SUCURSAL(sucursal_id)
);

CREATE TABLE PRODUCTO (
    product_id int NOT NULL AUTO_INCREMENT,
    sucursal_id int,
    nombre varchar(100),
    precio  int,
    PRIMARY KEY (product_id),
    FOREIGN KEY (sucursal_id) REFERENCES SUCURSAL(sucursal_id)
);

CREATE TABLE ORDENXSERVICIO (
    sucursalXmesa_id int NOT NULL AUTO_INCREMENT,
    orden_id int,
    servicio_id int,
    PRIMARY KEY (sucursalXmesa_id),
    FOREIGN KEY (orden_id) REFERENCES ORDEN(orden_id),
    FOREIGN KEY (servicio_id) REFERENCES SERVICIO(servicio_id)
);

CREATE TABLE ORDENXPRODUCTO (
    ordenXproducto_id int NOT NULL AUTO_INCREMENT,
    orden_id int,
    product_id int,
    PRIMARY KEY (ordenXproducto_id),
    FOREIGN KEY (orden_id) REFERENCES ORDEN(orden_id),
    FOREIGN KEY (product_id) REFERENCES PRODUCTO(product_id)
);

CREATE TABLE SUCURSALXMESA (
    sucursalXmesa_id int NOT NULL AUTO_INCREMENT,
    sucursal_id int,
    mesa_id int,
    PRIMARY KEY (sucursalXmesa_id),
    FOREIGN KEY (sucursal_id) REFERENCES SUCURSAL(sucursal_id),
    FOREIGN KEY (mesa_id) REFERENCES MESA(mesa_id)
);

CREATE TABLE RESERVA (
    reserva_id int NOT NULL AUTO_INCREMENT,
    cliente_id int,
    sucursal_id int,
    mesa_id  int,
    fecha date,
    PRIMARY KEY (reserva_id),
    FOREIGN KEY (cliente_id) REFERENCES CLIENTE(cliente_id),
    FOREIGN KEY (sucursal_id) REFERENCES SUCURSAL(sucursal_id),
    FOREIGN KEY (mesa_id) REFERENCES MESA(mesa_id)
);

