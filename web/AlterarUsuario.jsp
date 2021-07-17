<%-- 
    Document   : AlterarUsuario
    Created on : 07/07/2021, 21:29:05
    Author     : erikr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
        <title>Alterar</title>
        <%
            String vcodigo="";
            String vnome="";
            String vemail="";
            vcodigo = (String) request.getAttribute("uCodigo").toString();
            vnome = (String) request.getAttribute("uNome").toString();
            vemail = (String) request.getAttribute("uEmail").toString();
        %>
    </head>
    <body>
        <h1>Formulário de Cadastro</h1>
        <br>
        <div class="container" style="width: 500px;">
        <form action="ServletAlterar" method="post">
            <input type="hidden" name="cod" value="<%=vcodigo%>">
            <div class="form-group">
                <label for="name">Nome:</label>
                <input type="text" class="form-control" id="name" name="nome" value="<%=vnome%>">
            </div>
            <div class="form-group">
                <label for="email">email</label>
                <input type="email" class="form-control" id="email" name="email" value="<%=vemail%>">
            </div>
            <br>
            <button type="submit" class="btn btn-primary btn-lg btn-block" value="alterar">Alterar</button>
        </form>
        </div>
    </body>
</html>
