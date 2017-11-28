/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.solutionsource.dirceu.gestores;

import br.com.solutionsource.dirceu.db.ConexaoDB;
import br.com.solutionsource.dirceu.db.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Lucas Fernando
 */
public class GestorDAO {

    public GestorDAO() {
    }

    public boolean insereGestor(Gestor gestor) throws SQLException {
        Connection conexao = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "INSERT INTO gestores (nome, apelido, cpf, rg, cargo, obs) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            conexao = Database.getInstance().getConnection();
            ps = conexao.prepareStatement(sql);
            ps.setString(1, gestor.getNome());
            ps.setString(2, gestor.getApelido());
            ps.setString(3, gestor.getCpf());
            ps.setString(4, gestor.getRg());
            ps.setString(5, gestor.getCargo());
            ps.setString(6, gestor.getObs());
            ps.execute();

            return true;
        } catch (Exception ex) {
            System.out.println("[GestorDAO] insereGestor: " + ex.toString());
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

    public ResultSet buscaPorCpf(String cpf) throws SQLException {
        Connection conexao = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT cpf FROM gestores WHERE cpf = ?";

        try {
            conexao = Database.getInstance().getConnection();
            ps = conexao.prepareStatement(sql);
            ps.setString(1, cpf);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs;
            }
        } catch (Exception ex) {
            System.out.println("[GestorDAO] buscaPorCpf: " + ex.toString());
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
