package com.alanlacan.system;

import com.alanlacan.dominio.DetalleVenta;
import com.alanlacan.dominio.Cliente;
import com.alanlacan.dominio.Proveedor;
import com.alanlacan.dominio.Categoria;
import com.alanlacan.dominio.Producto;
import com.alanlacan.dominio.Empleado;
import com.alanlacan.dominio.Venta;
import com.alanlacan.dominio.Factura;
import com.alanlacan.dominio.Compra;
import com.alanlacan.dominio.DetalleCompra;
import java.util.Scanner;

public class Principal {
    
    public static void main(String[] args) {
        Scanner leer = new Scanner(System.in);
        int opc;
        Cliente c = new Cliente();
        Proveedor prov = new Proveedor();
        Categoria cate = new Categoria();
        Producto prod = new Producto();
        Empleado e = new Empleado();
        Venta v = new Venta();
        DetalleVenta dv = new DetalleVenta();
        Factura f = new Factura();
        Compra comp = new Compra();
        DetalleCompra dc = new DetalleCompra();
        
        do {            
            System.out.println("\n=== MENÚ PRINCIPAL - SISTEMA DE GESTIÓN ===");
            System.out.println("1. Clientes");
            System.out.println("2. Proveedores");
            System.out.println("3. Categorías");
            System.out.println("4. Productos");
            System.out.println("5. Empleados");
            System.out.println("6. Ventas");
            System.out.println("7. Detalle de Ventas");
            System.out.println("8. Facturas");
            System.out.println("9. Compras");
            System.out.println("10. Detalle de Compras");
            System.out.println("0. Salir");
            System.out.print("Seleccione una opción: ");
            opc = leer.nextInt();
            
            switch (opc) {
                case 1:
                    c.menuCliente();
                    break;
                case 2:
                    prov.menuProveedor();
                    break;
                case 3:
                    cate.menuCategoria();
                    break;
                case 4:
                    prod.menuProducto();
                    break;
                case 5:
                    e.menuEmpleado();
                    break;
                case 6:
                    v.menuVentas();
                    break;
                case 7:
                    dv.menuDetalleVenta();
                    break;
                case 8:
                    f.menuFactura();
                    break;
                case 9:
                    comp.menuCompra();
                    break;
                case 10:
                    dc.menuDetalleCompra();
                    break;
                case 0:
                    System.out.println("¡Gracias por usar el Sistema de Gestión!");
                    System.out.println(" Cerrando aplicación...");
                    break;
                default:
                    System.out.println("️ Opción inválida. Por favor elija una opción válida (0-10).");
            }
        } while (opc != 0);
        
        leer.close();
    }
}