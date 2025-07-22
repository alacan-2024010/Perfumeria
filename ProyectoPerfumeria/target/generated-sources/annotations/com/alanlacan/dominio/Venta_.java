package com.alanlacan.dominio;

import com.alanlacan.dominio.Cliente;
import com.alanlacan.dominio.Empleado;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2025-07-21T20:24:05", comments="EclipseLink-2.7.12.v20230209-rNA")
@StaticMetamodel(Venta.class)
public class Venta_ { 

    public static volatile SingularAttribute<Venta, String> fecha;
    public static volatile SingularAttribute<Venta, Cliente> cliente;
    public static volatile SingularAttribute<Venta, Integer> total;
    public static volatile SingularAttribute<Venta, Integer> codigoVenta;
    public static volatile SingularAttribute<Venta, Empleado> empleado;

}