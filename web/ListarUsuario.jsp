<%-- 
    Document   : ListaUsuario
    Created on : 07/07/2021, 16:45:28
    Author     : erikr
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.com.entidade.Usuario"%>
<%@page import="br.com.DAO.ManterUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista</title>
        <!-- Linha para utilizar o bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <!-- Linha para utilizar o JavaScript -->
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        </head>
    <body>
        <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Codigo</th><!-- Coluna Código da Tabela -->
      <th scope="col">Nome</th><!-- Coluna Nome da Tabela -->
      <th scope="col">Email</th><!-- Coluna Email da Tabela -->
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>
        <%
            String vcodigo="";
            String vnome="";
            String vemail="";
            String vcontador="";
            ManterUsuario dao = new ManterUsuario(); //objeto do tipo DAO
            Usuario u =  new Usuario();
            ArrayList<Usuario> usuarios = dao.ListarTudo();  //Objeto do tipo Controle  
            for (int i = 0; i < usuarios.size(); i++) {//para o contador i começando por 0 até o tamanho do objeto que é do tipo ArrayList               
                u = usuarios.get(i);//pega o que tem em usuarios e atribui para u
                vcodigo= String.valueOf(u.getCodigo());//pega o que está em u.getCodigo da um String.valueOf e grava em vcodigo
                vnome = String.valueOf(u.getNome());//pega o que está em u.u.getNome da um String.valueOf e grava em vnome
                vemail = String.valueOf(u.getEmail());//pega o que está em u.getEmail da um String.valueOf e grava em vemail
        %>
        <tr>
            <th scope="row"><%=vcodigo%></th><!-- imprime o valor de vcodigo -->
            <td><%=vnome%></td><!-- imprime o valor de vnome -->
            <td><%=vemail%></td><!-- imprime o valor de vemail -->
            <td><a href="ServletBuscar?codigo=<%=vcodigo%>" >Alterar</a></td>
            <td><!-- atribui para o paramêtro codigo da ServletDeletar o valor do vcodigo -->
                <a href="ServletDeletar?codigo=<%=vcodigo%>" onclick="return confirm('Confirma exclusão do registro <%=vnome%>?')">excluir </a><!--onclick vai retornar uma confirmação com o nome do usuario para exclusão  -->   
            </td>
        </tr>
        <%}
        %>
        </table>
</html>