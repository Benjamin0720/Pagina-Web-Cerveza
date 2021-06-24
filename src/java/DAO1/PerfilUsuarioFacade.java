/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO1;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import modelo.PerfilUsuario;

/**
 *
 * @author benja
 */
@Stateless
public class PerfilUsuarioFacade extends AbstractFacade<PerfilUsuario> {

    @PersistenceContext(unitName = "CervezaPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PerfilUsuarioFacade() {
        super(PerfilUsuario.class);
    }
    
}
