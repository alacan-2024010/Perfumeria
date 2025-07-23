<%-- 
    Document   : compras
    Created on : 22/07/2025, 21:05:03
    Author     : HP
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Essenza | Gestión de Compras</title>
    <link rel="stylesheet" href="Styles/compras.css">
</head>
<body>
    <nav>
        <a href="admin.jsp" class="logo"> Essenza & Co.</a>
    </nav>
    
    <div class="fondo"></div>
    <div class="contenedor-principal">
        <div class="panel-formulario">
            <h1>Gestión de Compras</h1>
            <div class="formulario">
                <input type="datetime-local" id="fechaCompra" placeholder="Fecha de Compra" />
                <input type="number" step="0.01" id="total" placeholder="Total" />
                <input type="number" id="codigoProveedor" placeholder="Código Proveedor" />
                <input type="number" id="codigoEmpleado" placeholder="Código Empleado" />
            <div class="botones">
                <button>Agregar</button>
                <button>Actualizar</button>
                <button>Buscar</button>
                <button class="eliminar">Eliminar</button>
            </div>
            <div class="marca-interna">
            Essenza & Co.
        </div>
        </div>
        </div>
        <div class="panel-tabla">
            <div class="tabla-contenedor">
                <table class="tabla">
                <thead>
                <tr>
                    <th>Código Compra</th>
                    <th>Fecha Compra</th>
                    <th>Total</th>
                    <th>Código Proveedor</th>
                    <th>Código Empleado</th>
                </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>2024-01-10 08:30:00</td>
                        <td>Q.5,420.75</td>
                        <td>1</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>2024-01-11 10:15:00</td>
                        <td>Q.3,890.50</td>
                        <td>2</td>
                        <td>2</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>2024-01-12 14:20:00</td>
                        <td>Q.7,234.25</td>
                        <td>3</td>
                        <td>3</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>2024-01-13 09:45:00</td>
                        <td>Q.2,567.80</td>
                        <td>4</td>
                        <td>4</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>2024-01-14 16:30:00</td>
                        <td>Q.4,890.00</td>
                        <td>5</td>
                        <td>5</td>
                    </tr>
                </tbody>
            </table>
            </div> 
        </div> 
    </div>  
</body>
</html>