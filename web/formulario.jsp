<%-- 
    Document   : formulario
    Created on : 06/07/2021, 23:30:15
    Author     : erikr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
        <title>Cadastro</title>
    </head>
    <body>
        <h1>Formulário de Cadastro</h1>
        <br>
        <div class="container" style="width: 500px;">
        <form action="ServletInserir" method="post">
            <div class="form-group">
                <label for="name">Nome:</label>
                <input type="text" class="form-control" id="name" name="nome">
            </div>
            <div class="form-group">
                <label for="email">email</label>
                <input type="email" class="form-control" id="email" name="email">
            </div>
            <br>
            <button type="submit" class="btn btn-primary btn-lg btn-block">Enviar</button>
        </form>
        </div>
    </body>
</html>
