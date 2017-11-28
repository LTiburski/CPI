/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.solutionsource.dirceu.localidade;

/**
 *
 * @author Desenvolvimento
 */
public class Cidade {
    
    private int id;
    private String nome;
    private int uf;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getUf() {
        return uf;
    }

    public void setUf(int uf) {
        this.uf = uf;
    }
}
