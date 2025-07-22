package com.alanlacan.dominio;
 
import java.math.BigDecimal;
import java.util.List;
import java.util.Scanner;
import javax.persistence.*;
 
@Entity
@Table(name = "DetalleVentas")
public class DetalleVenta {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int codigoDetalleVenta;

    @Column
    private int cantidad;

    @Column
    private BigDecimal precioUnitario;

    @ManyToOne
    @JoinColumn(name = "codigoVenta")
    private Venta venta;

    @ManyToOne
    @JoinColumn(name = "codigoProducto")
    private Producto producto;

    public DetalleVenta() {
    }

    public DetalleVenta(int cantidad, BigDecimal precioUnitario, Venta venta, Producto producto) {
        this.cantidad = cantidad;
        this.precioUnitario = precioUnitario;
        this.venta = venta;
        this.producto = producto;
    }

    public int getCodigoDetalleVenta() {
        return codigoDetalleVenta;
    }

    public void setCodigoDetalleVenta(int codigoDetalleVenta) {
        this.codigoDetalleVenta = codigoDetalleVenta;
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

    public Venta getVenta() {
        return venta;
    }

    public void setVenta(Venta venta) {
        this.venta = venta;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    @Override
    public String toString() {
        return "DetalleVenta{" + "codigoDetalleVenta=" + codigoDetalleVenta + ", cantidad=" + cantidad + ", precioUnitario=" + precioUnitario + ", venta=" + venta + ", producto=" + producto + '}';
    }

    public void menuDetalleVenta() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("dominio");
        Scanner leer = new Scanner(System.in);
        EntityManager em = emf.createEntityManager();
        int op;

        do {
            System.out.println("--- BIENVENIDO AL MENÚ DE DETALLE DE VENTA ---");
            System.out.println("1. Agregar Detalle Venta");
            System.out.println("2. Buscar Detalle Venta");
            System.out.println("3. Actualizar Detalle Venta");
            System.out.println("4. Eliminar Detalle Venta");
            System.out.println("5. Listar Detalles de Venta");
            System.out.println("0. Salir del menú");
            op = leer.nextInt();
            leer.nextLine();

            switch (op) {
                case 1:
                    System.out.println("Ingrese la cantidad:");
                    int cantidad = leer.nextInt();
                    System.out.println("Ingrese el precio unitario:");
                    BigDecimal precioUnitario = leer.nextBigDecimal();
                    System.out.println("Ingrese el código de la venta:");
                    int codigoVenta = leer.nextInt();
                    System.out.println("Ingrese el código del producto:");
                    int codigoProducto = leer.nextInt();

                    Venta venta = em.find(Venta.class, codigoVenta);
                    Producto producto = em.find(Producto.class, codigoProducto);

                    DetalleVenta nuevoDetalleVenta = new DetalleVenta(cantidad, precioUnitario, venta, producto);

                    em.getTransaction().begin();
                    em.persist(nuevoDetalleVenta);
                    em.getTransaction().commit();

                    System.out.println("Detalle Venta agregado correctamente.");
                    break;

                case 2:
                    System.out.println("Ingrese el código del detalle de venta a buscar:");
                    int codigoDV = leer.nextInt();
                    DetalleVenta detalleVenta = em.find(DetalleVenta.class, codigoDV);
                    if (detalleVenta != null) {
                        System.out.println(detalleVenta);
                    } else {
                        System.out.println("Detalle de venta no encontrado.");
                    }
                    break;

                case 3:
                    System.out.println("Ingrese el código del detalle de venta a actualizar:");
                    int codigoDVActualizar = leer.nextInt();
                    leer.nextLine();
                    DetalleVenta actualizarDV = em.find(DetalleVenta.class, codigoDVActualizar);
                    if (actualizarDV != null) {
                        System.out.println("Ingrese la nueva cantidad:");
                        actualizarDV.setCantidad(leer.nextInt());
                        System.out.println("Ingrese el nuevo precio unitario:");
                        actualizarDV.setPrecioUnitario(leer.nextBigDecimal());
                        System.out.println("Ingrese el nuevo código de la venta:");
                        actualizarDV.setVenta(em.find(Venta.class, leer.nextInt()));
                        System.out.println("Ingrese el nuevo código del producto:");
                        actualizarDV.setProducto(em.find(Producto.class, leer.nextInt()));

                        em.getTransaction().begin();
                        em.merge(actualizarDV);
                        em.getTransaction().commit();
                        System.out.println("Detalle de venta actualizado correctamente.");
                    } else {
                        System.out.println("Detalle de venta no encontrado.");
                    }
                    break;

                case 4:
                    System.out.println("Ingrese el código del detalle de venta a eliminar:");
                    int codigoDVEliminar = leer.nextInt();
                    DetalleVenta eliminarDV = em.find(DetalleVenta.class, codigoDVEliminar);
                    if (eliminarDV != null) {
                        em.getTransaction().begin();
                        em.remove(eliminarDV);
                        em.getTransaction().commit();
                        System.out.println("Detalle de venta eliminado correctamente.");
                    } else {
                        System.out.println("Detalle de venta no encontrado.");
                    }
                    break;

                case 5:
                    System.out.println("Estos son todos los detalles de ventas.");
                    TypedQuery<DetalleVenta> query = em.createQuery("SELECT d FROM DetalleVenta d", DetalleVenta.class);
                    List<DetalleVenta> detallesVenta = query.getResultList();
                    for (DetalleVenta detalle : detallesVenta) {
                        System.out.println(detalle);
                    }
                    break;

                case 0:
                    System.out.println("Has salido del menú de Detalle de Venta.");
                    break;

                default:
                    System.out.println("ERROR: Has marcado una opción NO válida.");
            }

        } while (op != 0);
    }
}

