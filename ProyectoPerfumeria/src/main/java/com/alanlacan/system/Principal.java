
package com.alanlacan.system;
import com.alanlacan.dominio.Cliente;
import com.alanlacan.dominio.Proveedor;
import com.alanlacan.dominio.Categoria;
import java.util.Scanner;


public class Principal {
    
    public static void main(String[] args) {
        Scanner leer = new Scanner(System.in);
        int opc;
        Cliente c = new Cliente();
        Proveedor prov = new Proveedor();
        Categoria cate = new Categoria();
        
        do {            
            System.out.println("Menu de todos las Entidades:");
            System.out.println("1. Clientes");
            System.out.println("2. Proveedores");
            System.out.println("3. Categorias");
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
            case 0:
                System.out.println("Has salido del menu de las Entidades");
            default:
                System.out.println("Elije una opción valida");
        }
        } while (opc !=0);
 
    }
}
