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
create table Categorias (
	codigoCategoria int not null auto_increment,
	nombre varchar(50) not null,
	primary key PK_codigoCategoria(codigoCategoria)
);

-- 4. productos (Le toca a Chacón)
create table Productos (
    codigoProducto int not null auto_increment,
    nombreProducto varchar(100) not null,
    descripcionProducto varchar(255),
    precioProducto decimal(10,2) not null,
    stock int not null,
    primary key PK_codigoProducto(codigoProducto),
    codigoCategoria int,
    codigoProveedor int,
    constraint FK_categoria foreign key (codigoCategoria) 
        references Categorias(codigoCategoria) on delete cascade,
    constraint FK_proveedor foreign key (codigoProveedor) 
        references Proveedores(codigoProveedor) on delete cascade
);

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
create table Ventas (
	codigoVenta int auto_increment,
	fecha datetime default current_timestamp,
	total decimal(10,2),
    primary key PK_codigoVenta(codigoVenta),
	codigoCliente int,
	codigoEmpleado int,
	constraint FK_ventaCliente foreign key (codigoCliente) 
		references Clientes(codigoCliente) on delete cascade,
	constraint FK_ventaEmpleado foreign key (codigoEmpleado) 
		references Empleados(codigoEmpleado) on delete cascade
);



-- 7. detalleVentas (Le toca a Pablo)
create table DetalleVentas (
    codigoDetalleVenta int auto_increment, 
	cantidad int not null,
    precioUnitario decimal(10,2)not null,
    primary key PK_codigoDetalleVenta(codigoDetalleVenta),
    codigoVenta int,
    codigoProducto int,
    constraint FK_detalleVenta_venta foreign key (codigoVenta) 
		references Ventas(codigoVenta) on delete cascade,
    constraint FK_detalleVenta_producto foreign key (codigoProducto)
		references Productos(codigoProducto)on delete cascade
);
-- 8. facturas (Le toca a Iverson)
create table Facturas (
	codigoFactura int auto_increment,
	numeroFactura varchar(50) not null,
	fechaEmision datetime,
	totalFactura decimal(10,2),
	primary key PK_codigoFactura(codigoFactura),
	codigoVenta int unique,
    constraint FK_ventasFactura foreign key (codigoVenta) 
		references Ventas(codigoVenta) on delete cascade
);

-- 9. compras (Le toca a Iverson)
create table Compras (
	codigoCompra int auto_increment,
	fechaCompra datetime,
	total decimal(10,2),
	primary key PK_codigoCompra(codigoCompra),
	codigoProveedor int,
	codigoEmpleado int,
	constraint FK_compraProveedor foreign key (codigoProveedor) 
		references Proveedores(codigoProveedor) on delete cascade,
	constraint FK_compraEmpleado foreign key (codigoEmpleado) 
		references Empleados(codigoEmpleado) on delete cascade
);

-- 10. detalleCompras (Le toca a Cristopher)
create table DetalleCompras (
    codigoDetalleCompra int auto_increment,
    cantidad int not null ,
    precioUnitario decimal(10,2)not null,
    primary key PK_codigoDetalleCompra(codigoDetalleCompra),
    codigoCompra int,
    codigoProducto int,
    constraint FK_detalleCompra_Compra foreign key (codigoCompra) 
		references Compras(codigoCompra) on delete cascade,
    constraint FK_detalleCompra_Producto foreign key (codigoProducto) 
		references Productos(codigoProducto) on delete cascade
);


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
		in telefonoProveedor varchar(20) ,
		in correoProveedor varchar(100) )
	begin
		insert into Proveedores (nombreProveedor, direccionProveedor, telefonoProveedor, correoProveedor)
		values (nombreProveedor, direccionProveedor, telefonoProveedor, correoProveedor);
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
		select codigoProveedor, nombreProveedor, direccionProveedor, telefonoProveedor, correoProveedor from Proveedores
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
delimiter $$
create procedure sp_agregarCategoria(
	in nombre varchar(50))
begin
    insert into categorias (nombre) 
		values (nombre);
end $$
delimiter ;
call sp_agregarCategoria('Perfumes y lociones');
call sp_agregarCategoria('Joyería');
call sp_agregarCategoria('Relojes');
call sp_agregarCategoria('Bolsos y carteras');
call sp_agregarCategoria('Lentes y accesorios');

-- Listar Categoría
delimiter $$
	create procedure sp_listarCategorias()
	begin
		select codigoCategoria, nombre
		from categorias;
	end $$
delimiter ;

-- Buscar Categoría
delimiter $$
	create procedure sp_buscarCategoria(in codigoC int)
	begin
		select codigoCategoria, nombre
		from categorias
		where codigoCategoria = codigoC;
	end $$
delimiter ;

-- Editar Categoría
delimiter $$
create procedure sp_editarCategoria(
	in codigoC int, 
	in nombreC varchar(50))
begin
    update categorias 
	set nombre = nombreC 
    where codigoCategoria = codigoC;
end $$
delimiter ;

-- Eliminar Categoría
delimiter $$
create procedure sp_eliminarCategoria(in codigoC int)
begin
    delete from categorias 
		where codigoCategoria = codigoC;
end $$
delimiter ;
-- PRODUCTOS
-- CRUD TRABAJADO POR Chacón
delimiter $$
	create procedure sp_agregarProducto(
		in nombreP varchar(100),
		in descripcionP varchar(255),
		in precioP decimal(10,2),
		in stockP int,
		in codigoCategoria int,
		in codigoProveedor int)
	begin
		insert into productos (nombreProducto, descripcionProducto, precioProducto, stock, codigoCategoria, codigoProveedor)
		values (nombreP, descripcionP, precioP, stockP, codigoCategoria, codigoProveedor);
	end $$
delimiter ;
call sp_agregarProducto('Dior Sauvage', 'Aroma fresco y amaderado', 1500.00, 20, 1, 1);
call sp_agregarProducto('Bleu de Chanel', 'Fragancia cítrica y aromática', 1250.00, 20, 1, 2);
call sp_agregarProducto('Acqua di Giò', 'Frescura marina y cítrica', 1400.00, 20, 1, 3);
call sp_agregarProducto('1 Million', 'Aroma cálido y especiado', 1200.00, 20, 1, 4);
call sp_agregarProducto('Le Male', 'Fragancia oriental y fresca', 1100.00, 20, 1, 5);
call sp_agregarProducto('Terre d’Hermès', 'Aroma amaderado y cítrico', 1550.00, 20, 1, 6);
call sp_agregarProducto('Aventus', 'Fragancia frutal y ahumada', 3500.00, 10, 1, 7);
call sp_agregarProducto('Boss Bottled', 'Aroma cálido y especiado', 1300.00, 20, 1, 8);
call sp_agregarProducto('Fahrenheit', 'Fragancia fresca y amaderada', 1350.00, 20, 1, 2);
call sp_agregarProducto('Invictus', 'Aroma fresco y energético', 1250.00, 20, 1, 3);
call sp_agregarProducto('Explorer', 'Fragancia aventurera y vibrante', 1400.00, 20, 1, 5);
call sp_agregarProducto('Pure XS', 'Aroma dulce y especiado', 1200.00, 20, 1, 6);
call sp_agregarProducto('La Vie Est Belle', 'Fragancia dulce y floral', 1450.00, 20, 1, 9);
call sp_agregarProducto('J’adore', 'Aroma floral y elegante', 1600.00, 20, 1, 10);
call sp_agregarProducto('Coco Mademoiselle', 'Fragancia fresca y floral', 1550.00, 20, 1, 11);
call sp_agregarProducto('Black Opium', 'Aroma dulce y oriental', 1480.00, 20, 1, 12);
call sp_agregarProducto('Light Blue', 'Fragancia cítrica y fresca', 1350.00, 20, 1, 13);
call sp_agregarProducto('Good Girl', 'Aroma floral y especiado', 1500.00, 20, 1, 14);
call sp_agregarProducto('Mon Guerlain', 'Fragancia suave y dulce', 1520.00, 20, 1, 15);
call sp_agregarProducto('Flowerbomb', 'Aroma floral explosivo', 1600.00, 20, 1, 1);
call sp_agregarProducto('Bright Crystal', 'Fragancia fresca y floral', 1300.00, 20, 1, 8);
call sp_agregarProducto('Si', 'Aroma elegante y sofisticado', 1450.00, 20, 1, 9);
call sp_agregarProducto('Angel', 'Fragancia dulce y gourmand', 1500.00, 20, 1, 10);
call sp_agregarProducto('Euphoria', 'Aroma intenso y seductor', 1400.00, 20, 1, 11);
call sp_agregarProducto('Collar de Plata', 'Collar elegante color plata', 350.00, 15, 2, 7);
call sp_agregarProducto('Reloj Clásico', 'Reloj sencillo y elegante', 1800.00, 10, 3, 9);
call sp_agregarProducto('Aretes de Oro', 'Aretes dorados pequeños', 750.00, 15, 2, 10);
call sp_agregarProducto('Cinturón de Cuero', 'Cinturón clásico de cuero', 220.00, 20, 4, 12);
call sp_agregarProducto('Cartera de Cuero', 'Cartera resistente color café', 300.00, 15, 4, 11);
call sp_agregarProducto('Anillo de Oro 14K', 'Anillo elegante de oro 14 quilates', 1800.00, 10, 2, 15);
call sp_agregarProducto('Pulsera de Cuero', 'Pulsera café con broche metálico', 85.00, 12, 2, 7);
call sp_agregarProducto('Lentes de Sol', 'Lentes oscuros con marco grande', 120.00, 17, 5, 11);
call sp_agregarProducto('Bolso pequeño', 'Bolso de mano, color beige', 220.00, 10, 4, 12);
call sp_agregarProducto('Pulsera de Diamantes', 'Pulsera elegante con diamantes incrustados', 7500.00, 3, 2, 1);
call sp_agregarProducto('Anillo de Platino', 'Anillo de platino con diseño moderno y exclusivo', 9500.00, 2, 2, 2);
call sp_agregarProducto('Bolso Chanel Classic', 'Bolso clásico de Chanel en piel negra', 12000.00, 1, 4, 3);
call sp_agregarProducto('Perfume Homme Intense', 'Fragancia masculina con notas amaderadas y especiadas', 2800.00, 5, 1, 4);
call sp_agregarProducto('Perfume Femme Elegance', 'Perfume femenino floral con fondo de vainilla', 3200.00, 5, 1, 5);


-- Listar Producto
delimiter $$
	create procedure sp_listarProductos()
	begin
		select codigoProducto, nombreProducto, descripcionProducto, precioProducto, stock, codigoCategoria, codigoProveedor
		from productos;
	end $$
delimiter ;

-- Buscar Producto
delimiter $$
	create procedure sp_buscarProducto(in codigoP int)
	begin
		select codigoProducto, nombreProducto, descripcionProducto, precioProducto, stock, codigoCategoria, codigoProveedor
		from productos
		where codigoProducto = codigoP;
	end $$
delimiter ;

-- Editar Producto
delimiter $$
	create procedure sp_editarProducto(
		in codigoP int,
		in nombreP varchar(100),
		in descripcionP varchar(255),
		in precioP decimal(10,2),
		in stockP int,
		in codigoCategoria int,
		in codigoProveedor int)
	begin
		update productos
		set nombreProducto = nombreP,
			descripcionProducto = descripcionP,
			precioProducto = precioP,
			stock = stockP,
			codigoCategoria = codigoCategoria,
			codigoProveedor = codigoProveedor
		where codigoProducto = codigoP;
	end $$
delimiter ;

-- Eliminar Producto
delimiter $$
	create procedure sp_eliminarProducto(in codigoP int)
	begin
		delete from productos
			where codigoProducto = codigoP;
	end $$
delimiter ;

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
CALL sp_listarEmpleados();

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
		Where codigoEmpleado = codigoE;
end $$
delimiter ;
-- CALL sp_eliminarEmpleado(1);

-- VENTAS
-- CRUD TRABAJADO POR Cristian

delimiter $$
create procedure sp_agregarVenta(
    in fecha datetime,
    in total decimal(10,2),
    in codigoCliente int,
    in codigoEmpleado int)
begin
    insert into ventas (fecha, total, codigoCliente, codigoEmpleado)
    values (fecha, total, codigoCliente, codigoEmpleado);
end $$
delimiter ;
call sp_agregarVenta('2025-07-01 10:15:00', 125.50, 1, 2);
call sp_agregarVenta('2025-07-01 11:45:00', 89.99, 2, 1);
call sp_agregarVenta('2025-07-02 09:30:00', 250.00, 3, 4);
call sp_agregarVenta('2025-07-02 14:00:00', 145.75, 4, 5);
call sp_agregarVenta('2025-07-03 12:10:00', 310.25, 5, 3);
call sp_agregarVenta('2025-07-03 16:45:00', 72.80, 1, 1);
call sp_agregarVenta('2025-07-04 08:50:00', 199.99, 2, 2);
call sp_agregarVenta('2025-07-04 18:00:00', 65.40, 3, 4);
call sp_agregarVenta('2025-07-05 10:20:00', 158.90, 4, 3);
call sp_agregarVenta('2025-07-05 13:00:00', 230.15, 5, 5);
call sp_agregarVenta('2025-07-06 15:30:00', 95.00, 1, 2);
call sp_agregarVenta('2025-07-06 17:45:00', 178.25, 2, 1);
call sp_agregarVenta('2025-07-07 11:00:00', 320.00, 3, 4);
call sp_agregarVenta('2025-07-07 14:10:00', 112.35, 4, 5);
call sp_agregarVenta('2025-07-07 19:30:00', 88.80, 5, 3);


delimiter $$
create procedure sp_listarVentas()
begin
    select codigoVenta, fecha, total, codigoCliente, codigoEmpleado
    from ventas;
end $$
delimiter ;

delimiter $$
create procedure sp_buscarVenta(in codigoV int)
begin
    select codigoVenta, fecha, total, codigoCliente, codigoEmpleado
    from ventas
    where codigoVenta = codigoV;
end $$
delimiter ;

delimiter $$
create procedure sp_editarVenta(
    in codigoV int,
    in fechaVenta datetime,
    in totalVenta decimal(10,2),
    in codigoCliente int,
    in codigoEmpleado int)
begin
    update ventas
    set fecha = fechaVenta,
        total = totalVenta,
        codigoCliente = codigoCliente,
        codigoEmpleado = codigoEmpleado
    where codigoVenta = codigoV;
end $$
delimiter ;

delimiter $$
create procedure sp_eliminarVenta(in codigoV int)
begin
    delete from ventas 
		where codigoVenta = codigoV;
end $$
delimiter ;
-- DETALLEVENTAS
-- CRUD TRABAJADO POR Pablo
delimiter $$
create procedure sp_agregarDetalleVenta(
    in cantidadDV int,
    in precioUnitarioDV decimal(10,2),
    in codigoVenta int,
    in codigoProducto int)
begin
    insert into DetalleVentas (cantidad, precioUnitario, codigoVenta, codigoProducto)
    values (cantidadDV, precioUnitarioDV, codigoVenta, codigoProducto);
end $$
delimiter ;

call sp_agregarDetalleVenta(2, 15.99, 1, 1);
call sp_agregarDetalleVenta(1, 20.50, 1, 2);
call sp_agregarDetalleVenta(3, 9.75, 2, 3);
call sp_agregarDetalleVenta(5, 12.00, 2, 4);
call sp_agregarDetalleVenta(4, 18.30, 3, 5);
call sp_agregarDetalleVenta(2, 5.25, 3, 6);
call sp_agregarDetalleVenta(1, 45.00, 4, 7);
call sp_agregarDetalleVenta(6, 7.90, 4, 8);
call sp_agregarDetalleVenta(3, 11.49, 5, 9);
call sp_agregarDetalleVenta(2, 22.10, 5, 10);
call sp_agregarDetalleVenta(1, 30.00, 6, 11);
call sp_agregarDetalleVenta(7, 4.99, 6, 12);
call sp_agregarDetalleVenta(2, 13.75, 7, 13);
call sp_agregarDetalleVenta(3, 19.99, 7, 14);
call sp_agregarDetalleVenta(5, 8.60, 8, 15);

delimiter $$
create procedure sp_listarDetalleVentas()
begin
    select codigoDetalleVenta, cantidad, precioUnitario, codigoVenta, codigoProducto
    from DetalleVentas;
end $$
delimiter ;

delimiter $$
create procedure sp_buscarDetalleVenta(in codigoDV int)
begin
    select codigoDetalleVenta, cantidad, precioUnitario, codigoVenta, codigoProducto
    from DetalleVentas
    where codigoDetalleVenta = codigoDV;
end $$
delimiter ;

delimiter $$
create procedure sp_editarDetalleVenta(
    in codigoDV int,
    in cantidadDV int,
    in precioUnitarioDV decimal(10,2),
    in codigoVenta int,
    in codigoProducto int)
begin
    update DetalleVentas
    set cantidad = cantidadDV,
        precioUnitario = precioUnitarioDV,
        codigoVenta = codigoVenta,
        codigoProducto = codigoProducto
    where codigoDetalleVenta = codigoDV;
end $$
delimiter ;

delimiter $$
create procedure sp_eliminarDetalleVenta(in codigoDV int)
begin
    delete from DetalleVentas
		where codigoDetalleVenta = codigoDV;
end $$
delimiter ;
-- Facturas
-- CRUD TRABAJADO POR Iverson
delimiter $$
create procedure sp_agregarFactura(
    in numeroFactura varchar(50),
    in fechaEmision datetime,
    in totalFactura decimal(10,2),
    in codigoVenta int)
begin
    insert into Facturas (numeroFactura, fechaEmision, totalFactura, codigoVenta)
    values (numeroFactura, fechaEmision, totalFactura, codigoVenta);
end $$
delimiter ;
call sp_agregarFactura('FAC-001', '2024-01-15 10:30:00', 1250.75, 1);
call sp_agregarFactura('FAC-002', '2024-01-16 14:45:00', 890.50, 2);
call sp_agregarFactura('FAC-003', '2024-01-17 09:15:00', 2340.25, 3);
call sp_agregarFactura('FAC-004', '2024-01-18 16:20:00', 567.80, 4);
call sp_agregarFactura('FAC-005', '2024-01-19 11:10:00', 1890.00, 5);
call sp_agregarFactura('FAC-006', '2024-01-20 13:25:00', 745.60, 6);
call sp_agregarFactura('FAC-007', '2024-01-21 08:40:00', 3210.40, 7);
call sp_agregarFactura('FAC-008', '2024-01-22 15:55:00', 456.90, 8);
call sp_agregarFactura('FAC-009', '2024-01-23 12:30:00', 1678.25, 9);
call sp_agregarFactura('FAC-010', '2024-01-24 17:45:00', 2890.75, 10);
call sp_agregarFactura('FAC-011', '2024-01-25 10:20:00', 934.50, 11);
call sp_agregarFactura('FAC-012', '2024-01-26 14:35:00', 1567.30, 12);
call sp_agregarFactura('FAC-013', '2024-01-27 09:50:00', 2145.80, 13);
call sp_agregarFactura('FAC-014', '2024-01-28 16:15:00', 789.40, 14);
call sp_agregarFactura('FAC-015', '2024-01-29 11:05:00', 3456.90, 15);

delimiter $$
create procedure sp_listarFacturas()
begin
    select codigoFactura, numeroFactura, fechaEmision, totalFactura, codigoVenta
    from Facturas;
end $$
delimiter ;

delimiter $$
create procedure sp_buscarFactura(in codigoF int)
begin
    select codigoFactura, numeroFactura, fechaEmision, totalFactura, codigoVenta
    from Facturas
    where codigoFactura = codigoF;
end $$
delimiter ;

delimiter $$
create procedure sp_editarFactura(
    in codigoF int,
    in numeroF varchar(50),
    in fechaE datetime,
    in totalF decimal(10,2),
    in codigoV int)
begin
    update Facturas
    set numeroFactura = numeroF,
        fechaEmision = fechaE,
        totalFactura = totalF,
        codigoVenta = codigoV
    where codigoFactura = codigoF;
end $$
delimiter ;

delimiter $$
create procedure sp_eliminarFactura(in codigoF int)
begin
    delete from Facturas 
		where codigoFactura = codigoF;
end $$
delimiter ;
-- Compras
-- CRUD TRABAJADO POR Iverson
delimiter $$
create procedure sp_agregarCompra(
    in fechaCompra datetime,
    in totalCompra decimal(10,2),
    in codigoProveedor int,
    in codigoEmpleado int)
begin
    insert into Compras(fechaCompra, total, codigoProveedor, codigoEmpleado)
    values (fechaCompra, totalCompra, codigoProveedor, codigoEmpleado);
end $$
delimiter ;

call sp_agregarCompra('2024-01-10 08:30:00', 5420.75, 1, 1);
call sp_agregarCompra('2024-01-11 10:15:00', 3890.50, 2, 2);
call sp_agregarCompra('2024-01-12 14:20:00', 7234.25, 3, 3);
call sp_agregarCompra('2024-01-13 09:45:00', 2567.80, 4, 4);
call sp_agregarCompra('2024-01-14 16:30:00', 4890.00, 5, 5);
call sp_agregarCompra('2024-01-15 11:25:00', 1745.60, 6, 6);
call sp_agregarCompra('2024-01-16 13:40:00', 8210.40, 7, 7);
call sp_agregarCompra('2024-01-17 07:55:00', 3456.90, 8, 8);
call sp_agregarCompra('2024-01-18 15:10:00', 6678.25, 9, 9);
call sp_agregarCompra('2024-01-19 12:45:00', 5890.75, 10, 10);
call sp_agregarCompra('2024-01-20 17:20:00', 2934.50, 11, 11);
call sp_agregarCompra('2024-01-21 09:35:00', 4567.30, 12, 12);
call sp_agregarCompra('2024-01-22 14:50:00', 7145.80, 13, 13);
call sp_agregarCompra('2024-01-23 11:15:00', 3789.40, 14, 14);
call sp_agregarCompra('2024-01-24 16:05:00', 9456.90, 15, 15);

delimiter $$
create procedure sp_listarCompras()
begin
    select codigoCompra, fechaCompra, total, codigoProveedor, codigoEmpleado
    from Compras;
end $$
delimiter ;

delimiter $$
create procedure sp_buscarCompra(in codigoC int)
begin
    select codigoCompra, fechaCompra, total, codigoProveedor, codigoEmpleado
    from Compras
    where codigoCompra = codigoC;
end $$
delimiter ;

delimiter $$
create procedure sp_editarCompra(
    in codigoC int,
    in fechaCo datetime,
    in totalCo decimal(10,2),
    in codigoP int,
    in codigoE int)
begin
    update Compras
    set fechaCompra = fechaCo,
        total = totalCo,
        codigoProveedor = codigoP,
        codigoEmpleado = codigoE
    where codigoCompra = codigoC;
end $$
delimiter ;

delimiter $$
create procedure sp_eliminarCompra(in codigoC int)
begin
    delete from Compras
		where codigoCompra = codigoC;
end $$
delimiter ;
-- DETALLECOMPRAS
delimiter $$
create procedure sp_agregarDetalleCompra(
    in cantidadDC int,
    in precioUnitarioDC decimal(10,2),
    in codigoCompra int,
    in codigoProducto int)
begin
    insert into DetalleCompras (cantidad, precioUnitario, codigoCompra, codigoProducto)
    values (cantidadDC, precioUnitarioDC, codigoCompra, codigoProducto);
end $$
delimiter ;

call sp_agregarDetalleCompra(2, 25.50, 1, 1);
call sp_agregarDetalleCompra(1, 13.99, 1, 2);
call sp_agregarDetalleCompra(5, 7.25, 2, 3);
call sp_agregarDetalleCompra(3, 45.00, 2, 4);
call sp_agregarDetalleCompra(6, 5.75, 3, 5);
call sp_agregarDetalleCompra(4, 32.10, 3, 6);
call sp_agregarDetalleCompra(2, 19.99, 4, 7);
call sp_agregarDetalleCompra(8, 3.50, 4, 8);
call sp_agregarDetalleCompra(1, 150.00, 5, 9);
call sp_agregarDetalleCompra(7, 1.99, 5, 10);
call sp_agregarDetalleCompra(10, 0.99, 6, 11);
call sp_agregarDetalleCompra(3, 27.89, 6, 12);
call sp_agregarDetalleCompra(9, 2.25, 7, 13);
call sp_agregarDetalleCompra(2, 120.00, 7, 14);
call sp_agregarDetalleCompra(1, 300.00, 8, 15);

-- listar detalleCompras
delimiter $$
create procedure sp_listarDetalleCompras()
begin
    select codigoDetalleCompra, cantidad, precioUnitario, codigoCompra, codigoProducto
    from DetalleCompras;
end $$
delimiter ;

-- buscar detalleCompra
delimiter $$
create procedure sp_buscarDetalleCompra(in codigoDC int)
begin
    select codigoDetalleCompra, cantidad, precioUnitario, codigoCompra, codigoProducto
    from DetalleCompras
    where codigoDetalleCompra = codigoDC;
end $$
delimiter ;

-- editar detalleCompra
delimiter $$
create procedure sp_editarDetalleCompra(
    in codigoDC int,
    in cantidadDC int,
    in precioUnitarioDC decimal(10,2),
    in codigoCompra int,
    in codigoProducto int)
begin
    update DetalleCompras
    set cantidad = cantidadDC,
        precioUnitario = precioUnitarioDC,
        codigoCompra = codigoCompra,
        codigoProducto = codigoProducto
    where codigoDetalleCompra = codigoDC;
end $$
delimiter ;

delimiter $$
create procedure sp_eliminarDetalleCompra(in codigoDC int)
begin
    delete from DetalleCompras
		where codigoDetalleCompra = codigoDC;
end $$
delimiter ;
-- CRUD TRABAJADO POR Cristopher