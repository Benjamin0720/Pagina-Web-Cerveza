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
import modelo.PerfilUsuario;

/**
 *
 * @author benja
 */
@Stateless
public class PerfilUsuarioDAO implements PerfilUsuarioDAOLocal {

    @PersistenceContext(unitName = "CervezaPU")
    EntityManager em;
    
    @Override
    public int agregar(PerfilUsuario perfil) {
        em.persist(perfil);
        return 1;
    }

    @Override
    public int modificar(PerfilUsuario perfil) {
        em.merge(perfil);
        return 1;
    }

    @Override
    public PerfilUsuario buscar(int id) {
        return em.find(PerfilUsuario.class, id);
    }

    @Override
    public int eliminar(int id) {
        em.remove(buscar(id));
        return 1;
    }

    @Override
    public List<PerfilUsuario> mostrar() {
        return em.createNamedQuery("PerfilUsuario.mostrar").getResultList();
    }

    
}
