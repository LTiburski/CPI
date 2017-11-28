/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.solutionsource.dirceu.gestores;

import br.com.solutionsource.dirceu.util.Util;

/**
 *
 * @author Lucas Fernando
 */
public class Gestor {
    private int id;
    private String nome;
    private String apelido;
    private String cpf;
    private String rg;
    private String situacao;
    private String cargo;
    private String obs;
    
    Util util = new Util();
    
    public String getApelido() {
        return apelido;
    }

    public void setApelido(String apelido) {
        this.apelido = apelido;
    }

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

    public String getCpf() {
        return util.removePontuacao(cpf);
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getRg() {
        return util.removePontuacao(rg);
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public String getSituacao() {
        return situacao;
    }

    public void setSituacao(String situacao) {
        this.situacao = situacao;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getObs() {
        return obs;
    }

    public void setObs(String obs) {
        this.obs = obs;
    }
    
    
}
