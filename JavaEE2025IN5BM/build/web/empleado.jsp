<%-- 
    Document   : empleado
    Created on : 22 jul 2025, 17:08:43
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Gestión de Productos</title>
    <link rel="stylesheet" href="Styles/empleado.css" />
    <link rel="stylesheet" href="FONT.css" />
</head>
<body>

    <nav>
        <a href="admin.jsp" class="logo"> Essenza & Co.</a>
    </nav>

    <div class="fondo"></div>

    <div class="contenedor-principal">
        <div class="panel-formulario">
        <h1>Gestión de Empleados</h1>
        <div class="formulario">
            <input type="text" id="nombre" placeholder="Nombre Empleado" />
            <input type="text" id="apellido" placeholder="Apellido Empleado" />
            <input type="text" id="direccion" placeholder="Direccion Empleado" />
            <input type="text" id="telefono" placeholder="Numero de Telefono" />
            <input type="text" id="email" placeholder="Correo Electronico" />
            <input type="text" id="puesto" placeholder="Puesto" />
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
                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Direccion</th>
                <th>Telefono</th>
                <th>Correo Electronico</th>
                <th>Puesto</th>
                </tr>
            </thead>
            <tbody>
<tbody>
    <tr><td>1</td><td>Juan Pablo</td><td>Mendez Saquij</td><td>calle 12</td><td>62546351</td><td>juan@</td><td>cajero</td></tr>
</tbody>

            </tbody>
            </table>
        </div>
        </div>
    </div>
</body>
</html>
