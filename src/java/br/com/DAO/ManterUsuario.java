/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.DAO;

import br.com.entidade.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author erikr
 */
public class ManterUsuario extends DAO{
    public void inserirUsuario(Usuario u) throws Exception {
        try{
        abrirBanco();
        String query = "INSERT INTO usuarios(codigo,nome,email)"+ "values(null,?,?)";
        pst = (PreparedStatement) con.prepareStatement(query);
        pst.setString(1, u.getNome());
        pst.setString(2, u.getEmail());
        pst.execute();
        fecharBanco();
        }catch(Exception e){
            System.out.println("Erro: " + e.getMessage());
        }
    }
    
    public ArrayList<Usuario> ListarTudo() throws Exception {//quando o método PesquisarTudo for chamado ele vai criar um ArrayList do tipo Usuario
        ArrayList<Usuario> usuarios = new ArrayList<Usuario>();//usuarios vai ser um objeto do tipo ArrayList<Usuario>
        try {
            abrirBanco();//método da Class DAO que faz a conexão com o BD
            String query = "select * FROM usuarios";//guarda na query o select * FROM usuarios
            pst = (PreparedStatement) con.prepareStatement(query);//PreparedStatement usa a conexão e execulta a query
            ResultSet tr = pst.executeQuery();//pega os dados criptografados que o BD mandou e guarda no ResultSet para deixar legível para o JAVA
            Usuario u;//u é um objeto da Class Usuario 
            while (tr.next()) {//enquanto tr que é o vetor que está com os dados criptografados, tiver um proximo elemento entra no loop
                u = new Usuario();//instacia o u como uma nova instância da Class Usuario
                u.setCodigo(tr.getInt("codigo"));//no objeto u seta no campo Codigo o que estiver dentro do tr iniciando pela 1° linha e 1° coluna da um getInt na coluna Codigo
                u.setNome(tr.getString("nome"));//no objeto u seta no campo Nome o que estiver dentro do tr iniciando pela 1° linha e 1° coluna da um getString na coluna Nome
                u.setEmail(tr.getString("email"));//no objeto u seta no campo Email o que estiver dentro do tr iniciando pela 1° linha e 1° coluna da um getString na coluna Email
                usuarios.add(u);//adiciona os dados dentro da instância usuarios, que é a lista ou ArrayList do tipo usuario
            }
            fecharBanco();//método que fecha o BD
        } catch (Exception e) {//senão faz o tratamento se houver algum erro
            System.out.println("Erro " + e.getMessage());
        }
        return usuarios;//senão der erro retorna esse vetor ArrayList do tipo Usuario, que é dinâmico para quem pedio para executar o método PesquisarTudo()
    }
    
    public Usuario pesquisar(int id) throws Exception {
        try {
            abrirBanco();
            String query = "select * FROM usuarios where codigo=?";
            pst = (PreparedStatement) con.prepareStatement(query);
            Usuario u = new Usuario();
            pst.setInt(1, id);
            ResultSet tr = pst.executeQuery();
            if (tr.next()) {
                u.setCodigo(tr.getInt("codigo"));
                u.setNome(tr.getString("nome"));
                u.setEmail(tr.getString("email"));
                return u;
            }
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        }
        return null;
    }
    
    public void deletarUsuario(Usuario u) throws Exception {
        abrirBanco();//abre o bd
        String query = "delete from usuarios where codigo=?";//atribui para a variavel query o comando delete com o código, que é o parametro 1
        pst = (PreparedStatement) con.prepareStatement(query);//PreparedStatement leva o comando delete para o bd
        pst.setInt(1, u.getCodigo());//seta no getCodigo do tipo int o valor
        pst.execute();//executa depois da resposta do bd
        fecharBanco();//fecha o bd
    }
    
    public void editarUsuario(Usuario u) throws Exception{
        try{
            abrirBanco();
            String query = "UPDATE usuarios set nome = ?, email = ? where codigo = ?";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setString(1, u.getNome());
            pst.setString(2, u.getEmail());
            pst.setInt(3, u.getCodigo());
            pst.executeUpdate();
            fecharBanco();
        }catch(Exception e){
            System.out.println("Erro "+ e.getMessage());
        }
    }
}
