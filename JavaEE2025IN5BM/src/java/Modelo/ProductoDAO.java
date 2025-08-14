package Modelo;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class ProductoDAO {
    private EntityManagerFactory emf;

    private EntityManager em;
 
    public ProductoDAO () {
        emf = Persistence.createEntityManagerFactory("dominio");
        em = emf.createEntityManager();
    }
    
    public void crearProducto(Producto producto) {
        try {
            em.getTransaction().begin();
            em.persist(producto); 
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }

    }
 
    public Producto buscarProducto(int codigoProducto) {
        return em.find(Producto.class, codigoProducto);
    }
    
    
    public void actualizarProducto(Producto producto) {
        try {
            em.getTransaction().begin();
            em.merge(producto);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }
 
    public void eliminarProducto(int codigoProducto) {

        try {
           Producto producto = em.find(Producto.class, codigoProducto);
            if (producto != null) {
                em.getTransaction().begin();
                em.remove(producto); 
                em.getTransaction().commit();
            }

        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }
 
    public List<Producto> listarProductos() {
        return em.createQuery("SELECT v FROM Producto v", Producto.class).getResultList();
    }
 
    public void cerrar() {
        em.close();
        emf.close();
    }
 
    
}
