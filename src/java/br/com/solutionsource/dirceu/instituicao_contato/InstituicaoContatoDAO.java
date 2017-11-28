/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.solutionsource.dirceu.instituicao_contato;

import br.com.solutionsource.dirceu.db.ConexaoDB;
import br.com.solutionsource.dirceu.db.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Desenvolvimento
 */
public class InstituicaoContatoDAO {

    public InstituicaoContatoDAO() {
    }

    public ResultSet buscaInstContato() throws SQLException {
        Connection conexao = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        String sql = "SELECT * FROM instituicoes_contato";

        try {
            conexao = Database.getInstance().getConnection();
            ps = conexao.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                return rs;
            }
        } catch (Exception ex) {
            System.out.println("[InstituicaoContatoDAO] retornaLista: " + ex.toString());
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
