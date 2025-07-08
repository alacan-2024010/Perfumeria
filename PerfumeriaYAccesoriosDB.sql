drop database if exists DB_PerfumeriaYAccesorios;
create database DB_PerfumeriaYAccesorios;
use DB_PerfumeriaYAccesorios;

-- 1. clientes (Le toca a Alan)



-- 2. proveedores (Le toca a Adrian)


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
        references Proveedores(codigoProveedor) on delete cascade
);

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
end $$
delimiter ;
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
call sp_agregarProducto('Perfume floral', 'Huele a flores', 180.00, 20, 1, 1);
call sp_agregarProducto('Loción de hombre', 'Aroma fuerte para caballeros', 150.00, 30, 1, 2);
call sp_agregarProducto('Pulsera dorada', 'Pulsera bonita color oro', 90.00, 15, 2, 3);
call sp_agregarProducto('Collar plateado', 'Collar con brillo, color plata', 110.00, 10, 2, 1);
call sp_agregarProducto('Aretes pequeños', 'Aretes sencillos y brillantes', 40.00, 50, 2, 2);
call sp_agregarProducto('Perfume dulce', 'Perfume con olor suave y dulce', 170.00, 25, 1, 3);
call sp_agregarProducto('Reloj negro', 'Reloj sencillo color negro', 250.00, 8, 3, 1);
call sp_agregarProducto('Anillo de mujer', 'Anillo sencillo para regalo', 65.00, 18, 2, 2);
call sp_agregarProducto('Pulsera de cuero', 'Pulsera café con broche', 85.00, 12, 2, 3);
call sp_agregarProducto('Perfume de frutas', 'Huele a frutas tropicales', 160.00, 20, 1, 1);
call sp_agregarProducto('Bolso pequeño', 'Bolso de mano, color beige', 220.00, 10, 4, 2);
call sp_agregarProducto('Billetera Gucci', 'Cartera básica para mujer', 140.00, 14, 4, 3);
call sp_agregarProducto('Lentes de sol', 'Lentes oscuros con marco grande', 120.00, 17, 5, 1);
call sp_agregarProducto('Perfume fuerte', 'Aroma intenso, para ocasiones especiales', 195.00, 22, 1, 2);
call sp_agregarProducto('Aretes largos', 'Aretes dorados que cuelgan', 55.00, 30, 2, 3);


--Listar Producto
delimiter $$
	create procedure sp_listarProductos()
	begin
		select codigoProducto, nombreProducto, descripcionProducto, precioProducto, stock, codigoCategoria, codigoProveedor
		from productos;
	end $$
delimiter ;

--Buscar Producto
delimiter $$
	create procedure sp_buscarProducto(in codigoP int)
	begin
		select codigoProducto, nombreProducto, descripcionProducto, precioProducto, stock, codigoCategoria, codigoProveedor
		from productos
		where codigoProducto = codigoP;
	end $$
delimiter ;

--Editar Producto
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

--Eliminar Producto
delimiter $$
	create procedure sp_eliminarProducto(in codigoP int)
	begin
		delete from productos
			where codigoProducto = codigoP;
	end $$
delimiter ;

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