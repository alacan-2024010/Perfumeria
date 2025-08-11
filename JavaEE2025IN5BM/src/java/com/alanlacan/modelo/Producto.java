
package com.alanlacan.modelo;

import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table (name = "Productos")
public class Producto {
     @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int codigoProducto;
    @Column
    private String nombreProducto;
    @Column
    private String descripcionProducto;
    @Column
    private BigDecimal precioProducto; 
    @Column
    private int stock;
    @ManyToOne
    @JoinColumn(name = "codigoCategoria")
    private Cliente categoria;

    @ManyToOne
    @JoinColumn(name = "codigoProveedor")
    private Empleado proveedor;

    public Producto() {
    }

    public Producto(int codigoProducto, String nombreProducto, String descripcionProducto, BigDecimal precioProducto, int stock, Cliente categoria, Empleado proveedor) {
        this.codigoProducto = codigoProducto;
        this.nombreProducto = nombreProducto;
        this.descripcionProducto = descripcionProducto;
        this.precioProducto = precioProducto;
        this.stock = stock;
        this.categoria = categoria;
        this.proveedor = proveedor;
    }

    public int getCodigoProducto() {
        return codigoProducto;
    }

    public void setCodigoProducto(int codigoProducto) {
        this.codigoProducto = codigoProducto;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getDescripcionProducto() {
        return descripcionProducto;
    }

    public void setDescripcionProducto(String descripcionProducto) {
        this.descripcionProducto = descripcionProducto;
    }

    public BigDecimal getPrecioProducto() {
        return precioProducto;
    }

    public void setPrecioProducto(BigDecimal precioProducto) {
        this.precioProducto = precioProducto;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public Cliente getCategoria() {
        return categoria;
    }

    public void setCategoria(Cliente categoria) {
        this.categoria = categoria;
    }

    public Empleado getProveedor() {
        return proveedor;
    }

    public void setProveedor(Empleado proveedor) {
        this.proveedor = proveedor;
    }

    @Override
    public String toString() {
        return "Producto{" + "codigoProducto=" + codigoProducto + ", nombreProducto=" + nombreProducto + ", descripcionProducto=" + descripcionProducto + ", precioProducto=" + precioProducto + ", stock=" + stock + ", categoria=" + categoria + ", proveedor=" + proveedor + '}';
    }
    
    
}
