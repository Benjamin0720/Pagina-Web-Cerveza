/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author benja
 */
@Entity
@Table(name = "perfil_usuario")
@NamedQueries(@NamedQuery(name = "PerfilUsuario.mostrar", query = "SELECT pu FROM PerfilUsuario pu"))
public class PerfilUsuario implements Serializable{
    @Id
    @Column
    int id;
    @Column
    String descripcion;

    public PerfilUsuario() {
    }

    public PerfilUsuario(int id, String descripcion) {
        this.id = id;
        this.descripcion = descripcion;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return "PerfilUsuario{" + "id=" + id + ", descripcion=" + descripcion + '}';
    }
    
    
}
