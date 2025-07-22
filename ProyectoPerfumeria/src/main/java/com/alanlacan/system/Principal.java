
package com.alanlacan.system;
import com.alanlacan.dominio.Cliente;
import com.alanlacan.dominio.Proveedor;
import com.alanlacan.dominio.Categoria;
import com.alanlacan.dominio.Producto;
import com.alanlacan.dominio.Empleado;
import com.alanlacan.dominio.Venta;
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
        
        do {            
            System.out.println("Menu de todos las Entidades:");
            System.out.println("1. Clientes");
            System.out.println("2. Proveedores");
            System.out.println("3. Categorias");
            System.out.println("4. Productos");
            System.out.println("5. Empleados");
            System.out.println("6. Venta");
            System.out.println("0. Salir");
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
            case 0:
                System.out.println("Has salido del menu de las Entidades");
            default:
                System.out.println("Elije una opción valida");
        }
        } while (opc !=0);
 
    }
}
