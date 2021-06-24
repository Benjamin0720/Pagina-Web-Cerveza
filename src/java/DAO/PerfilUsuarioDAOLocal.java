/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.List;
import javax.ejb.Local;
import modelo.PerfilUsuario;

/**
 *
 * @author benja
 */
@Local
public interface PerfilUsuarioDAOLocal {

    int agregar(PerfilUsuario perfil);

    int modificar(PerfilUsuario perfil);

    PerfilUsuario buscar(int id);

    int eliminar(int id);

    List<PerfilUsuario> mostrar();
    
}
