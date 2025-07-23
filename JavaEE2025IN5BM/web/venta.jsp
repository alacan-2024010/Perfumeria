<%-- 
    Document   : venta
    Created on : 22/07/2025, 17:34:01
    Author     : Titi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Essenza & Co. | Gestión de Ventas</title>
    <link rel="stylesheet" href="Styles/venta.css" />
</head>
<body>

    <header>
        <h1>Essenza & Co.</h1>
    </header>

    <main class="contenedor">

        <div class="formulario">
            <h2>Gestión de Ventas</h2>

            <input type="text" placeholder="ID de venta">
            <input type="datetime-local" placeholder="Fecha">
            <input type="text" placeholder="Total">
            <select>
                <option>ID Cliente</option>
            </select>
            <select>
                <option>ID Empleado</option>
            </select>

            <div class="botones">
                <button class="btn agregar">Agregar</button>
                <button class="btn actualizar">Actualizar</button>
                <button class="btn buscar">Buscar</button>
                <button class="btn eliminar">Eliminar</button>
            </div>

            <footer>
                <p>Essenza & Co.</p>
            </footer>
        </div>

        <div class="tabla">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Fecha</th>
                        <th>Total</th>
                        <th>ID Cliente</th>
                        <th>ID Empleado</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>

    </main>

</body>
</html>

