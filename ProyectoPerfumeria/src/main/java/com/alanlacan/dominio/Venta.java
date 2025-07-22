
package com.alanlacan.dominio;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Scanner;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Persistence;
import javax.persistence.Table;
import javax.persistence.TypedQuery;

@Entity
@Table (name = "Ventas")
public class Venta {
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int codigoVenta ;
    @Column
    private LocalDateTime  fecha;
    @Column
    private BigDecimal total;
    @ManyToOne
    @JoinColumn(name = "codigoCliente")
    private Cliente cliente;

    @ManyToOne
    @JoinColumn(name = "codigoEmpleado")
    private Empleado empleado;
    
    
    public Venta() {
    }

    public Venta(LocalDateTime  fecha, BigDecimal total, int codigoCliente, int codigoEmpleado) {
        this.codigoVenta = codigoVenta;
        this.fecha = fecha;
        this.total = total;
    }

    
    
    public int getCodigoVenta() {
        return codigoVenta;
    }

    public void setCodigoVenta(int codigoVenta) {
        this.codigoVenta = codigoVenta;
    }

    public LocalDateTime  getFecha() {
        return fecha;
    }

    public void setFecha(LocalDateTime  fecha) {
        this.fecha = fecha;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }

    @Override
    public String toString() {
        return "Venta{" + "codigoVenta=" + codigoVenta + ", fecha=" + fecha + ", total=" + total + ", cliente=" + cliente + ", empleado=" + empleado + '}';
    }

   
    
    
    public void menuVentas(){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("dominio");
        Scanner leer = new Scanner(System.in);
        EntityManager em = emf.createEntityManager();
        int op;
        do {
            System.out.println("Menu De Ventas");
            System.out.println("1. Agregar Ventas");
            System.out.println("2. Buscar Ventas");
            System.out.println("3. Actualizar Ventas");
            System.out.println("4. Eliminar Ventas");
            System.out.println("5. Listar Ventas");
            System.out.println("0. Salir de Venta");
            op = leer.nextInt();
            leer.nextLine();
            
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            switch (op) {
                case 1:
                    System.out.println("Ingresa los datos de la Nueva Venta " + "\n");
                    System.out.print("Fecha de la venta: ");
                    String fech= leer.nextLine();
                    LocalDateTime fecha = LocalDateTime.parse(fech, formatter);
                    System.out.print("Ingrese el nuevo total: ");
                    BigDecimal total = leer.nextBigDecimal();
                    System.out.print("Ingrese el codigo Cliente : ");
                    int codCliente = leer.nextInt();
                    System.out.println("Ingrese el codigo Empleado");
                    int codEmpleado = leer.nextInt();
                    
                    
                    Cliente cliente = em.find(Cliente.class, codCliente);
                    Empleado proveedor = em.find(Empleado.class, codEmpleado);
                    
                    Venta nuevoV = new Venta(fecha, total, codCliente, codEmpleado);
                    em.getTransaction().begin();
                    em.persist(nuevoV);
                    em.getTransaction().commit();
                    System.out.println("Venta agregado con exito!!");
                    break;
                case 2:
                    System.out.println("Ingresa el Codigo del Empleado a Buscar");
                    System.out.print("No. Entero: ");
                    int codigo = leer.nextInt();
                    Venta e = em.find(Venta.class, codigo);
                    System.out.println(e);
                    break;
                case 3:
                    System.out.println("Ingrese el codigo de Venta a Modificar");
                    System.out.print("No. Entero: ");
                    codigoVenta = leer.nextInt();
                    leer.nextLine();
                    Venta actualizarE = em.find(Venta.class, codigoVenta);
                    if (actualizarE != null) {
                        System.out.print("Fecha Nuevo: ");
                        fech = leer.nextLine();
                        LocalDateTime fechaNueva = LocalDateTime.parse(fech, formatter);
                        actualizarE.setFecha(fechaNueva);
                    
                        System.out.print("Total Nuevo: ");
                        actualizarE.setTotal(leer.nextBigDecimal());
                        
                        em.getTransaction().begin();
                        em.merge(actualizarE);
                        em.getTransaction().commit();
                        System.out.println("Venta actualizado correctamente.");
                        
                    } else {
                        System.out.println("No Existe el Venta");
                    }
                    break;
                case 4:
                    System.out.println("Ingrese el codigo de Venta a Eliminar");
                    System.out.print("No. Entero: ");
                    codigoVenta = leer.nextInt();
                    leer.nextLine();
                    Venta eliminarV = em.find(Venta.class, codigoVenta);
                    if (eliminarV != null) {
                        em.getTransaction().begin();
                        em.remove(eliminarV);
                        em.getTransaction().commit();
                        System.out.println("Venta eliminado exitosamente!!");
                    } else {
                        System.out.println("Venta no encontrado");
                    }
                    break;
                case 5:
                    System.out.println("Lista de Venta");
                    TypedQuery<Venta> query = em.createQuery("SELECT v From Venta v" , Venta.class);
                    List<Venta> venta = query.getResultList();
                    for (Venta ventas : venta) {
                        System.out.println(empleado);
                    }
                    break;
                case 0:
                    System.out.println("Saliste de Menu Venta.");
                    break;
                default:
                    System.out.println("Elige una opcion existente.");
            }
        } while (op != 0);

}
}
