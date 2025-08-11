
package com.alanlacan.modelo;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import javax.persistence.*;

@Entity
@Table(name = "Facturas")
public class Factura {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int codigoFactura;
    
    @Column
    private String numeroFactura;
    
    @Column 
    private LocalDateTime fechaEmision;
    
    @Column
    private BigDecimal totalFactura;

    public Factura() {
    }

    public Factura(int codigoFactura, String numeroFactura, LocalDateTime fechaEmision, BigDecimal totalFactura) {
        this.codigoFactura = codigoFactura;
        this.numeroFactura = numeroFactura;
        this.fechaEmision = fechaEmision;
        this.totalFactura = totalFactura;
    }

    public int getCodigoFactura() {
        return codigoFactura;
    }

    public void setCodigoFactura(int codigoFactura) {
        this.codigoFactura = codigoFactura;
    }

    public String getNumeroFactura() {
        return numeroFactura;
    }

    public void setNumeroFactura(String numeroFactura) {
        this.numeroFactura = numeroFactura;
    }

    public LocalDateTime getFechaEmision() {
        return fechaEmision;
    }

    public void setFechaEmision(LocalDateTime fechaEmision) {
        this.fechaEmision = fechaEmision;
    }

    public BigDecimal getTotalFactura() {
        return totalFactura;
    }

    public void setTotalFactura(BigDecimal totalFactura) {
        this.totalFactura = totalFactura;
    }

    @Override
    public String toString() {
        return "Factura{" + "codigoFactura=" + codigoFactura + ", numeroFactura=" + numeroFactura + ", fechaEmision=" + fechaEmision + ", totalFactura=" + totalFactura + '}';
    }
    
    
    
}
