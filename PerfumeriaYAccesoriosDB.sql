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



-- CLIENTES
-- CRUD TRABAJADO POR Alan Lacán
Delimiter $$
	create procedure sp_AgregarCliente(
		in nombreCliente varchar(100),
		in apellidoCliente varchar(100),
		in direccionCliente varchar(255),
		in telefonoCliente varchar(8),
		in emailCliente varchar(100),
		in fechaCompra date)
	begin
		insert into Clientes (nombreCliente, apellidoCliente, direccionCliente, telefonoCliente, emailCliente, fechaCompra)
		values (nombreCliente, apellidoCliente, direccionCliente, telefonoCliente, emailCliente, fechaCompra);
	end $$
Delimiter ;
call sp_AgregarCliente('Alan', 'Lacán', 'Zona 1, Ciudad de Guatemala', '58319705', 'alan@gmail.com', '2023-12-07');
call sp_AgregarCliente('Andrea', 'López', 'Colonia Molino de Las Flores, Mixco', '55678901', 'andrea@hotmail.com', '2024-08-03');
call sp_AgregarCliente('Fernando', 'Castillo', 'Zona 16, Cayalá', '44781290', 'fernando@gmail.com', '2024-08-08');
call sp_AgregarCliente('Patricia', 'Reyes', 'Villa Nueva', '46789012', 'patricia@hotmail.com', '2024-10-10');
call sp_AgregarCliente('Jorge', 'Chacón', 'San Miguel Petapa', '42345678', 'jorge@gmail.com', '2024-04-10');
call sp_AgregarCliente('Daniela', 'Pérez', 'Mixco, Zona 4, Colonia Primero de Julio', '43901234', 'daniela@gmail.com', '2024-02-01');
call sp_AgregarCliente('Ricardo', 'Flores', 'Amatitlán', '45781234', 'ricardo@hotmail.com', '2025-01-12');
call sp_AgregarCliente('Karla', 'Belteton', 'Zona 5, Ciudad de Guatemala', '46890123', 'karla@hotmail.com', '2025-02-13');
call sp_AgregarCliente('Gabriel', 'Ortiz', 'Zona 13, Aurora II', '42908765', 'gabriel@hotmail.com', '2025-02-17');
call sp_AgregarCliente('Claudia', 'Navarro', 'Villa Canales, Guatemala', '47890123', 'claudia@gmail.com', '2025-01-30');
call sp_AgregarCliente('Brenda', 'Flores', 'Zona 1, Ciudad de Guatemala', '56357794', 'brenda@gmail.com', '2023-08-12');
call sp_AgregarCliente('Gladys', 'Belteton', 'Zona 6, Ciudad de Guatemala', '22883505', 'gladys@hotmail.com', '2023-12-24');
call sp_AgregarCliente('Astrid', 'Lacán', 'Zona 1, Ciudad de Guatemala', '59880531', 'astrid@hotmail.com', '2023-09-27');
call sp_AgregarCliente('Francisco', 'Lacán', 'Amatitlán', '42116602', 'francisco@gmail.com', '2024-01-07');
call sp_AgregarCliente('Julio', 'Flores', 'Villa Nueva', '54078932', 'julio@gmail.com', '2023-11-10');

-- Listar Clientes
Delimiter $$
	create procedure sp_ListarClientes()
		begin
			select codigoCliente, nombreCliente, apellidoCliente, direccionCliente, telefonoCliente, emailCliente, fechaCompra
			from Clientes;
		end $$
Delimiter ;
call sp_ListarClientes();

-- Eliminar Cliente
Delimiter $$
	create procedure sp_EliminarCliente(in codigoC int)
		begin
			delete from Clientes 
				where codigoCliente = codigoC;
		end $$
Delimiter ;
-- call sp_EliminarCliente(1);

-- Buscar Cliente
Delimiter $$
	create procedure sp_BuscarCliente(in codigoC int)
	begin
		select codigoCliente, nombreCliente, apellidoCliente, direccionCliente, telefonoCliente, emailCliente, fechaCompra from Clientes
			where codigoCliente = codigoC;
	end $$
Delimiter ;
call sp_BuscarCliente(2);

-- Editar Cliente
Delimiter $$
	create procedure sp_EditarCliente(
		in codigoC int,
		in nombreC varchar(100),
		in apellidoC varchar(100),
		in direccionC varchar(255),
		in telefonoC varchar(8),
		in emailC varchar(100),
		in fechaC date)
	begin
		update Clientes
		set nombreCliente = nombreC,
			apellidoCliente = apellidoC,
			direccionCliente = direccionC,
			telefonoCliente = telefonoC,
			emailCliente = emailC,
			fechaCompra = fechaC
		where codigoCliente = codigoC;
	end $$
Delimiter ;
call sp_EditarCliente(3, 'Juan', 'Pérez', 'Zona 14', '52789540', 'juan@gmail.com', '2025-02-12');

-- PROVEEDORES
-- CRUD TRABAJADO POR Adrián

-- CATEGORIAS
-- CRUD TRABAJADO POR Chacón

-- PRODUCTOS
-- CRUD TRABAJADO POR Chacón

-- EMPLEADOS
-- CRUD TRABAJADO POR Angel

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