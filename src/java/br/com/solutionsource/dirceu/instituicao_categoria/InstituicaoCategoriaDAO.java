/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.solutionsource.dirceu.instituicao_categoria;

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
public class InstituicaoCategoriaDAO {

    public InstituicaoCategoriaDAO() {
    }

    public ArrayList listaCategorias() throws SQLException {
        Connection conexao = null;
        Statement st = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM instituicoes_categorias";

        try {
            conexao = Database.getInstance().getConnection();
            st = conexao.createStatement();
            rs = st.executeQuery(sql);

            if (rs.isBeforeFirst()) {
                ArrayList<InstituicaoCategoria> retorno = new ArrayList<>();
                while (rs.next()) {
                    InstituicaoCategoria cat = new InstituicaoCategoria();
                    cat.setId(rs.getInt("id"));
                    cat.setCategoria(rs.getString("categoria"));
                    retorno.add(cat);
                }
                return retorno;
            }
        } catch (Exception ex) {
            System.out.println("[InstituicaoCategoriaDAO] listaCategorias: " + ex.toString());
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (st != null) {
                st.close();
            }
            if (conexao != null) {
                conexao.close();
            }
        }
        return null;
    }

    public boolean insereCategoria(InstituicaoCategoria categoria) throws SQLException {
        Connection conexao = null;
        PreparedStatement ps = null;

        String sql = "INSERT INTO instituicoes_categorias (categoria) VALUES (?)";

        try {
            conexao = Database.getInstance().getConnection();
            ps = conexao.prepareStatement(sql);
            ps.setString(1, categoria.getCategoria());
            ps.execute();
            return true;
        } catch (Exception ex) {
            System.out.println("[InstituicaoCategoriaDAO] insereCategoria: " + ex.toString());
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

    public boolean editaCategoria(InstituicaoCategoria categoria) throws SQLException {
        Connection conexao = null;
        PreparedStatement ps = null;

        String sql = "UPDATE instituicoes_categorias SET categoria = ? WHERE id = ?";

        try {
            conexao = Database.getInstance().getConnection();
            ps = conexao.prepareStatement(sql);
            ps.setString(1, categoria.getCategoria());
            ps.setInt(2, categoria.getId());
            ps.execute();
            return true;
        } catch (Exception ex) {
            System.out.println("[InstituicaoCategoriaDAO] editaCategoria: " + ex.toString());
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

    public ResultSet buscaPorNome(String categoria) throws SQLException {
        Connection conexao = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM instituicoes_categorias WHERE categoria = ?";

        try {
            conexao = Database.getInstance().getConnection();
            ps = conexao.prepareStatement(sql);
            ps.setString(1, categoria);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs;
            }
        } catch (Exception ex) {
            System.out.println("[InstituicaoCategoria] buscaPorNome: " + ex.toString());
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
}
