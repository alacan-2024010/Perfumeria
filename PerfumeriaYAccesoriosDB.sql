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
    in numeroFactura varchar(50),
    in fechaEmision datetime,
    in totalFactura decimal(10,2),
    in codigoVenta int)
begin
    update Facturas
    set numeroFactura = numeroFactura,
        fechaEmision = fechaEmision,
        totalFactura = totalFactura,
        codigoVenta = codigoVenta
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

call sp_agregarCompra('2024-01-10 08:30:00', 5420.75, 101, 201);
call sp_agregarCompra('2024-01-11 10:15:00', 3890.50, 102, 202);
call sp_agregarCompra('2024-01-12 14:20:00', 7234.25, 103, 203);
call sp_agregarCompra('2024-01-13 09:45:00', 2567.80, 104, 204);
call sp_agregarCompra('2024-01-14 16:30:00', 4890.00, 105, 205);
call sp_agregarCompra('2024-01-15 11:25:00', 1745.60, 106, 206);
call sp_agregarCompra('2024-01-16 13:40:00', 8210.40, 107, 207);
call sp_agregarCompra('2024-01-17 07:55:00', 3456.90, 108, 208);
call sp_agregarCompra('2024-01-18 15:10:00', 6678.25, 109, 209);
call sp_agregarCompra('2024-01-19 12:45:00', 5890.75, 110, 210);
call sp_agregarCompra('2024-01-20 17:20:00', 2934.50, 111, 211);
call sp_agregarCompra('2024-01-21 09:35:00', 4567.30, 112, 212);
call sp_agregarCompra('2024-01-22 14:50:00', 7145.80, 113, 213);
call sp_agregarCompra('2024-01-23 11:15:00', 3789.40, 114, 214);
call sp_agregarCompra('2024-01-24 16:05:00', 9456.90, 115, 215);

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
    in fechaCompra datetime,
    in totalCompra decimal(10,2),
    in codigoProveedor int,
    in codigoEmpleado int)
begin
    update Compras
    set fechaCompra = fechaCompra,
        total = totalCompra,
        codigoProveedor = codigoProveedor,
        codigoEmpleado = codigoEmpleado
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
-- CRUD TRABAJADO POR Cristopher