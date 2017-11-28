/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.solutionsource.dirceu.localidade;

import br.com.solutionsource.dirceu.db.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Desenvolvimento
 */
public class LocalidadeDAO {

    public LocalidadeDAO() {
    }

    public ArrayList<Estado> listaEstados() {
        Connection conexao = null;
        Statement st = null;
        ResultSet rs = null;

        String sql = "SELECT Id, uf FROM estado";

        try {
            conexao = Database.getInstance().getConnection();
            st = conexao.createStatement();
            rs = st.executeQuery(sql);

            if (rs.isBeforeFirst()) {
                ArrayList<Estado> resultado = new ArrayList<>();
                while (rs.next()) {
                    Estado e = new Estado();
                    e.setId(rs.getInt("id"));
                    e.setUf(rs.getString("uf"));

                    resultado.add(e);
                }
                return resultado;
            }
        } catch (Exception ex) {
            System.out.println("[LocalidadeDAO] listaEstados: " + ex.toString());
        }
        return null;
    }

    public ArrayList<Cidade> listaCidades(int id_uf) throws SQLException {
        Connection conexao = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT Id, nome FROM cidade ";

        if (id_uf != 0) {
            sql = sql + "WHERE estado = ?";
        }

        try {
            conexao = Database.getInstance().getConnection();
            ps = conexao.prepareStatement(sql);

            if (id_uf != 0) {
                ps.setInt(1, id_uf);
            }

            rs = ps.executeQuery();

            if (rs.isBeforeFirst()) {
                ArrayList<Cidade> resultado = new ArrayList<>();
                while (rs.next()) {
                    Cidade c = new Cidade();
                    c.setId(rs.getInt("id"));
                    c.setNome(rs.getString("nome"));
                    resultado.add(c);
                }
                return resultado;
            }
        } catch (Exception ex) {
            System.out.println("[LocalidadeDAO] listaCidades: " + ex.toString());
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
