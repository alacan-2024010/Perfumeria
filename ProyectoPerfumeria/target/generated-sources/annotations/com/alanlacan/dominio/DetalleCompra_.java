package com.alanlacan.dominio;

import com.alanlacan.dominio.Compra;
import com.alanlacan.dominio.Producto;
import java.math.BigDecimal;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

<<<<<<< HEAD
@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2025-07-22T15:47:06", comments="EclipseLink-2.7.12.v20230209-rNA")
=======
@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2025-07-22T19:46:49", comments="EclipseLink-2.7.12.v20230209-rNA")
>>>>>>> origin/ftpcalderon-2021547
@StaticMetamodel(DetalleCompra.class)
public class DetalleCompra_ { 

    public static volatile SingularAttribute<DetalleCompra, BigDecimal> precioUnitario;
    public static volatile SingularAttribute<DetalleCompra, Compra> codigoCompra;
    public static volatile SingularAttribute<DetalleCompra, Integer> codigoDetalleCompra;
    public static volatile SingularAttribute<DetalleCompra, Integer> cantidad;
    public static volatile SingularAttribute<DetalleCompra, Producto> codigoProducto;

}