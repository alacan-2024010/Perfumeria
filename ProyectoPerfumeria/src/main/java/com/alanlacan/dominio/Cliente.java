
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
@Table (name = "Clientes")
public class Cliente {
    @Id
    @Column 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int codigoCliente;
    @Column
    private String nombreCliente;
    @Column
    private String apellidoCliente;
    @Column
    private String emailCliente;
    @Column
    private String contrasenia;

    public Cliente() {
    }

    public Cliente( String nombreCliente, String apellidoCliente, String emailCliente, String contrasenia) {
        this.nombreCliente = nombreCliente;
        this.apellidoCliente = apellidoCliente;
        this.emailCliente = emailCliente;
        this.contrasenia = contrasenia;
    }

    public int getCodigoCliente() {
        return codigoCliente;
    }

    public void setCodigoCliente(int codigoCliente) {
        this.codigoCliente = codigoCliente;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getApellidoCliente() {
        return apellidoCliente;
    }

    public void setApellidoCliente(String apellidoCliente) {
        this.apellidoCliente = apellidoCliente;
    }

    public String getEmailCliente() {
        return emailCliente;
    }

    public void setEmailCliente(String emailCliente) {
        this.emailCliente = emailCliente;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    @Override
    public String toString() {
        return "Cliente{" + "codigoCliente=" + codigoCliente + ", nombreCliente=" + nombreCliente + ", apellidoCliente=" + apellidoCliente + ", emailCliente=" + emailCliente + ", contrasenia=" + contrasenia + '}';
    }
    
    
    public void menuCliente(){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("dominio");
        Scanner leer = new Scanner(System.in);
        EntityManager em = emf.createEntityManager();
        int op;
        do {            
            System.out.println("Meu Clientes");
            System.out.println("1. Crear Cliente");
            System.out.println("2. Buscar Cliente");
            System.out.println("3. Actualizar Cliente");
            System.out.println("4. Eliminar Cliente");
            System.out.println("5. Listar Clientes");
            System.out.println("0. Salir");
            op = leer.nextInt();
            leer.nextLine();
            switch (op) {
                case 1:
                    System.out.println("Ingrese los datos del nuevo Cliente:");
                    System.out.println("Nombre del Cliente:");
                    String nombre = leer.nextLine();
                    System.out.println("Apellido del Cliente:");
                    String apellido = leer.nextLine();
                    System.out.println("Email del Cliente:");
                    String email = leer.nextLine();
                    System.out.println("Contraseña del Cliente:");
                    String contra = leer.nextLine();
                    
                    Cliente nuevoC = new Cliente(nombre, apellido, email, contra);
                    em.getTransaction().begin();
                    em.persist(nuevoC);
                    em.getTransaction().commit();
                    System.out.println("Cliente agregado exitosamente");
                    break;
                case 2:
                    System.out.println("Ingrese el codigo del Cliente a buscar:");
                    int codigo = leer.nextInt();
                    Cliente c = em.find(Cliente.class, codigo);
                    //Mandar a imprimir persona
                    System.out.println(c);
                    break;
                case 3:
                    System.out.println("Ingrese el codigo del Cliente a actualizar:");
                    codigoCliente = leer.nextInt();
                    leer.nextLine();
                    Cliente actualizarC = em.find(Cliente.class, codigoCliente);
                    if (actualizarC != null) {
                        System.out.println("Nuevo nombre:");
                        actualizarC.setNombreCliente(leer.nextLine());

                        System.out.println("Nuevo apellido:");
                        actualizarC.setApellidoCliente(leer.nextLine());

                        System.out.println("Nuevo email:");
                        actualizarC.setEmailCliente(leer.nextLine());

                        System.out.println("Nueva contraseña:");
                        actualizarC.setContrasenia(leer.nextLine());

                        em.getTransaction().begin();
                        em.merge(actualizarC);
                        em.getTransaction().commit();
                        System.out.println("Cliente actualizado");
                    } else {
                        System.out.println("Cliente no encontrado");
                    }
                    break;
                case 4:
                    System.out.println("Ingrese el codigo del Cliente a eliminar:");
                    codigoCliente = leer.nextInt();
                    leer.nextLine();
                    Cliente eliminarC = em.find(Cliente.class, codigoCliente);
                    if (eliminarC != null) {
                        em.getTransaction().begin();
                        em.remove(eliminarC);
                        em.getTransaction().commit();
                        System.out.println("Cliente eliminado");
                    } else {
                        System.out.println("Cliente no encontrado");
                    }
                    break;
                case 5:
                    System.out.println("Lista de todos los Clientes:");
                    TypedQuery<Cliente> query = em.createQuery("SELECT c FROM Cliente c", Cliente.class);
                    List<Cliente> clientes = query.getResultList();
                    for(Cliente cliente : clientes){
                        System.out.println(cliente);
                    }
                    break;
                case 0:
                    System.out.println("Has salido del menu de Cliente");
                    break;
                default:
                    System.out.println("Seleccione una opcion valida");
            }
        } while (op != 0);
    } 
}
