
package Modelo;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;


public class DetalleVentaDAO {
    
    private EntityManagerFactory emf;
    private EntityManager em;
 
    public DetalleVentaDAO() {
        emf = Persistence.createEntityManagerFactory("dominio");
        em = emf.createEntityManager();
    }
 
    public void crearDetalleVenta(DetalleVenta detalleVenta) {
        try {
            em.getTransaction().begin();
            em.persist(detalleVenta); 
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }
 
    public DetalleVenta buscarDetalleVenta(int codigoDetalleVenta) {
        return em.find(DetalleVenta.class, codigoDetalleVenta);
    }
 
    public void actualizarDetalleVenta(DetalleVenta detalleVenta) {
        try {
            em.getTransaction().begin();
            em.merge(detalleVenta);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }
 
    public void eliminarDetalleVenta(int codigoDetalleVenta) {
        try {
            DetalleVenta detalleVenta = em.find(DetalleVenta.class, codigoDetalleVenta);
            if (detalleVenta != null) {
                em.getTransaction().begin();
                em.remove(detalleVenta); 
                em.getTransaction().commit();
            }
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }
 
    public List<DetalleVenta> listarDetalleVentas() {
        return em.createQuery("SELECT c FROM DetalleVenta c", DetalleVenta.class).getResultList();
    }
 
    public void cerrar() {
        em.close();
        emf.close();
    }
}
