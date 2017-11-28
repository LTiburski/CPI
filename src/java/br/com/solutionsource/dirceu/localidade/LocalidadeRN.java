/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.solutionsource.dirceu.localidade;

import java.util.ArrayList;

/**
 *
 * @author Desenvolvimento
 */
public class LocalidadeRN {

    LocalidadeDAO lDAO = new LocalidadeDAO();

    public ArrayList<Estado> listaEstados() {
        return lDAO.listaEstados();
    }

    public String listaCidades(int id_uf) {
        try {
            ArrayList<Cidade> result = lDAO.listaCidades(id_uf);
            StringBuilder retorno = new StringBuilder();
            if (result.size() > 0) {
                for (Cidade c : result) {
                    retorno.append("<option value=\"").append(c.getId()).append("\">").append(c.getNome()).append("</option>");
                }
                return retorno.toString();
            }
        } catch (Exception ex) {
            System.out.println("[LocalidadeRN] listaCidades: " + ex.toString());
        }
        return "Não foi possível carregar a lista";
    }

}
