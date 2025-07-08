drop database if exists DB_PerfumeriaYAccesorios;
create database DB_PerfumeriaYAccesorios;
use DB_PerfumeriaYAccesorios;

-- 1. clientes (Le toca a Alan)



-- 2. proveedores (Le toca a Adrian)


-- 3. categorias (Le toca a Chacón)


-- 4. productos (Le toca a Chacón)


-- 5. empleados (Le toca a Angel)


-- 6. ventas (Le toca a Cristian)



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
end $$
delimiter ;
-- Facturas
-- CRUD TRABAJADO POR Iverson

-- Compras
-- CRUD TRABAJADO POR Iverson

-- DETALLECOMPRAS
-- CRUD TRABAJADO POR Cristopher