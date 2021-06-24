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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;



/**
 *
 * @author benja
 */
@Entity
@Table(name = "usuario")
@NamedQueries(@NamedQuery(name = "Usuario.mostrar", query = "SELECT u FROM Usuario u"))
public class Usuario implements Serializable {
    @Id
    @Column
    String email;
    @Column
    String nombre;
    @Column
    String pass;
    @JoinColumn(name = "perfil_usuario", referencedColumnName = "id")
    @ManyToOne
    PerfilUsuario perfil;

    public Usuario() {
    }

    public Usuario(String email, String nombre, String pass, PerfilUsuario perfil) {
        this.email = email;
        this.nombre = nombre;
        this.pass = pass;
        this.perfil = perfil;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public PerfilUsuario getPerfil() {
        return perfil;
    }

    public void setPerfil(PerfilUsuario perfil) {
        this.perfil = perfil;
    }

    @Override
    public String toString() {
        return "Usuario{" + "email=" + email + ", nombre=" + nombre + ", pass=" + pass + ", perfil=" + perfil + '}';
    }

   
    
}
