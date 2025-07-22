package com.alanlacan.dominio;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Scanner;

@Entity
@Table(name = "Facturas")
public class Factura {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int codigoFactura;

    @Column(nullable = false, length = 50)
    private String numeroFactura;

    @Column
    private LocalDateTime fechaEmision;

    @Column(precision = 10, scale = 2)
    private double totalFactura;

    @Column(unique = true)
    private int codigoVenta;

    public Factura() {
    }

    public Factura(String numeroFactura, LocalDateTime fechaEmision, double totalFactura, int codigoVenta) {
        this.numeroFactura = numeroFactura;
        this.fechaEmision = fechaEmision;
        this.totalFactura = totalFactura;
        this.codigoVenta = codigoVenta;
    }

    public int getCodigoFactura() {
        return codigoFactura;
    }

    public void setCodigoFactura(int codigoFactura) {
        this.codigoFactura = codigoFactura;
    }

    public String getNumeroFactura() {
        return numeroFactura;
    }

    public void setNumeroFactura(String numeroFactura) {
        this.numeroFactura = numeroFactura;
    }

    public LocalDateTime getFechaEmision() {
        return fechaEmision;
    }

    public void setFechaEmision(LocalDateTime fechaEmision) {
        this.fechaEmision = fechaEmision;
    }

    public double getTotalFactura() {
        return totalFactura;
    }

    public void setTotalFactura(double totalFactura) {
        this.totalFactura = totalFactura;
    }

    public int getCodigoVenta() {
        return codigoVenta;
    }

    public void setCodigoVenta(int codigoVenta) {
        this.codigoVenta = codigoVenta;
    }

    @Override
    public String toString() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        return "Factura{" +
                "codigoFactura=" + codigoFactura +
                ", numeroFactura='" + numeroFactura + '\'' +
                ", fechaEmision=" + (fechaEmision != null ? fechaEmision.format(formatter) : "null") +
                ", totalFactura=" + totalFactura +
                ", codigoVenta=" + codigoVenta +
                '}';
    }

    public void menuFactura() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("dominio");
        EntityManager em = emf.createEntityManager();
        Scanner leer = new Scanner(System.in);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        int op;

        do {
            System.out.println("\n--- MENÚ FACTURAS ---");
            System.out.println("1. Agregar Factura");
            System.out.println("2. Buscar Factura");
            System.out.println("3. Actualizar Factura");
            System.out.println("4. Eliminar Factura");
            System.out.println("5. Listar Facturas");
            System.out.println("0. Salir");
            System.out.print("Seleccione una opción: ");
            op = leer.nextInt();
            leer.nextLine();

            switch (op) {
                case 1:
                    System.out.print("Número de Factura: ");
                    String numeroFactura = leer.nextLine();
                    System.out.print("Fecha de Emisión (yyyy-MM-dd HH:mm:ss): ");
                    String fechaStr = leer.nextLine();
                    LocalDateTime fechaEmision;
                    try {
                        fechaEmision = LocalDateTime.parse(fechaStr, formatter);
                    } catch (Exception e) {
                        System.out.println("❌ Formato de fecha inválido. Use: yyyy-MM-dd HH:mm:ss");
                        break;
                    }
                    System.out.print("Total de Factura: ");
                    double totalFactura = leer.nextDouble();
                    System.out.print("Código de Venta: ");
                    int codigoVenta = leer.nextInt();

                    Factura nueva = new Factura(numeroFactura, fechaEmision, totalFactura, codigoVenta);
                    try {
                        em.getTransaction().begin();
                        em.persist(nueva);
                        em.getTransaction().commit();
                        System.out.println("✅ Factura agregada con éxito.");
                    } catch (Exception e) {
                        em.getTransaction().rollback();
                        System.out.println("❌ Error al agregar factura: " + e.getMessage());
                    }
                    break;

                case 2:
                    System.out.print("Código de la factura a buscar: ");
                    int codBuscar = leer.nextInt();
                    Factura encontrada = em.find(Factura.class, codBuscar);
                    if (encontrada != null) {
                        System.out.println(encontrada);
                    } else {
                        System.out.println("❌ Factura no encontrada.");
                    }
                    break;

                case 3:
                    System.out.print("Código de la factura a modificar: ");
                    int codActualizar = leer.nextInt();
                    leer.nextLine();
                    Factura actual = em.find(Factura.class, codActualizar);
                    if (actual != null) {
                        System.out.print("Nuevo Número de Factura: ");
                        actual.setNumeroFactura(leer.nextLine());
                        System.out.print("Nueva Fecha de Emisión (yyyy-MM-dd HH:mm:ss): ");
                        String nuevaFechaStr = leer.nextLine();
                        try {
                            LocalDateTime nuevaFecha = LocalDateTime.parse(nuevaFechaStr, formatter);
                            actual.setFechaEmision(nuevaFecha);
                        } catch (Exception e) {
                            System.out.println("❌ Formato de fecha inválido. Manteniendo fecha anterior.");
                        }
                        System.out.print("Nuevo Total de Factura: ");
                        actual.setTotalFactura(leer.nextDouble());
                        System.out.print("Nuevo Código de Venta: ");
                        actual.setCodigoVenta(leer.nextInt());

                        try {
                            em.getTransaction().begin();
                            em.merge(actual);
                            em.getTransaction().commit();
                            System.out.println("✅ Factura actualizada correctamente.");
                        } catch (Exception e) {
                            em.getTransaction().rollback();
                            System.out.println("❌ Error al actualizar factura: " + e.getMessage());
                        }
                    } else {
                        System.out.println("❌ Factura no encontrada.");
                    }
                    break;

                case 4:
                    System.out.print("Código de la factura a eliminar: ");
                    int codEliminar = leer.nextInt();
                    Factura eliminar = em.find(Factura.class, codEliminar);
                    if (eliminar != null) {
                        try {
                            em.getTransaction().begin();
                            em.remove(eliminar);
                            em.getTransaction().commit();
                            System.out.println("✅ Factura eliminada con éxito.");
                        } catch (Exception e) {
                            em.getTransaction().rollback();
                            System.out.println("❌ Error al eliminar factura: " + e.getMessage());
                        }
                    } else {
                        System.out.println("❌ Factura no encontrada.");
                    }
                    break;

                case 5:
                    System.out.println("\n--- Lista de Facturas ---");
                    List<Factura> lista = em.createQuery("SELECT f FROM Factura f", Factura.class).getResultList();
                    if (lista.isEmpty()) {
                        System.out.println("📋 No hay facturas registradas.");
                    } else {
                        for (Factura f : lista) {
                            System.out.println(f);
                        }
                    }
                    break;

                case 0:
                    System.out.println("👋 Saliendo del menú de Facturas.");
                    break;

                default:
                    System.out.println("⚠️ Opción inválida. Intente de nuevo.");
            }
        } while (op != 0);

        em.close();
        emf.close();
    }
}