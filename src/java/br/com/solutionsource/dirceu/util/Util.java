/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.solutionsource.dirceu.util;

import com.google.gson.Gson;
import java.util.ArrayList;

/**
 *
 * @author Desenvolvimento
 */
public class Util {

    public String removePontuacao(String texto) {
        if (texto != null) {
            String removido = texto.replaceAll("[-./()']", "").replaceAll(" ", "");
            return removido;
        } else {
            return texto;
        }
    }
    
    public String retornaJSON(ArrayList<Object> r){
        if (r != null){
            Gson gson = new Gson();
            return gson.toJson(r);
        }
        return null;
    }
}
