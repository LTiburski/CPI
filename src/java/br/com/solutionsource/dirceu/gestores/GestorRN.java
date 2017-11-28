/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.solutionsource.dirceu.gestores;

import br.com.solutionsource.dirceu.util.Util;
import java.sql.SQLException;

/**
 *
 * @author Lucas Fernando
 */
public class GestorRN {

    GestorDAO gDAO = new GestorDAO();

    public String insereGestor(Gestor gestor) {
        try {
            if (gDAO.insereGestor(gestor)) {
                return "Gestor cadastrado com sucesso";
            }
        } catch (Exception ex) {
            System.out.println("[GestorRN] insereGestor: " + ex.toString());
        }
        return "Ocorreu um problema ao tentar gravar o registro!";
    }

    public boolean buscaPorCpf(String cpf) throws SQLException {
        Util util = new Util();
        if (gDAO.buscaPorCpf(util.removePontuacao(cpf)) != null) {
            return false;
        } else {
            return true;
        }
    }
}
