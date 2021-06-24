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
import modelo.Usuario;

/**
 *
 * @author benja
 */
@Stateless
public class UsuarioDAO implements UsuarioDAOLocal {

    @PersistenceContext(unitName = "CervezaPU")
    EntityManager em;
    
    @Override
    public int agregar(Usuario usu) {
        em.persist(usu);
        return 1;
    }

    @Override
    public int modificar(Usuario usu) {
        em.merge(usu);
        return 1;
    }

    @Override
    public Usuario buscar(String correo) {
        return em.find(Usuario.class, correo);
    }

    @Override
    public int eliminar(String correo) {
        em.remove(buscar(correo));
        return 1;
    }

    @Override
    public List<Usuario> mostrar() {
        return em.createNamedQuery("Usuario.mostrar").getResultList();
    }

    
    
    }
