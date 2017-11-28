/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.solutionsource.dirceu.instituicao;

import br.com.solutionsource.dirceu.util.Util;
import com.google.gson.Gson;
import java.util.ArrayList;

/**
 *
 * @author Desenvolvimento
 */
public class InstituicaoRN {

    InstituicaoDAO iDAO = new InstituicaoDAO();
    Util util = new Util();

    public String insereInstituicao(Instituicao i) {
        try {
            if (checaInstituicaoExistente(i.getCnpj(), null, i.getId_usuario())) {
                if (iDAO.insereInstituicao(i)) {
                    return "Instituição cadastrada com sucesso!";
                } else {
                    return "Ocorreu um problema ao tentar cadastrar a instituição!";
                }
            } else {
                return "Instituicao já cadastrada na base de dados!";
            }
        } catch (Exception ex) {
            System.out.println("[InstituicaoRN] checaInstituicaoExistente: " + ex.toString());
            ex.printStackTrace();
        }
        return "Ocorreu um problema ao tentar realizar a operação!";
    }

    public ArrayList<Instituicao> buscaPorCategoria(int categoria) {
        try {
            return iDAO.buscaPorCategoria(categoria);
        } catch (Exception ex) {
            System.out.println("[InstituicaoRN] buscaPorCategoria: " + ex.toString());
        }
        return null;
    }

    public ArrayList<Instituicao> retornaLista(Integer id_usuario) {
        try {
            Instituicao pesquisa = new Instituicao();
            pesquisa.setId_usuario(id_usuario);
            return iDAO.listaInstituicoes(pesquisa);
        } catch (Exception ex) {
            System.out.println("[InstituicaoRN] retornaLista(): " + ex.toString());
        }
        return null;
    }

    public Instituicao selecionaInstituicao(int id) {
        try {
            return iDAO.selecionaInstituicao(id);
        } catch (Exception ex) {
            System.out.println("[InstituicaoDAO] selecionaInstituicao: " + ex.toString());
        }
        return null;
    }

    public boolean checaInstituicaoExistente(String cnpj, Integer id, Integer id_usuario) {
        try {
            if (iDAO.buscaPorCnpj(util.removePontuacao(cnpj), id, id_usuario) != null) {
                return false;
            }
        } catch (Exception ex) {
            System.out.println("[InstituicaoRN] buscaPorCnpj: " + ex.toString());
            ex.printStackTrace();
        }
        return true;
    }

    public String editaInstituicao(Instituicao i) {
        try {
            if (iDAO.edicao(i)) {
                return "Cadastro alterado com sucesso!";
            }
        } catch (Exception ex) {
            System.out.println("[InstituicaoRN] edicao: " + ex.toString());
            ex.printStackTrace();
        }
        return "Ocorreu um problema ao tentar realizar a operação";
    }

    public String resultadoInstituicao(Instituicao pesquisa) {
        try {
            ArrayList<Instituicao> resultado = iDAO.listaInstituicoes(pesquisa);
            if (resultado != null) {
                StringBuilder retorno = new StringBuilder();
                for (Instituicao i : resultado){
                    retorno.append("<tr value=\"").append(i.getId()).append("\" style=\"cursor: pointer;\">");
                    retorno.append("<td>").append(i.getId()).append("</td>");
                    retorno.append("<td>").append(i.getCnpj()).append("</td>");
                    retorno.append("<td>").append(i.getRazao_social()).append("</td>");
                    retorno.append("<td>").append(i.getNome_uf()).append("</td>");
                    retorno.append("<td>").append(i.getNome_cidade()).append("</td>");
                    retorno.append("</tr>");
                }
                return retorno.toString();
            }
        } catch (Exception ex) {
            System.out.println("[InstituicaoRN] resultadoInstituicao: " + ex.toString());
        }
        return "";
    }

    public String retornaJSON() {
        ArrayList<Instituicao> resultado = retornaLista(null);
        Gson gson = new Gson();
        return gson.toJson(resultado);
    }
}
