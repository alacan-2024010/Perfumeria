package com.alanlacan.dominio;

import java.util.List;
import java.util.Scanner;
import javax.persistence.*;

@Entity
@Table(name = "Productos")
public class Producto {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int codigoProducto;
    @Column
    private String nombreProducto;
    @Column
    private String descripcionProducto;
    @Column
    private double precioProducto;
    @Column
    private int stock;
    
    @OneToMany
    @Column
    private int codigoCategoria;
    @OneToMany
    @Column
    private int codigoProveedor;

    public Producto() {
    }

    public Producto(String nombreProducto, String descripcionProducto, double precioProducto, int stock, int codigoCategoria, int codigoProveedor) {
        this.nombreProducto = nombreProducto;
        this.descripcionProducto = descripcionProducto;
        this.precioProducto = precioProducto;
        this.stock = stock;
        this.codigoCategoria = codigoCategoria;
        this.codigoProveedor = codigoProveedor;
    }

    public int getCodigoProducto() {
        return codigoProducto;
    }

    public void setCodigoProducto(int codigoProducto) {
        this.codigoProducto = codigoProducto;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getDescripcionProducto() {
        return descripcionProducto;
    }

    public void setDescripcionProducto(String descripcionProducto) {
        this.descripcionProducto = descripcionProducto;
    }

    public double getPrecioProducto() {
        return precioProducto;
    }

    public void setPrecioProducto(double precioProducto) {
        this.precioProducto = precioProducto;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getCodigoCategoria() {
        return codigoCategoria;
    }

    public void setCodigoCategoria(int codigoCategoria) {
        this.codigoCategoria = codigoCategoria;
    }

    public int getCodigoProveedor() {
        return codigoProveedor;
    }

    public void setCodigoProveedor(int codigoProveedor) {
        this.codigoProveedor = codigoProveedor;
    }

    @Override
    public String toString() {
        return "Producto{"
                + "codigoProducto=" + codigoProducto
                + ", nombreProducto=" + nombreProducto
                + ", descripcionProducto=" + descripcionProducto
                + ", precioProducto=" + precioProducto
                + ", stock=" + stock
                + ", codigoCategoria=" + codigoCategoria
                + ", codigoProveedor=" + codigoProveedor + '}';
    }

    public void menuProducto() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("dominio");
        Scanner leer = new Scanner(System.in);
        EntityManager em = emf.createEntityManager();
        int op;

        do {
            System.out.println("--- BIENVENIDO AL MENÚ DE PRODUCTOS ---");
            System.out.println("1. Agregar Producto");
            System.out.println("2. Buscar Producto");
            System.out.println("3. Actualizar Producto");
            System.out.println("4. Eliminar Producto");
            System.out.println("5. Listar Productos");
            System.out.println("0. Salir del menu");
            op = leer.nextInt();
            leer.nextLine();

            switch (op) {
                case 1:
                    System.out.println("Ingrese el nombre del producto:");
                    String nombreProd = leer.nextLine();
                    System.out.println("Ingrese la descripción:");
                    String descripcionProd = leer.nextLine();
                    System.out.println("Ingrese el precio:");
                    double precioProd = leer.nextDouble();
                    System.out.println("Ingrese el stock:");
                    int stock = leer.nextInt();
                    System.out.println("Ingrese el código de la categoría:");
                    int codCategoria = leer.nextInt();
                    System.out.println("Ingrese el código del proveedor:");
                    int codProveedor = leer.nextInt();

                    Producto nuevo = new Producto(nombreProd, descripcionProd, precioProd, stock, codCategoria, codProveedor);
                    em.getTransaction().begin();
                    em.persist(nuevo);
                    em.getTransaction().commit();
                    System.out.println("Producto agregado correctamente.");
                    break;
                case 2:
                    System.out.println("Ingrese el código del producto a buscar:");
                    int codigoProd = leer.nextInt();
                    Producto prod = em.find(Producto.class, codigoProd);
                    if (prod != null) {
                        System.out.println(prod);
                    } else {
                        System.out.println("Producto no encontrado.");
                    }
                    break;
                case 3:
                    System.out.println("Ingrese el código del producto a actualizar:");
                    codigoProd = leer.nextInt();
                    leer.nextLine();
                    Producto modificarProd = em.find(Producto.class, codigoProd);
                    if (modificarProd != null) {
                        System.out.println("Ingrese nuevo nombre:");
                        modificarProd.setNombreProducto(leer.nextLine());
                        System.out.println("Ingrese nueva descripción:");
                        modificarProd.setDescripcionProducto(leer.nextLine());
                        System.out.println("Ingrese nuevo precio:");
                        modificarProd.setPrecioProducto(leer.nextDouble());
                        System.out.println("Ingrese nuevo stock:");
                        modificarProd.setStock(leer.nextInt());
                        System.out.println("Ingrese nuevo código de categoría:");
                        modificarProd.setCodigoCategoria(leer.nextInt());
                        System.out.println("Ingrese nuevo código de proveedor:");
                        modificarProd.setCodigoProveedor(leer.nextInt());

                        em.getTransaction().begin();
                        em.merge(modificarProd);
                        em.getTransaction().commit();
                        System.out.println("Producto actualizado correctamente.");
                    } else {
                        System.out.println("Producto no encontrado.");
                    }
                    break;
                case 4:
                    System.out.println("Ingrese el código del producto a eliminar:");
                    codigoProd = leer.nextInt();
                    Producto eliminarProd = em.find(Producto.class, codigoProd);
                    if (eliminarProd != null) {
                        em.getTransaction().begin();
                        em.remove(eliminarProd);
                        em.getTransaction().commit();
                        System.out.println("Producto eliminado correctamente.");
                    } else {
                        System.out.println("Producto no encontrado.");
                    }
                    break;
                case 5:
                    System.out.println("Estos son todos los productos.");
                    TypedQuery<Producto> query = em.createQuery("SELECT p FROM Producto p", Producto.class);
                    List<Producto> productos = query.getResultList();
                    for (Producto producto : productos) {
                        System.out.println(producto);
                    }
                    break;
                case 0:
                    System.out.println("Has salido del menu de Categorias.");
                    break;
                default:
                    System.out.println("ERROR: Has marcado una opcion NO válida.");
            }

        } while (op != 0);
    }
}
