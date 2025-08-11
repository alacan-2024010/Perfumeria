
package com.alanlacan.modelo;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;


public class FacturaDAO {
    private EntityManagerFactory emf;
    private EntityManager em;

    public FacturaDAO() {
        emf = Persistence.createEntityManagerFactory("dominio"); // Asegúrate que el persistence unit "dominio" esté en persistence.xml
        em = emf.createEntityManager();
    }

    public void crearFactura(Factura factura) {
        try {
            em.getTransaction().begin();
            em.persist(factura);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public Factura buscarFactura(int codigoFactura) {
        return em.find(Factura.class, codigoFactura);
    }

    public void actualizarFactura(Factura factura) {
        try {
            em.getTransaction().begin();
            em.merge(factura);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public void eliminarFactura(int codigoFactura) {
        try {
            Factura factura = em.find(Factura.class, codigoFactura);
            if (factura != null) {
                em.getTransaction().begin();
                em.remove(factura);
                em.getTransaction().commit();
            }
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public List<Factura> listarFacturas() {
        return em.createQuery("SELECT c FROM Factura c", Factura.class).getResultList();
    }

    public void cerrar() {
        em.close();
        emf.close();
    }
}
