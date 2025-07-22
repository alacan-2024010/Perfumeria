package com.alanlacan.dominio;

import com.alanlacan.dominio.Categoria;
import com.alanlacan.dominio.Proveedor;
import java.math.BigDecimal;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2025-07-22T08:54:20", comments="EclipseLink-2.7.12.v20230209-rNA")
@StaticMetamodel(Producto.class)
public class Producto_ { 

    public static volatile SingularAttribute<Producto, String> descripcionProducto;
    public static volatile SingularAttribute<Producto, Categoria> categoria;
    public static volatile SingularAttribute<Producto, Proveedor> proveedor;
    public static volatile SingularAttribute<Producto, Integer> codigoProducto;
    public static volatile SingularAttribute<Producto, BigDecimal> precioProducto;
    public static volatile SingularAttribute<Producto, Integer> stock;
    public static volatile SingularAttribute<Producto, String> nombreProducto;

}