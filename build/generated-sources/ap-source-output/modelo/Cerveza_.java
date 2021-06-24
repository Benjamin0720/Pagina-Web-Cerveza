package modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Categoria;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-07-20T09:32:33")
@StaticMetamodel(Cerveza.class)
public class Cerveza_ { 

    public static volatile SingularAttribute<Cerveza, String> marca;
    public static volatile SingularAttribute<Cerveza, Integer> precio;
    public static volatile SingularAttribute<Cerveza, Categoria> categoria;
    public static volatile SingularAttribute<Cerveza, String> imagen;
    public static volatile SingularAttribute<Cerveza, Integer> id;
    public static volatile SingularAttribute<Cerveza, Integer> stock;
    public static volatile SingularAttribute<Cerveza, String> nombre;

}