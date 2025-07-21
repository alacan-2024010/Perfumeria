
package com.alanlacan.system;
import com.alanlacan.dominio.Cliente;
import java.util.Scanner;


public class Principal {
    
    public static void main(String[] args) {
        Scanner leer = new Scanner(System.in);
        int opc;
        Cliente c = new Cliente();
        do {            
            System.out.println("Menu de todos las Entidades:");
            System.out.println("1. Clientes");
            System.out.println("0. Salir");
            opc = leer.nextInt();
            
            switch (opc) {
            case 1:
                c.menuCliente();
                break;
            case 0:
                System.out.println("Has salido del menu de las Entidades");
            default:
                System.out.println("Elije una opción valida");
        }
        } while (opc !=0);
 
    }
}
