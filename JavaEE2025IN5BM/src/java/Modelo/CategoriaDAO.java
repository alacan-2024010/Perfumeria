
package Modelo;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;


public class CategoriaDAO {
    
    private EntityManagerFactory emf;
    private EntityManager em;

    public CategoriaDAO() {
        emf = Persistence.createEntityManagerFactory("dominio"); // Asegúrate que el persistence unit "dominio" esté en persistence.xml
        em = emf.createEntityManager();
    }

    public void crearCategoria(Categoria categoria) {
        try {
            em.getTransaction().begin();
            em.persist(categoria);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public Compra buscarCategoria(int codigoCategoria) {
        return em.find(Compra.class, codigoCategoria);
    }

    public void actualizarCategoria(Categoria categoria) {
        try {
            em.getTransaction().begin();
            em.merge(categoria);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public void eliminarCategoria(int codigoCategoria) {
        try {
            Categoria categoria = em.find(Categoria.class, codigoCategoria);
            if (categoria != null) {
                em.getTransaction().begin();
                em.remove(categoria);
                em.getTransaction().commit();
            }
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public List<Categoria> listarCategorias() {
        return em.createQuery("SELECT c FROM Categoria c", Categoria.class).getResultList();
    }

    public void cerrar() {
        em.close();
        emf.close();
    }
}
