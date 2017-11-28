/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.solutionsource.dirceu.pessoa;

import br.com.solutionsource.dirceu.util.Util;
import java.util.Date;

/**
 *
 * @author Desenvolvimento
 */
public class Pessoa {
    
    private int id;
    private Date data_cadastro;
    private String situacao;
    private String nome = "";
    private String apelido = "";
    private String cpf = "";
    private String logradouro = "";
    private int numero;
    private String complemento = "";
    private String bairro = "";
    private int id_uf;
    private int id_cidade;
    private String nome_uf = "";
    private String nome_cidade = "";
    private String cep = "";
    private String fone_fixo = "";
    private String fone_comercial = "";
    private String email = "";
    private String observacoes = "";
    private int id_usuario;
    
    private Pessoa resultado;
    private int pg;
    private String pesquisa_situacao;
    private int pesquisa_id;
    private String pesquisa_cpf;
    private String pesquisa_nome;

    Util util = new Util();

    public String getPesquisa_situacao() {
        return pesquisa_situacao;
    }

    public void setPesquisa_situacao(String pesquisa_situacao) {
        this.pesquisa_situacao = pesquisa_situacao;
    }

    public int getPesquisa_id() {
        return pesquisa_id;
    }

    public void setPesquisa_id(int pesquisa_id) {
        this.pesquisa_id = pesquisa_id;
    }

    public String getPesquisa_cpf() {
        return pesquisa_cpf;
    }

    public void setPesquisa_cpf(String pesquisa_cpf) {
        this.pesquisa_cpf = pesquisa_cpf;
    }

    public String getPesquisa_nome() {
        return pesquisa_nome;
    }

    public void setPesquisa_nome(String pesquisa_nome) {
        this.pesquisa_nome = pesquisa_nome;
    }

    public int getPg() {
        return pg;
    }

    public void setPg(int pg) {
        this.pg = pg;
    }

    public Pessoa getResultado() {
        return resultado;
    }

    public void setResultado(Pessoa resultado) {
        this.resultado = resultado;
    }

    public String getNome_uf() {
        return nome_uf;
    }

    public void setNome_uf(String nome_uf) {
        this.nome_uf = nome_uf;
    }

    public String getNome_cidade() {
        return nome_cidade;
    }

    public void setNome_cidade(String nome_cidade) {
        this.nome_cidade = nome_cidade;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getData_cadastro() {
        return data_cadastro;
    }

    public void setData_cadastro(Date data_cadastro) {
        this.data_cadastro = data_cadastro;
    }

    public String getSituacao() {
        return situacao;
    }

    public void setSituacao(String situacao) {
        this.situacao = situacao;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getApelido() {
        return apelido;
    }

    public void setApelido(String apelido) {
        this.apelido = apelido;
    }

    public String getCpf() {
        return util.removePontuacao(cpf);
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getLogradouro() {
        return logradouro;
    }

    public void setLogradouro(String logradouro) {
        this.logradouro = logradouro;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public int getId_uf() {
        return id_uf;
    }

    public void setId_uf(int id_uf) {
        this.id_uf = id_uf;
    }

    public int getId_cidade() {
        return id_cidade;
    }

    public void setId_cidade(int id_cidade) {
        this.id_cidade = id_cidade;
    }

    public String getCep() {
        return util.removePontuacao(cep);
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getFone_fixo() {
        return util.removePontuacao(fone_fixo);
    }

    public void setFone_fixo(String fone_fixo) {
        this.fone_fixo = fone_fixo;
    }

    public String getFone_comercial() {
        return util.removePontuacao(fone_comercial);
    }

    public void setFone_comercial(String fone_comercial) {
        this.fone_comercial = fone_comercial;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getObservacoes() {
        return observacoes;
    }

    public void setObservacoes(String observacoes) {
        this.observacoes = observacoes;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }
}
