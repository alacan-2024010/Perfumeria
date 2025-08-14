
package Modelo;
import javax.persistence.*;

@Entity
@Table(name = "Categorias")
public class Categoria {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int codigCategoria;
    
    @Column
    private String nombre;

    public Categoria() {
    }

    public Categoria(int codigCategoria, String nombre) {
        this.codigCategoria = codigCategoria;
        this.nombre = nombre;
    }

    public int getCodigCategoria() {
        return codigCategoria;
    }

    public void setCodigCategoria(int codigCategoria) {
        this.codigCategoria = codigCategoria;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public String toString() {
        return "Categoria{" + "codigCategoria=" + codigCategoria + ", nombre=" + nombre + '}';
    }
    
    
}
