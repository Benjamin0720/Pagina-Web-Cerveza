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
@Table(name = "cerveza")
@NamedQueries(@NamedQuery(name = "Cerveza.mostrar", query = "SELECT c FROM Cerveza c"))
public class Cerveza implements Serializable {
    @Id
    @Column
    int id;
    @Column
    String nombre;
    @Column
    int precio;
    @Column
    String marca;
    @Column
    int stock;
    @Column
    String imagen;
    @JoinColumn(name = "categoria", referencedColumnName = "id")
    @ManyToOne
    Categoria categoria;

    public Cerveza() {
    }

    public Cerveza(int id, String nombre, int precio, String marca, int stock, String imagen, Categoria categoria) {
        this.id = id;
        this.nombre = nombre;
        this.precio = precio;
        this.marca = marca;
        this.stock = stock;
        this.imagen = imagen;
        this.categoria = categoria;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
    
    public String getImagen() {
        return imagen;
    }
    
    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    @Override
    public String toString() {
        return "Cerveza{" + "id=" + id + ", nombre=" + nombre + ", precio=" + precio + ", marca=" + marca + ", stock=" + stock +", Imagen=" + imagen + ", Categoria=" + categoria + '}';
    }
    
    
}
