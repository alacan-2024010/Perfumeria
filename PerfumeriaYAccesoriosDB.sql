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


-- 8. facturas (Le toca a Iverson)

 -- 9. compras (Le toca a Iverson)
 
 
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

call sp_agregarDetalleCompra(2, 25.50, 1, 101);
call sp_agregarDetalleCompra(1, 13.99, 1, 102);
call sp_agregarDetalleCompra(5, 7.25, 2, 103);
call sp_agregarDetalleCompra(3, 45.00, 2, 104);
call sp_agregarDetalleCompra(6, 5.75, 3, 105);
call sp_agregarDetalleCompra(4, 32.10, 3, 106);
call sp_agregarDetalleCompra(2, 19.99, 4, 107);
call sp_agregarDetalleCompra(8, 3.50, 4, 108);
call sp_agregarDetalleCompra(1, 150.00, 5, 109);
call sp_agregarDetalleCompra(7, 1.99, 5, 110);
call sp_agregarDetalleCompra(10, 0.99, 6, 111);
call sp_agregarDetalleCompra(3, 27.89, 6, 112);
call sp_agregarDetalleCompra(9, 2.25, 7, 113);
call sp_agregarDetalleCompra(2, 120.00, 7, 114);
call sp_agregarDetalleCompra(1, 300.00, 8, 115);

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