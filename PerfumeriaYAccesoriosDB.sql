drop database if exists DB_PerfumeriaYAccesorios;
create database DB_PerfumeriaYAccesorios;
use DB_PerfumeriaYAccesorios;

-- 1. clientes (Le toca a Alan)
create table Clientes (
	codigoCliente int not null auto_increment,
	nombreCliente varchar(100) not null,
	apellidoCliente varchar(100) not null,
	direccionCliente varchar(255) not null,
	telefonoCliente varchar(8) not null,
	emailCliente varchar(100),
    fechaCompra date,
	primary key PK_codigoCliente(codigoCliente)
);



-- 2. proveedores (Le toca a Adrian)



-- 3. categorias (Le toca a Chacón)



-- 4. productos (Le toca a Chacón)




-- 5. empleados (Le toca a Angel)


-- 6. ventas (Le toca a Cristian)


-- 7. detalleVentas (Le toca a Pablo)


-- 8. facturas (Le toca a Iverson)


 -- 9. compras (Le toca a Iverson)
 
 
 -- 10. detalleCompras (Le toca a Cristopher)