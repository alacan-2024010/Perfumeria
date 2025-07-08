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
create table Proveedores (
	codigoProveedor int not null auto_increment,
    nombreProveedor varchar(100) not null,
    direccionProveedor varchar(255) not null,
    telefonoProveedor varchar(20) not null,
    correoProveedor varchar(100) not null,
    primary key PK_codigoProveedor(codigoProveedor)
);

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

-- Agregar proveedores
Delimiter $$
	create procedure sp_AgregarProveedores(
		in nombreProveedor varchar(100),
		in direccionProveedor varchar(255),
		in telefonoProveedor varchar(20) not null,
		in correoProveedor varchar(100) not null)
	begin
		insert into Proveedores (nombreProveedor, direccionProveedor, telefonoProveedor, correoProveedor)
		values (nombreProveedor, direccionProveedor, telefonoProveedor, correoProveedor)
	end $$
Delimiter ;

call sp_AgregarProveedores('Esencias Maya', 'Zona 1, Ciudad de Guatemala', '44982211', 'esenciasmaya@gmail.com');
call sp_AgregarProveedores('Aromas del Lago', 'Panajachel, Sololá', '50213344', 'aromas.lago@gmail.com');
call sp_AgregarProveedores('Glamour GT', 'Zona 10, Guatemala', '56679988', 'glamour.gt@gmail.com');
call sp_AgregarProveedores('Belleza Natural', 'Antigua Guatemala', '44552233', 'bellezanaturalgt@gmail.com');
call sp_AgregarProveedores('Perfumes del Sur', 'Chiquimula centro', '55881100', 'perfumes.sur@gmail.com');
call sp_AgregarProveedores('Aromas y Estilo', 'Zona 3, Quetzaltenango', '47001234', 'aromas.estilo@gmail.com');
call sp_AgregarProveedores('Accesorios Chic', 'Cobán, Alta Verapaz', '50112233', 'accesorioschicgt@gmail.com');
call sp_AgregarProveedores('Fragancias del Bosque', 'San Lucas Sacatepéquez', '43214455', 'frag.bosque@gmail.com');
call sp_AgregarProveedores('GT Glam Store', 'Zona 14, Guatemala', '52008877', 'gtglamstore@gmail.com');
call sp_AgregarProveedores('Perlas y Aromas', 'Escuintla', '47473366', 'perlasaromasgt@gmail.com');
call sp_AgregarProveedores('Aura Accesorios', 'Jalapa', '42334455', 'aura.accesorios@gmail.com');
call sp_AgregarProveedores('Estilo Urbano GT', 'Mixco, Guatemala', '41116622', 'estilourbanogt@gmail.com');
call sp_AgregarProveedores('Aromas del Norte', 'Huehuetenango', '46779911', 'aromasnorte.gt@gmail.com');
call sp_AgregarProveedores('Detalles con Estilo', 'San Marcos', '48113355', 'detalles.estilo@gmail.com');
call sp_AgregarProveedores('Perfumería Colonial', 'Zona 1, Antigua Guatemala', '40002211', 'perfum.colonial@gmail.com');

-- Listar Proveedores
Delimiter $$
	create procedure sp_ListarProveedores()
		begin
			select codigoProveedor, nombreProveedor, direccionProveedor, telefonoProveedor, correoProveedor
			from Proveedores;
		end $$
Delimiter ;
call sp_ListarProveedores();

-- Eliminar Proveedor
Delimiter $$
	create procedure sp_EliminarProveedor
		(in codigoProv int)
		begin
			delete from Proveedores 
				where codigoProveedor = codigoProv;
		end $$
Delimiter ;
-- call sp_EliminarProveedor(1);

-- Buscar Proveedor
Delimiter $$
	create procedure sp_BuscarProveedor
		(in codigoProv int)
	begin
		select codigoProveedor, nombreProveedor, direccionProveedor, telefonoProveedor, correoProveedor from Proveedores;
			where codigoProveedor = codigoProv;
	end $$
Delimiter ;
call sp_BuscarProveedor(2);

-- Editar Proveedor
Delimiter $$
	create procedure sp_EditarProveedor(
		in codigoProv int,
		in nombreProv varchar(100),
		in direcProv varchar(255),
		in telProv varchar(20),
		in correoProv varchar(100))
	begin
		update Proveedores
		set nombreProveedor = nombreProv,
			direccionProveedor = direcProv,
			telefonoProveedor = telProv,
			correoProveedor = correoProv
		where codigoProveedor = codigoProv;
	end $$
Delimiter ;
call sp_EditarProveedor(15, 'Perfumería Ultra Premium', 'Zona 1, Antigua Guatemala', '40002211', 'perfum.colonial@gmail.com');

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