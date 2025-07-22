package com.alanlacan.dominio;

import com.alanlacan.dominio.Producto;
import com.alanlacan.dominio.Venta;
import java.math.BigDecimal;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2025-07-22T08:23:06", comments="EclipseLink-2.7.12.v20230209-rNA")
@StaticMetamodel(DetalleVenta.class)
public class DetalleVenta_ { 

    public static volatile SingularAttribute<DetalleVenta, Venta> venta;
    public static volatile SingularAttribute<DetalleVenta, BigDecimal> precioUnitario;
    public static volatile SingularAttribute<DetalleVenta, Integer> codigoDetalleVenta;
    public static volatile SingularAttribute<DetalleVenta, Integer> cantidad;
    public static volatile SingularAttribute<DetalleVenta, Producto> producto;

}