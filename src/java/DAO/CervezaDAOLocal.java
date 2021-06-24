/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.List;
import javax.ejb.Local;
import modelo.Cerveza;

/**
 *
 * @author benja
 */
@Local
public interface CervezaDAOLocal {

    int agregar(Cerveza cerv);

    int modificar(Cerveza cerv);

    Cerveza buscar(int id);

    int eliminar(int id);

    List<Cerveza> mostrar();
    
}
