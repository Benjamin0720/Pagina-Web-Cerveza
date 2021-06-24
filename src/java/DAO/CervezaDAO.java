/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import modelo.Cerveza;

/**
 *
 * @author benja
 */
@Stateless
public class CervezaDAO implements CervezaDAOLocal {

    @PersistenceContext (unitName = "CervezaPU")
    EntityManager em;
    
    @Override
    public int agregar(Cerveza cerv) {
        em.persist(cerv);
        return 1;
    }

    @Override
    public int modificar(Cerveza cerv) {
        em.merge(cerv);
        return 1;
    }

    @Override
    public Cerveza buscar(int id) {
        return em.find(Cerveza.class, id);
    }

    @Override
    public int eliminar(int id) {
        em.remove(buscar(id));
        return 1;
    }

    @Override
    public List<Cerveza> mostrar() {
        return em.createNamedQuery("Cerveza.mostrar").getResultList();
    }

   
}
