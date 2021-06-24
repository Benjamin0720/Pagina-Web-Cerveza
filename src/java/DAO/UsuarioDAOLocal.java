/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.List;
import javax.ejb.Local;
import modelo.Usuario;

/**
 *
 * @author benja
 */
@Local
public interface UsuarioDAOLocal {

    int agregar(Usuario usu);

    int modificar(Usuario usu);

    Usuario buscar(String correo);

    int eliminar(String correo);

    List<Usuario> mostrar();
    
}
