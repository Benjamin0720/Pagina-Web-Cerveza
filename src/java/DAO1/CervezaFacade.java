/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO1;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import modelo.Cerveza;

/**
 *
 * @author benja
 */
@Stateless
public class CervezaFacade extends AbstractFacade<Cerveza> {

    @PersistenceContext(unitName = "CervezaPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CervezaFacade() {
        super(Cerveza.class);
    }
    
}
