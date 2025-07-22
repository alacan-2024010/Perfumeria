package com.alanlacan.dominio;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Scanner;

@Entity
@Table(name = "Compras")
public class Compra {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int codigoCompra;

    @Column
    private LocalDateTime fechaCompra;

    @Column(precision = 10, scale = 2)
    private double total;

    @Column
    private int codigoProveedor;

    @Column
    private int codigoEmpleado;

    public Compra() {
    }

    public Compra(LocalDateTime fechaCompra, double total, int codigoProveedor, int codigoEmpleado) {
        this.fechaCompra = fechaCompra;
        this.total = total;
        this.codigoProveedor = codigoProveedor;
        this.codigoEmpleado = codigoEmpleado;
    }

    public int getCodigoCompra() {
        return codigoCompra;
    }

    public void setCodigoCompra(int codigoCompra) {
        this.codigoCompra = codigoCompra;
    }

    public LocalDateTime getFechaCompra() {
        return fechaCompra;
    }

    public void setFechaCompra(LocalDateTime fechaCompra) {
        this.fechaCompra = fechaCompra;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getCodigoProveedor() {
        return codigoProveedor;
    }

    public void setCodigoProveedor(int codigoProveedor) {
        this.codigoProveedor = codigoProveedor;
    }

    public int getCodigoEmpleado() {
        return codigoEmpleado;
    }

    public void setCodigoEmpleado(int codigoEmpleado) {
        this.codigoEmpleado = codigoEmpleado;
    }

    @Override
    public String toString() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        return "Compra{" +
                "codigoCompra=" + codigoCompra +
                ", fechaCompra=" + (fechaCompra != null ? fechaCompra.format(formatter) : "null") +
                ", total=" + total +
                ", codigoProveedor=" + codigoProveedor +
                ", codigoEmpleado=" + codigoEmpleado +
                '}';
    }

    public void menuCompra() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("dominio");
        EntityManager em = emf.createEntityManager();
        Scanner leer = new Scanner(System.in);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        int op;

        do {
            System.out.println("\n--- MENÚ COMPRAS ---");
            System.out.println("1. Agregar Compra");
            System.out.println("2. Buscar Compra");
            System.out.println("3. Actualizar Compra");
            System.out.println("4. Eliminar Compra");
            System.out.println("5. Listar Compras");
            System.out.println("0. Salir");
            System.out.print("Seleccione una opción: ");
            op = leer.nextInt();
            leer.nextLine();

            switch (op) {
                case 1:
                    System.out.print("Fecha de Compra (yyyy-MM-dd HH:mm:ss): ");
                    String fechaStr = leer.nextLine();
                    LocalDateTime fechaCompra;
                    try {
                        fechaCompra = LocalDateTime.parse(fechaStr, formatter);
                    } catch (Exception e) {
                        System.out.println("❌ Formato de fecha inválido. Use: yyyy-MM-dd HH:mm:ss");
                        break;
                    }
                    System.out.print("Total de la Compra: ");
                    double total = leer.nextDouble();
                    System.out.print("Código del Proveedor: ");
                    int codigoProveedor = leer.nextInt();
                    System.out.print("Código del Empleado: ");
                    int codigoEmpleado = leer.nextInt();

                    Compra nueva = new Compra(fechaCompra, total, codigoProveedor, codigoEmpleado);
                    try {
                        em.getTransaction().begin();
                        em.persist(nueva);
                        em.getTransaction().commit();
                        System.out.println("✅ Compra agregada con éxito.");
                    } catch (Exception e) {
                        em.getTransaction().rollback();
                        System.out.println("❌ Error al agregar compra: " + e.getMessage());
                    }
                    break;

                case 2:
                    System.out.print("Código de la compra a buscar: ");
                    int codBuscar = leer.nextInt();
                    Compra encontrada = em.find(Compra.class, codBuscar);
                    if (encontrada != null) {
                        System.out.println(encontrada);
                    } else {
                        System.out.println("❌ Compra no encontrada.");
                    }
                    break;

                case 3:
                    System.out.print("Código de la compra a modificar: ");
                    int codActualizar = leer.nextInt();
                    leer.nextLine();
                    Compra actual = em.find(Compra.class, codActualizar);
                    if (actual != null) {
                        System.out.print("Nueva Fecha de Compra (yyyy-MM-dd HH:mm:ss): ");
                        String nuevaFechaStr = leer.nextLine();
                        try {
                            LocalDateTime nuevaFecha = LocalDateTime.parse(nuevaFechaStr, formatter);
                            actual.setFechaCompra(nuevaFecha);
                        } catch (Exception e) {
                            System.out.println("❌ Formato de fecha inválido. Manteniendo fecha anterior.");
                        }
                        System.out.print("Nuevo Total: ");
                        actual.setTotal(leer.nextDouble());
                        System.out.print("Nuevo Código del Proveedor: ");
                        actual.setCodigoProveedor(leer.nextInt());
                        System.out.print("Nuevo Código del Empleado: ");
                        actual.setCodigoEmpleado(leer.nextInt());

                        try {
                            em.getTransaction().begin();
                            em.merge(actual);
                            em.getTransaction().commit();
                            System.out.println("✅ Compra actualizada correctamente.");
                        } catch (Exception e) {
                            em.getTransaction().rollback();
                            System.out.println("❌ Error al actualizar compra: " + e.getMessage());
                        }
                    } else {
                        System.out.println("❌ Compra no encontrada.");
                    }
                    break;

                case 4:
                    System.out.print("Código de la compra a eliminar: ");
                    int codEliminar = leer.nextInt();
                    Compra eliminar = em.find(Compra.class, codEliminar);
                    if (eliminar != null) {
                        try {
                            em.getTransaction().begin();
                            em.remove(eliminar);
                            em.getTransaction().commit();
                            System.out.println("✅ Compra eliminada con éxito.");
                        } catch (Exception e) {
                            em.getTransaction().rollback();
                            System.out.println("❌ Error al eliminar compra: " + e.getMessage());
                        }
                    } else {
                        System.out.println("❌ Compra no encontrada.");
                    }
                    break;

                case 5:
                    System.out.println("\n--- Lista de Compras ---");
                    List<Compra> lista = em.createQuery("SELECT c FROM Compra c", Compra.class).getResultList();
                    if (lista.isEmpty()) {
                        System.out.println("📋 No hay compras registradas.");
                    } else {
                        for (Compra c : lista) {
                            System.out.println(c);
                        }
                    }
                    break;

                case 0:
                    System.out.println("👋 Saliendo del menú de Compras.");
                    break;

                default:
                    System.out.println("⚠️ Opción inválida. Intente de nuevo.");
            }
        } while (op != 0);

        em.close();
        emf.close();
    }
}