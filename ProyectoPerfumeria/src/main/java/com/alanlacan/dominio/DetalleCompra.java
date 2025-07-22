package com.alanlacan.dominio;
 
import java.math.BigDecimal;
import javax.persistence.*;
import java.util.List;
import java.util.Scanner;
 
@Entity
@Table(name = "DetalleCompras")
public class DetalleCompra {
 
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int codigoDetalleCompra;
 
    @Column
    private int cantidad;
 
    @Column
    private BigDecimal precioUnitario;
 
    @ManyToOne
    @JoinColumn(name = "codigoCompra")
    private Compra  codigoCompra;
 
    @ManyToOne
    @JoinColumn(name = "codigoProducto")
    private Producto codigoProducto;
 
    public DetalleCompra() {
    }
 
    public DetalleCompra(int cantidad, BigDecimal precioUnitario, Compra codigoCompra, Producto codigoProducto) {
        this.cantidad = cantidad;
        this.precioUnitario = precioUnitario;
        this.codigoCompra = codigoCompra;
        this.codigoProducto = codigoProducto;
    }
 
    public int getCodigoDetalleCompra() {
        return codigoDetalleCompra;
    }
 
    public void setCodigoDetalleCompra(int codigoDetalleCompra) {
        this.codigoDetalleCompra = codigoDetalleCompra;
    }
 
    public int getCantidad() {
        return cantidad;
    }
 
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
 
    public BigDecimal getPrecioUnitario() {
        return precioUnitario;
    }
 
    public void setPrecioUnitario(BigDecimal precioUnitario) {
        this.precioUnitario = precioUnitario;
    }
 
    public Compra  getCodigoCompra() {
        return codigoCompra;
    }
 
    public void setCodigoCompra(Compra codigoCompra) {
        this.codigoCompra = codigoCompra;
    }
 
    public Producto getCodigoProducto() {
        return codigoProducto;
    }
 
    public void setCodigoProducto(Producto codigoProducto) {
        this.codigoProducto = codigoProducto;
    }
 
    @Override
    public String toString() {
        return "DetalleCompra{" +
                "codigoDetalleCompra=" + codigoDetalleCompra +
                ", cantidad=" + cantidad +
                ", precioUnitario=" + precioUnitario +
                ", codigoCompra=" + codigoCompra +
                ", codigoProducto=" + codigoProducto +
                '}';
    }
 
    public void menuDetalleCompra() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("dominio");
        EntityManager em = emf.createEntityManager();
        Scanner leer = new Scanner(System.in);
        int op;
 
        do {
            System.out.println("\n--- MENÚ DETALLE DE COMPRAS ---");
            System.out.println("1. Agregar Detalle de Compra");
            System.out.println("2. Buscar Detalle de Compra");
            System.out.println("3. Actualizar Detalle de Compra");
            System.out.println("4. Eliminar Detalle de Compra");
            System.out.println("5. Listar Detalles de Compra");
            System.out.println("0. Salir");
            System.out.print("Seleccione una opción: ");
            op = leer.nextInt();
            leer.nextLine();
 
            switch (op) {
                case 1:
                    System.out.print("Cantidad: ");
                    int cantidad = leer.nextInt();
                    System.out.print("Precio Unitario: ");
                    BigDecimal precio = leer.nextBigDecimal();
                    System.out.print("Código de Compra: ");
                    int codCompra = leer.nextInt();
                    Compra compra = em.find(Compra.class, codCompra);
                    System.out.print("Código de Producto: ");
                    int codProducto = leer.nextInt();
                    Producto producto = em.find(Producto.class, codProducto);
 
                    DetalleCompra nuevo = new DetalleCompra(cantidad, precio, compra, producto);
                    em.getTransaction().begin();
                    em.persist(nuevo);
                    em.getTransaction().commit();
                    System.out.println(" Detalle de compra agregado con éxito.");
                    break;
 
                case 2:
                    System.out.print("Código del detalle a buscar: ");
                    int codBuscar = leer.nextInt();
                    DetalleCompra encontrado = em.find(DetalleCompra.class, codBuscar);
                    if (encontrado != null) {
                        System.out.println(encontrado);
                    } else {
                        System.out.println(" Detalle no encontrado.");
                    }
                    break;
 
                case 3:
                    System.out.print("Código del detalle a modificar: ");
                    int codActualizar = leer.nextInt();
                    leer.nextLine();
                    DetalleCompra actual = em.find(DetalleCompra.class, codActualizar);
                    if (actual != null) {
                        System.out.print("Nueva Cantidad: ");
                        actual.setCantidad(leer.nextInt());
                        System.out.print("Nuevo Precio Unitario: ");
                        actual.setPrecioUnitario(leer.nextBigDecimal());
                        System.out.print("Nuevo Código de Compra: ");
                        Compra actCompra = em.find(Compra.class, leer.nextInt());
                        actual.setCodigoCompra(actCompra);
                        System.out.print("Nuevo Código de Producto: ");
                        Producto actProducto = em.find(Producto.class, leer.nextInt());
                        actual.setCodigoProducto(actProducto);
 
                        em.getTransaction().begin();
                        em.merge(actual);
                        em.getTransaction().commit();
                        System.out.println(" Detalle actualizado correctamente.");
                    } else {
                        System.out.println(" Detalle no encontrado.");
                    }
                    break;
 
                case 4:
                    System.out.print("Código del detalle a eliminar: ");
                    int codEliminar = leer.nextInt();
                    DetalleCompra eliminar = em.find(DetalleCompra.class, codEliminar);
                    if (eliminar != null) {
                        em.getTransaction().begin();
                        em.remove(eliminar);
                        em.getTransaction().commit();
                        System.out.println(" Detalle eliminado con éxito.");
                    } else {
                        System.out.println(" Detalle no encontrado.");
                    }
                    break;
 
                case 5:
                    System.out.println("\n--- Lista de Detalles de Compra ---");
                    List<DetalleCompra> lista = em.createQuery("SELECT d FROM DetalleCompra d", DetalleCompra.class).getResultList();
                    for (DetalleCompra d : lista) {
                        System.out.println(d);
                    }
                    break;
 
                case 0:
                    System.out.println(" Saliendo del menú de Detalle de Compra.");
                    break;
 
                default:
                    System.out.println("️ Opción inválida. Intente de nuevo.");
            }
        } while (op != 0);
 
        em.close();
        emf.close();
    }
}
 