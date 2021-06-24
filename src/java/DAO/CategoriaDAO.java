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
import modelo.Categoria;

/**
 *
 * @author benja
 */
@Stateless
public class CategoriaDAO implements CategoriaLocal {

    @PersistenceContext(unitName = "CervezaPU")
    EntityManager em;
    
    @Override
    public int agregar(Categoria cate) {
        em.persist(cate);
        return 1;
    }

    @Override
    public int modificar(Categoria cate) {
        em.merge(cate);
        return 0;
    }

    @Override
    public int eliminar(int id) {
        em.remove(buscar(id));
        return 1;
    }

    @Override
    public Categoria buscar(int id) {
        return em.find(Categoria.class, id);
    }

    @Override
    public List<Categoria> mostrar() {
        return em.createNamedQuery("Categoria.mostrar").getResultList();
    }
    
    
}
