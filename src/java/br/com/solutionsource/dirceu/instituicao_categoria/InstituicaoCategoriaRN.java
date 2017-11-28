/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.solutionsource.dirceu.instituicao_categoria;

import com.google.gson.Gson;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Desenvolvimento
 */
public class InstituicaoCategoriaRN {

    InstituicaoCategoriaDAO categoriaDAO = new InstituicaoCategoriaDAO();

    public ArrayList<InstituicaoCategoria> retornaLista() {
        try {
            return categoriaDAO.listaCategorias();
        } catch (Exception ex) {
            System.out.println("[InstituicaoCategoriaRN] retornaLista: " + ex.toString());
        }
        return null;
    }

    public String insereCategoria(InstituicaoCategoria categoria) {
        try {
            if (categoriaDAO.insereCategoria(categoria)) {
                return "Categoria cadastrada com sucesso!";
            }
        } catch (Exception ex) {
            System.out.println("[InstituicaoCategoriaRN] insereCategoria: " + ex.toString());
        }
        return "Ocorreu um problema ao tentar salvar o registro!";
    }

    public String editaCategoria(InstituicaoCategoria icat) {
        if (checaCategoriaExistente(icat.getCategoria())) {
            try {
                if (categoriaDAO.editaCategoria(icat)) {
                    return "Cadastro alterado com sucesso!";
                }
            } catch (Exception ex) {
                System.out.println("[InstituicaoCategoriaRN] editaCategoria: " + ex.toString());
            }
            return "Ocorreu um problema ao tentar salvar o registro!";
        } else {
            return "Categoria já existente!";
        }
    }

    public boolean checaCategoriaExistente(String categoria) {
        try {
            if (categoriaDAO.buscaPorNome(categoria) != null) {
                return false;
            }
        } catch (Exception ex) {
            System.out.println("[InstituicaoCategoriaRN] checaCategoriaExistente: " + ex.toString());
        }
        return true;
    }

    public String retornaCategoriasJSON(String categoria) {
        try {
            ResultSet r = categoriaDAO.buscaPorNome(categoria);
            if (r != null) {
                ArrayList<InstituicaoCategoria> resultado = new ArrayList<>();
                InstituicaoCategoria iCat = new InstituicaoCategoria();
                iCat.setId(r.getInt("id"));
                iCat.setCategoria(r.getString("categoria"));
                resultado.add(iCat);
                Gson gson = new Gson();
                return gson.toJson(resultado);
            }
        } catch (Exception ex) {
            System.out.println("[InstituicaoCategoriaRN] retornaCategoriaJSON: " + ex.toString());
        }
        return null;
    }
}
