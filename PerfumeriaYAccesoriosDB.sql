drop database if exists DB_PerfumeriaYAccesorios;
create database DB_PerfumeriaYAccesorios;
use DB_PerfumeriaYAccesorios;

-- 1. clientes (Le toca a Alan)



-- 2. proveedores (Le toca a Adrian)


-- 3. categorias (Le toca a Chacón)


-- 4. productos (Le toca a Chacón)


-- 5. empleados (Le toca a Angel)


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

-- VENTAS
-- CRUD TRABAJADO POR Cristian
Ventas:
delimiter $$
create procedure sp_agregarVenta(
    in fechaVenta datetime,
    in totalVenta decimal(10,2),
    in codigoCliente int,
    in codigoEmpleado int)
begin
    insert into ventas (fecha, total, codigoCliente, codigoEmpleado)
    values (fechaVenta, totalVenta, codigoCliente, codigoEmpleado);
end $$
delimiter ;

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
end $$
delimiter ;
-- DETALLEVENTAS
-- CRUD TRABAJADO POR Pablo

-- Facturas
-- CRUD TRABAJADO POR Iverson

-- Compras
-- CRUD TRABAJADO POR Iverson

-- DETALLECOMPRAS
-- CRUD TRABAJADO POR Cristopher