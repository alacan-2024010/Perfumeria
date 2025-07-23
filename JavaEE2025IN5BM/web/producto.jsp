<%-- 
    Document   : producto
    Created on : 23 jul 2025, 07:05:17
    Author     : informatica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Gestión de Productos</title>
        <link rel="stylesheet" href="Styles/producto.css" />
        <link rel="stylesheet" href="fonts.css" />
    </head>



    <body>

        <nav>
            <a href="admin.jsp" class="logo">Essenza & Co.</a>
        </nav>
        <div class="fondo"></div>

        <div class="contenedor-principal">
            <div class="panel-formulario">
                <h1>Gestión de Productos</h1>
                <div class="formulario">
                    <input type="text" id="nombre" placeholder="ID del producto" />
                    <input type="text" id="nombre" placeholder="Nombre del producto" />
                    <input type="text" id="descripcion" placeholder="Descripción" />
                    <input type="number" id="precio" placeholder="Precio" />
                    <input type="number" id="existencias" placeholder="Existencias" />
                    <input type="number" id="categoria" placeholder="ID Categoría" />
                    <input type="number" id="marca" placeholder="ID Marca" />
                    <div class="botones">
                        <button id ="AgregarP">Agregar</button>
                        <button id = "ActualizarP">Actualizar</button>
                        <button id="BuscarP">Buscar</button>
                        <button id="EliminarP">Eliminar</button>
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
                                <th>Descripción</th>
                                <th>Precio</th>
                                <th>Existencias</th>
                                <th>ID Categoría</th>
                                <th>ID Marca</th>
                            </tr>
                        </thead>
                        <tbody>
                        <tbody>

                        </tbody>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
