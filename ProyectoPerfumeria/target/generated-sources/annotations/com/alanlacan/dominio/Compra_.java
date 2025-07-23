package com.alanlacan.dominio;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2025-07-22T19:46:49", comments="EclipseLink-2.7.12.v20230209-rNA")
@StaticMetamodel(Compra.class)
public class Compra_ { 

    public static volatile SingularAttribute<Compra, LocalDateTime> fechaCompra;
    public static volatile SingularAttribute<Compra, BigDecimal> total;
    public static volatile SingularAttribute<Compra, Integer> codigoEmpleado;
    public static volatile SingularAttribute<Compra, Integer> codigoProveedor;
    public static volatile SingularAttribute<Compra, Integer> codigoCompra;

}