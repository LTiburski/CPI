/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.solutionsource.dirceu.login;

import br.com.solutionsource.dirceu.db.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Desenvolvimento
 */
public class LoginDAO {

    public LoginDAO() {
    }

    public Login checaLogin(String email, String senha) throws SQLException {
        Connection conexao = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM usuarios WHERE email = ? AND senha = MD5(?)";

        try {
            conexao = Database.getInstance().getConnection();
            ps = conexao.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, senha);
            rs = ps.executeQuery();

            if (rs.next()) {
                Login retorno = new Login();
                retorno.setEmail(rs.getString("email"));
                retorno.setPerfil(rs.getInt("perfil"));
                retorno.setId_usuario(rs.getInt("idusuarios"));
                return retorno;
            }
        } catch (Exception ex) {
            System.out.println("[LoginDAO] checaLogin: " + ex.toString());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conexao != null) {
                conexao.close();
            }
        }
        return null;
    }

    public boolean insereUsuario(Login usuario) throws SQLException {
        Connection conexao = null;
        PreparedStatement ps = null;

        String sql = "INSERT INTO usuarios (email, senha, perfil) VALUES (?, MD5(?), ?)";

        try {
            conexao = Database.getInstance().getConnection();
            ps = conexao.prepareStatement(sql);
            ps.setString(1, usuario.getEmail());
            ps.setString(2, usuario.getSenha());
            ps.setInt(3, usuario.getPerfil());
            ps.execute();

            return true;
        } catch (Exception ex) {
            System.out.println("[LoginDAO] insereUsuario: " + ex.toString());
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conexao != null) {
                conexao.close();
            }
        }
        return false;
    }

    public ResultSet checaEmailExistente(String email) throws SQLException {
        Connection conexao = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT email FROM usuarios WHERE email = ?";

        try {
            conexao = Database.getInstance().getConnection();
            ps = conexao.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs;
            }
        } catch (Exception ex) {
            System.out.println("[LoginDAO] checaEmailExistente: " + ex.toString());
        } finally {
            if (rs != null){
                rs.close();
            }
            if (ps != null){
                ps.close();
            }
            if (conexao != null){
                conexao.close();
            }
        }
        return null;
    }
}
