drop database if exists DB_PerfumeriaYAccesorios;
create database DB_PerfumeriaYAccesorios;
use DB_PerfumeriaYAccesorios;

-- 1. clientes (Le toca a Alan)



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