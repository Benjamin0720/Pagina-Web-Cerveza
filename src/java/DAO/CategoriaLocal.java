/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.List;
import modelo.Categoria;
import javax.ejb.Local;

/**
 *
 * @author benja
 */
@Local
public interface CategoriaLocal {

    int agregar(Categoria cate);

    int modificar(Categoria cate);

    int eliminar(int id);

    Categoria buscar(int id);

    List<Categoria> mostrar();
    
}
