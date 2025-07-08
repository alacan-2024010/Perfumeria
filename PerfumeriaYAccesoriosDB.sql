drop database if exists DB_PerfumeriaYAccesorios;
create database DB_PerfumeriaYAccesorios;
use DB_PerfumeriaYAccesorios;

-- 1. clientes (Le toca a Alan)



-- 2. proveedores (Le toca a Adrian)


-- 3. categorias (Le toca a Chacón)


-- 4. productos (Le toca a Chacón)


-- 5. empleados (Le toca a Angel)

create table Empleados (
	codigoEmpleado int auto_increment,
	nombreEmpleado varchar(100) not null,
	apellidoEmpleado varchar(100) not null,
	direccionEmpleado varchar(255) not null,
	telefonoEmpleado varchar(8) not null,
	emailEmpleado varchar(100) not null,
	puestoEmpleado varchar(50)not null,
    primary key PK_idEmpleado(codigoEmpleado)
);

-- 6. ventas (Le toca a Cristian)



-- 7. detalleVentas (Le toca a Pablo)


-- 8. facturas (Le toca a Iverson)

 -- 9. compras (Le toca a Iverson)
 
 
 -- 10. detalleCompras (Le toca a Cristopher)



-- CLIENTES
-- CRUD TRABAJADO POR Alan Lacán

-- PROVEEDORES
-- CRUD TRABAJADO POR Adrián

-- CATEGORIAS
-- CRUD TRABAJADO POR Chacón

-- PRODUCTOS
-- CRUD TRABAJADO POR Chacón

-- EMPLEADOS
-- CRUD TRABAJADO POR Angel

delimiter $$
	create procedure sp_agregarEmpleado(
		in nombreE varchar(100),
		in apellidoE varchar(100),
		in direccionE varchar(255),
		in telefonoE varchar(8),
		in emailE varchar(100),
		in puestoE varchar(50))
	begin
		insert into empleados (nombreEmpleado, apellidoEmpleado, direccionEmpleado, telefonoEmpleado, emailEmpleado, puestoEmpleado)
		values (nombreE, apellidoE, direccionE, telefonoE, emailE, puestoE);
	end $$
delimiter ;

CALL sp_agregarEmpleado('Carlos', 'Méndez', 'Zona 7, Ciudad de Guatemala', '55671234', 'cmendez@empresa.com', 'Dependiente de mostrador');
CALL sp_agregarEmpleado('Ana', 'González', 'Zona 10, Ciudad de Guatemala', '51234567', 'agonzalez@empresa.com', 'Cajera');
CALL sp_agregarEmpleado('Luis', 'Ramírez', 'Zona 5, Mixco', '55889977', 'lramirez@empresa.com', 'Encargado de almacén');
CALL sp_agregarEmpleado('María', 'Pérez', 'Zona 11, Ciudad de Guatemala', '55443322', 'mperez@empresa.com', 'Asistente de ventas');
CALL sp_agregarEmpleado('Jorge', 'Sánchez', 'Zona 18, Ciudad de Guatemala', '56781234', 'jsanchez@empresa.com', 'Supervisor de tienda');
CALL sp_agregarEmpleado('Claudia', 'Herrera', 'Zona 1, Ciudad de Guatemala', '52346789', 'cherrera@empresa.com', 'Recepcionista');
CALL sp_agregarEmpleado('Pedro', 'López', 'Zona 16, Ciudad de Guatemala', '57684321', 'plopez@empresa.com', 'Auxiliar de limpieza');
CALL sp_agregarEmpleado('Sofía', 'Martínez', 'Villa Nueva, Guatemala', '58991123', 'smartinez@empresa.com', 'Cosmetóloga');
CALL sp_agregarEmpleado('Ricardo', 'Ortega', 'Zona 2, Ciudad de Guatemala', '53456789', 'rortega@empresa.com', 'Gerente general');
CALL sp_agregarEmpleado('Andrea', 'Morales', 'Amatitlán, Guatemala', '51239876', 'amorales@empresa.com', 'Cajera');
CALL sp_agregarEmpleado('Kevin', 'Ruiz', 'Zona 6, Ciudad de Guatemala', '56784321', 'kruiz@empresa.com', 'Dependiente de mostrador');
CALL sp_agregarEmpleado('Brenda', 'Castillo', 'Villa Canales, Guatemala', '53334444', 'bcastillo@empresa.com', 'Asistente administrativa');
CALL sp_agregarEmpleado('Oscar', 'Fernández', 'Zona 3, Mixco', '59001234', 'ofernandez@empresa.com', 'Encargado de limpieza');
CALL sp_agregarEmpleado('Elena', 'Vásquez', 'Zona 12, Ciudad de Guatemala', '57894561', 'evasquez@empresa.com', 'Vendedora de productos');
CALL sp_agregarEmpleado('David', 'Cabrera', 'Santa Catarina Pinula, Guatemala', '52349876', 'dcabrera@empresa.com', 'Técnico en fragancias');


delimiter $$
	create procedure sp_listarEmpleados()
	begin
		select codigoEmpleado, nombreEmpleado, apellidoEmpleado, direccionEmpleado, telefonoEmpleado, emailEmpleado, puestoEmpleado
		from empleados;
	end $$
delimiter ;
CALL sp_listarEmpleados;

delimiter $$
	create procedure sp_buscarEmpleado(in codigoE int)
	begin
		select codigoEmpleado, nombreEmpleado, apellidoEmpleado, direccionEmpleado, telefonoEmpleado, emailEmpleado, puestoEmpleado
		from empleados
		where codigoEmpleado = codigoE;
	end $$
delimiter ;
CALL sp_buscarEmpleado(1);

delimiter $$
	create procedure sp_editarEmpleado(
		in codigoE int,
		in nombreE varchar(100),
		in apellidoE varchar(100),
		in direccionE varchar(255),
		in telefonoE varchar(8),
		in emailE varchar(100),
		in puestoE varchar(50))
	begin
		update empleados
		set nombreEmpleado = nombreE,
			apellidoEmpleado = apellidoE,
			direccionEmpleado = direccionE,
			telefonoEmpleado = telefonoE,
			emailEmpleado = emailE,
			puestoEmpleado = puestoE
		where codigoEmpleado = codigoE;
	end $$
delimiter ;
CALL sp_editarEmpleado(15,'David', 'Cabrera', 'Santa Catarina Pinula, Guatemala', '52349876', 'dcabrera@empresa.com', 'Técnico en ya');

delimiter $$
create procedure sp_eliminarEmpleado(
	in codigoE int)
begin
	delete from Empleados
		Where codigoE = codigoEmpleado;
end $$
delimiter ;
CALL sp_eliminarEmpleado(1);

-- VENTAS
-- CRUD TRABAJADO POR Cristian

-- DETALLEVENTAS
-- CRUD TRABAJADO POR Pablo

-- Facturas
-- CRUD TRABAJADO POR Iverson

-- Compras
-- CRUD TRABAJADO POR Iverson

-- DETALLECOMPRAS
-- CRUD TRABAJADO POR Cristopher