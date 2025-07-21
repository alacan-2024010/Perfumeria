package com.alanlacan.dominio;

import java.util.List;
import java.util.Scanner;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Persistence;
import javax.persistence.Table;
import javax.persistence.TypedQuery;

@Entity
@Table (name= "Proveedores")
public class Proveedor {
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int codigoProveedor;
    @Column
    private String nombreProveedor;
    @Column
    private String direccionProveedor;
    @Column
    private String telefonoProveedor;
    @Column
    private String correoProveedor;

    public Proveedor() {
    
    }
    
    public Proveedor(String nombreProveedor, String direccionProveedor, String telefonoProveedor, String correoProveedor) {
        this.nombreProveedor = nombreProveedor;
        this.direccionProveedor = direccionProveedor;
        this.telefonoProveedor = telefonoProveedor;
        this.correoProveedor = correoProveedor;
    }

    public int getCodigoProveedor() {
        return codigoProveedor;
    }

    public void setCodigoProveedor(int codigoProveedor) {
        this.codigoProveedor = codigoProveedor;
    }

    public String getNombreProveedor() {
        return nombreProveedor;
    }

    public void setNombreProveedor(String nombreProveedor) {
        this.nombreProveedor = nombreProveedor;
    }

    public String getDireccionProveedor() {
        return direccionProveedor;
    }

    public void setDireccionProveedor(String direccionProveedor) {
        this.direccionProveedor = direccionProveedor;
    }

    public String getTelefonoProveedor() {
        return telefonoProveedor;
    }

    public void setTelefonoProveedor(String telefonoProveedor) {
        this.telefonoProveedor = telefonoProveedor;
    }

    public String getCorreoProveedor() {
        return correoProveedor;
    }

    public void setCorreoProveedor(String correoProveedor) {
        this.correoProveedor = correoProveedor;
    }

    @Override
    public String toString() {
        return "Proveedor{" + "codigoProveedor=" + codigoProveedor 
                + ", nombreProveedor=" + nombreProveedor + ", direccionProveedor=" 
                + direccionProveedor + ", telefonoProveedor=" + telefonoProveedor 
                + ", correoProveedor=" + correoProveedor + '}';
    }
    
    
    public void menuProveedor(){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("dominio");
        Scanner leer = new Scanner(System.in);
        EntityManager em = emf.createEntityManager();
        int op;
        
        do {
            System.out.println("Menu Proveedor");
            System.out.println("1. Agregar Proveedor");
            System.out.println("2. Buscar Proveedor");
            System.out.println("3. Actualizar Proveedor");
            System.out.println("4. Eliminar Proveedor");
            System.out.println("5. Listar Proveedores");
            System.out.println("0. Salir del menu");
            
            op = leer.nextInt();
            leer.nextLine();
            
            switch (op) {
                case 1:
                    System.out.println("Ingrese los datos del nuevo Proveedor");
                    System.out.println("Nombre del proveedor:");
                    String nombreProv = leer.nextLine();
                    System.out.println("Direccion del proveedor");
                    String direccionProv = leer.nextLine();
                    System.out.println("Telefono del proveedor");
                    String telefonoProv = leer.nextLine();
                    System.out.println("Correo del proveedor");
                    String correoProv = leer.nextLine();
                    
                    Proveedor nuevoProv = new Proveedor(nombreProv, direccionProv, telefonoProv, correoProv);
                    em.getTransaction().begin();
                    em.persist(nuevoProv);
                    em.getTransaction().commit();
                    System.out.println("Proveedor agregado correctamente!");
                    break;
                case 2:
                    System.out.println("Ingrese el codigo del Proveedor que desea buscar:");
                    int codigoProv = leer.nextInt();
                    Proveedor prov = em.find(Proveedor.class, codigoProv);
                    
                    System.out.println(prov);
                    break;
                case 3:
                    System.out.println("Ingrese el código del Proveedor a actualizar:");
                    int codigoProveedor = leer.nextInt();
                    leer.nextLine();

                    Proveedor proveedorActualizar = em.find(Proveedor.class, codigoProveedor);

                    if (proveedorActualizar != null) {
                        System.out.println("Nuevo nombre del proveedor:");
                        proveedorActualizar.setNombreProveedor(leer.nextLine());

                        System.out.println("Nueva dirección del proveedor:");
                        proveedorActualizar.setDireccionProveedor(leer.nextLine());

                        System.out.println("Nuevo teléfono del proveedor:");
                        proveedorActualizar.setTelefonoProveedor(leer.nextLine());

                        System.out.println("Nuevo correo del proveedor:");
                        proveedorActualizar.setCorreoProveedor(leer.nextLine());

                        em.getTransaction().begin();
                        em.merge(proveedorActualizar);
                        em.getTransaction().commit();

                        System.out.println("Proveedor actualizado correctamente.");
                    } else {
                        System.out.println("Proveedor no encontrado.");
                    }
                    break;
                case 4:
                    System.out.println("Ingrese  el codigo del proveedor que desea eliminar:");
                    codigoProveedor = leer.nextInt();
                    Proveedor eliminarProv = em.find(Proveedor.class, codigoProveedor);
                    
                    if (eliminarProv != null) {
                        em.getTransaction().begin();
                        em.remove(eliminarProv);
                        em.getTransaction().commit();
                        System.out.println("Proveedor eliminado exitosamente!");
                    }else{
                        System.out.println("Proveedor no encontrado");
                    }
                    break;
                case 5:
                    System.out.println("Lista de todos los proveedores:");
                    TypedQuery<Proveedor> query = em.createQuery("SELECT prov FROM Proveedor prov", Proveedor.class);
                    List<Proveedor> proveedores = query.getResultList();
                    
                    for (Proveedor proveedor : proveedores) {
                        System.out.println(proveedor);
                    }
                    break;
                case 0:
                    System.out.println("Has salido del menu de proveedores!");
                    break;
                default:
                    System.out.println("Por favor, selecciona una opcion valida.");
            }
            
        } while (op != 0);
        
        
    }
    
    
}
