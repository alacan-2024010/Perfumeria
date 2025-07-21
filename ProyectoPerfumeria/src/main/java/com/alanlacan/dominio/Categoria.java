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
@Table(name = "Categorias")
public class Categoria {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int codigoCategoria;
    @Column
    private String nombre;

    public Categoria() {
    }

    public Categoria(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigoCategoria() {
        return codigoCategoria;
    }

    public void setCodigoCategoria(int codigoCategoria) {
        this.codigoCategoria = codigoCategoria;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public String toString() {
        return "Categoria{" + "codigoCategoria=" + codigoCategoria + ", nombre=" + nombre + '}';
    }

    public void menuCategoria() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("dominio");
        Scanner leer = new Scanner(System.in);
        EntityManager em = emf.createEntityManager();
        int op;

        do {
            System.out.println("--- BIENVENIDO AL MENU DE CATEGORIAS ---");
            System.out.println("1. Agregar Categoría. ");
            System.out.println("2. Buscar Categoria.");
            System.out.println("3. Actualizar Categoria.");
            System.out.println("4. Eliminar Categoria.");
            System.out.println("5. Listar Categorias.");
            System.out.println("0. Salir del menu.");
            op = leer.nextInt();
            leer.nextLine();

            switch (op) {
                case 1:
                    System.out.println("Ingrese los datos necesarios de la nueva Categoría:");
                    System.out.println("Nombre de la categoría:");
                    String nombreCat = leer.nextLine();

                    Categoria nuevaCat = new Categoria(nombreCat);
                    em.getTransaction().begin();
                    em.persist(nuevaCat);
                    em.getTransaction().commit();
                    System.out.println("Categoria agregada correctamente.");
                    break;
                case 2:
                    System.out.println("Ingrese el codigo de la Categoría que se busca.");
                    int codeCat = leer.nextInt();
                    Categoria cat = em.find(Categoria.class, codeCat);
                    System.out.println(cat);
                    break;
                case 3:
                    System.out.println("Ingrese el codigo de la Categoria que se modificará.");
                    int codigoCategoria = leer.nextInt();
                    leer.nextLine();

                    Categoria modificarCate = em.find(Categoria.class, codigoCategoria);
                    if (modificarCate != null) {
                        System.out.println("Ingrese el nuevo nombre de la Categoria:");
                        modificarCate.setNombre(leer.nextLine());
                        em.getTransaction().begin();
                        em.merge(modificarCate);
                        em.getTransaction().commit();

                        System.out.println("La Categoria se ha modificado correctamente.");
                    } else {
                        System.out.println("La Categoria no se ha encontrado.");
                    }
                    break;
                case 4:
                    System.out.println("Ingrese el codigo de la Categoria que eliminará:");
                    codigoCategoria = leer.nextInt();
                    leer.nextLine();
                    Categoria eliminarCat = em.find(Categoria.class, codigoCategoria);

                    if (eliminarCat != null) {
                        em.getTransaction().begin();
                        em.remove(eliminarCat);
                        em.getTransaction().commit();
                        System.out.println("La categoria se ha eliminado correctamente.");

                    } else {
                        System.out.println("La categoria no se ha encontrado.");
                    }
                    break;
                case 5:
                    System.out.println("Estas son todas las Categorias:");
                    TypedQuery<Categoria> query = em.createQuery("SELECT cat FROM Categoria cat", Categoria.class);
                    List<Categoria> categorias = query.getResultList();

                    for (Categoria categoria : categorias) {
                        System.out.println(categoria);
                    }
                    break;
                case 0:
                    System.out.println("Has salido del menu de Categorias.");
                    break;
                default:
                    System.out.println("ERROR: Has marcado una opcion NO válida.");
                    ;
            }

        } while (op != 0);
    }

}
