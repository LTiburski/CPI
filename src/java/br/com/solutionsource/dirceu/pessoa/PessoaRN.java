/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.solutionsource.dirceu.pessoa;

import br.com.solutionsource.dirceu.util.Util;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author Desenvolvimento
 */
public class PessoaRN {

    PessoaDAO pDAO = new PessoaDAO();
    Util util = new Util();

    public String inserePessoa(Pessoa p) {
        try {
            if (pDAO.inserePessoa(p)) {
                return "Pessoa cadastrada com sucesso!";
            }
        } catch (Exception ex) {
        }
        return "Não foi possível completar o cadastro - contate o administrador";
    }

    public Pessoa selecionaPessoa(int id) {
        try {
            return pDAO.selecionaPessoa(id);
        } catch (Exception ex) {
            System.out.println("[PessoaRN] selecionaPessoa: " + ex.toString());
        }
        return null;
    }

    public ArrayList<Pessoa> listaPessoas(int id_usuario) {
        try {
            Pessoa pesquisa = new Pessoa();
            pesquisa.setId_usuario(id_usuario);
            return pDAO.listaPessoas(pesquisa);
        } catch (Exception ex) {
            System.out.println("[PessoaRN] listaPessoas: " + ex.toString());
        }
        return null;
    }

    public String pesquisaPessoa(Pessoa pesquisa) {
        try {
            ArrayList<Pessoa> resultado = pDAO.listaPessoas(pesquisa);
            if (resultado != null) {
                StringBuilder retorno = new StringBuilder();
                for (Pessoa p : resultado) {
                    retorno.append("<tr value=\"").append(p.getId()).append("\" style=\"cursor: pointer;\">");
                    retorno.append("<td>").append(p.getId()).append("</td>");
                    retorno.append("<td>").append(p.getSituacao()).append("</td>");
                    retorno.append("<td>").append(p.getCpf()).append("</td>");
                    retorno.append("<td>").append(p.getNome()).append("</td>");
                    retorno.append("<td>").append(p.getNome_uf()).append("</td>");
                    retorno.append("<td>").append(p.getNome_cidade()).append("</td>");
                    retorno.append("<tr>");
                }
                return retorno.toString();
            }
        } catch (Exception ex) {
            System.out.println("[PessoaRN] resultadoPessoa: " + ex.toString());
        }
        return "";
    }

    public boolean buscaPorCpf(String cpf, Integer id, Integer id_usuario) {
        try {
            if (pDAO.buscaPorCpf(util.removePontuacao(cpf), id, id_usuario) != null) {
                return false;
            }
        } catch (Exception ex) {
        }
        return true;
    }

    public String editaPessoa(Pessoa p) {
        try {
            if (pDAO.editaPessoa(p)) {
                return "Cadastro alterado com sucesso!";
            }
        } catch (Exception ex) {
        }
        return "Ocorreu um problema ao tentar realizar a operação!";
    }

    public void geraTermoAdesao() throws DocumentException, IOException {
        Document doc = new Document(PageSize.A4);
        ByteArrayOutputStream output = new ByteArrayOutputStream();
    }
}
