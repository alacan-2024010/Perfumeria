package com.alanlacan.dominio;

import java.util.HashSet;
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
@Table (name = "Empleados")
public class Empleado {
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int codigoEmpleado;
    @Column
    private String nombreEmpleado;
    @Column
    private String apellidoEmpleado;
    @Column
    private String direccionEmpleado;
    @Column        
    private String telefonoEmpleado;
    @Column
    private String emailEmpleado;
    @Column
    private String puestoEmpleado;

    public Empleado() {
    }

    public Empleado(String nombreEmpleado, String apellidoEmpleado, String direccionEmpleado, String telefonoEmpleado, String emailEmpleado, String puestoEmpleado) {
        this.nombreEmpleado = nombreEmpleado;
        this.apellidoEmpleado = apellidoEmpleado;
        this.direccionEmpleado = direccionEmpleado;
        this.telefonoEmpleado = telefonoEmpleado;
        this.emailEmpleado = emailEmpleado;
        this.puestoEmpleado = puestoEmpleado;
    }

    public int getCodigoEmpleado() {
        return codigoEmpleado;
    }

    public void setCodigoEmpleado(int codigoEmpleado) {
        this.codigoEmpleado = codigoEmpleado;
    }

    public String getNombreEmpleado() {
        return nombreEmpleado;
    }

    public void setNombreEmpleado(String nombreEmpleado) {
        this.nombreEmpleado = nombreEmpleado;
    }

    public String getApellidoEmpleado() {
        return apellidoEmpleado;
    }

    public void setApellidoEmpleado(String apellidoEmpleado) {
        this.apellidoEmpleado = apellidoEmpleado;
    }

    public String getDireccionEmpleado() {
        return direccionEmpleado;
    }

    public void setDireccionEmpleado(String direccionEmpleado) {
        this.direccionEmpleado = direccionEmpleado;
    }

    public String getTelefonoEmpleado() {
        return telefonoEmpleado;
    }

    public void setTelefonoEmpleado(String telefonoEmpleado) {
        this.telefonoEmpleado = telefonoEmpleado;
    }

    public String getEmailEmpleado() {
        return emailEmpleado;
    }

    public void setEmailEmpleado(String emailEmpleado) {
        this.emailEmpleado = emailEmpleado;
    }

    public String getPuestoEmpleado() {
        return puestoEmpleado;
    }

    public void setPuestoEmpleado(String puestoEmpleado) {
        this.puestoEmpleado = puestoEmpleado;
    }

    @Override
    public String toString() {
        return "Empleado{" + "codigoEmpleado=" + codigoEmpleado + ", nombreEmpleado=" + nombreEmpleado + ", apellidoEmpleado=" + apellidoEmpleado + ", direccionEmpleado=" + direccionEmpleado + ", telefonoEmpleado=" + telefonoEmpleado + ", emailEmpleado=" + emailEmpleado + ", puestoEmpleado=" + puestoEmpleado + '}';
    }
    
    public void menuEmpleado(){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("dominio");
        Scanner leer = new Scanner(System.in);
        EntityManager em = emf.createEntityManager();
        int op;
        do {
            System.out.println("Menu De Empleados");
            System.out.println("1. Agregar Empleado");
            System.out.println("2. Buscar Empleado");
            System.out.println("3. Actualizar Empleado");
            System.out.println("4. Eliminar Empleado");
            System.out.println("5. Listar Empleado");
            System.out.println("0. Salir");
            op = leer.nextInt();
            leer.nextLine();
            
            switch (op) {
                case 1:
                    System.out.println("Ingresa los datos del Empleado Nuevo" + "\n");
                    System.out.print("Nombre del Empleado: ");
                    String nombre = leer.nextLine();
                    System.out.print("Apellido del Empleado: ");
                    String apellido = leer.nextLine();
                    System.out.print("Direccion del Empleado: ");
                    String direccion = leer.nextLine();
                    System.out.println("Telefono del Empleado");
                    System.out.println("8 Numeros enteros sin simbolos");
                    System.out.print("Ingresar: ");
                    String telefono = leer.nextLine();
                    System.out.print("Correo del Empleado: ");
                    String email = leer.nextLine();
                    System.out.print("Puesto del Empleado: ");
                    String puesto = leer.nextLine();
                    
                    Empleado nuevoE = new Empleado(nombre, apellido, direccion, telefono, email, puesto);
                    em.getTransaction().begin();
                    em.persist(nuevoE);
                    em.getTransaction().commit();
                    System.out.println("Empleado agregado con exito!!");
                    break;
                case 2:
                    System.out.println("Ingresa el Codigo del Empleado a Buscar");
                    System.out.print("No. Entero: ");
                    int codigo = leer.nextInt();
                    Empleado e = em.find(Empleado.class, codigo);
                    System.out.println(e);
                    break;
                case 3:
                    System.out.println("Ingrese el codigo del Empleado a Modificar");
                    System.out.print("No. Entero: ");
                    codigoEmpleado = leer.nextInt();
                    leer.nextLine();
                    Empleado actualizarE = em.find(Empleado.class, codigoEmpleado);
                    if (actualizarE != null) {
                        System.out.print("Nombre Nuevo: ");
                        actualizarE.setNombreEmpleado(leer.nextLine());
                        
                        System.out.print("Apellido Nuevo: ");
                        actualizarE.setApellidoEmpleado(leer.nextLine());
                        
                        System.out.print("Nueva Direccion: ");
                        actualizarE.setDireccionEmpleado(leer.nextLine());
                        
                        System.out.println("Nuevo numero de Telefono: ");
                        System.out.println("8 Numeros enteros sin simbolos");
                        System.out.print("Ingresar: ");
                        actualizarE.setTelefonoEmpleado(leer.nextLine());
                        
                        System.out.print("Nuevo Correo Electronico: ");
                        actualizarE.setEmailEmpleado(leer.nextLine());
                        
                        System.out.print("Puesto Nuevo: ");
                        actualizarE.setPuestoEmpleado(leer.nextLine()); 
                    } else {
                        System.out.println("No Existe el Empleado");
                    }
                    break;
                case 4:
                    System.out.println("Ingrese el codigo del Empleado a Eliminar");
                    System.out.print("No. Entero: ");
                    codigoEmpleado = leer.nextInt();
                    leer.nextLine();
                    Empleado eliminarE = em.find(Empleado.class, codigoEmpleado);
                    if (eliminarE != null) {
                        em.getTransaction().begin();
                        em.remove(eliminarE);
                        em.getTransaction().commit();
                        System.out.println("Empleado eliminado exitosamente!!");
                    } else {
                        System.out.println("Empleado no encontrado");
                    }
                    break;
                case 5:
                    System.out.println("Lista de Empleados");
                    TypedQuery<Empleado> query = em.createQuery("SELECT e From Empleado e" , Empleado.class);
                    List<Empleado> empleados = query.getResultList();
                    for (Empleado empleado : empleados) {
                        System.out.println(empleado);
                    }
                    break;
                case 0:
                    System.out.println("Saliste de Menu Empleado.");
                    break;
                default:
                    System.out.println("Elige una opcion existente.");
            }
        } while (op != 0);
    }
}
