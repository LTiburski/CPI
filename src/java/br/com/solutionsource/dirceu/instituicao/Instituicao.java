/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.solutionsource.dirceu.instituicao;

import br.com.solutionsource.dirceu.util.Util;

/**
 *
 * @author Desenvolvimento
 */
public class Instituicao {
    private int id;
    private int id_pai;
    private String nome_pai;
    private int id_categoria;
    private String nome_categoria;
    private String tipo = "";
    private String situacao;
    private String razao_social = "";
    private String nome_fantasia = "";
    private String cnpj = "";
    private String logradouro = "";
    private int numero;
    private String complemento = "";
    private String bairro = "";
    private int id_uf;
    private int id_cidade;
    private String nome_uf;
    private String nome_cidade;
    private String latitude = "";
    private String longitude = "";
    private String telefone = "";
    private String email = "";
    private String site = "";
    private String observacoes = "";
    private int id_usuario;
    
    // Variáveis de busca
    private int pg;
    private int pesquisa_id;
    private String pesquisa_cnpj;
    private String pesquisa_rsocial;
    private int pesquisa_uf;
    
    private Instituicao resultado;
    Util util = new Util();

    public int getPesquisa_uf() {
        return pesquisa_uf;
    }

    public void setPesquisa_uf(int pesquisa_uf) {
        this.pesquisa_uf = pesquisa_uf;
    }

    public int getPesquisa_id() {
        return pesquisa_id;
    }

    public void setPesquisa_id(int pesquisa_id) {
        this.pesquisa_id = pesquisa_id;
    }

    public String getPesquisa_cnpj() {
        return pesquisa_cnpj;
    }

    public void setPesquisa_cnpj(String pesquisa_cnpj) {
        this.pesquisa_cnpj = pesquisa_cnpj;
    }

    public String getPesquisa_rsocial() {
        return pesquisa_rsocial;
    }

    public void setPesquisa_rsocial(String pesquisa_rsocial) {
        this.pesquisa_rsocial = pesquisa_rsocial;
    }
    
    public Instituicao getResultado() {
        return resultado;
    }

    public void setResultado(Instituicao resultado) {
        this.resultado = resultado;
    }

    public String getNome_pai() {
        return nome_pai;
    }

    public void setNome_pai(String nome_pai) {
        this.nome_pai = nome_pai;
    }

    public String getNome_categoria() {
        return nome_categoria;
    }

    public void setNome_categoria(String nome_categoria) {
        this.nome_categoria = nome_categoria;
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

    public int getPg() {
        return pg;
    }

    public void setPg(int pg) {
        this.pg = pg;
    }
    
    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_pai() {
        return id_pai;
    }

    public void setId_pai(int id_pai) {
        this.id_pai = id_pai;
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getSituacao() {
        return situacao;
    }

    public void setSituacao(String situacao) {
        this.situacao = situacao;
    }

    public String getRazao_social() {
        return razao_social;
    }

    public void setRazao_social(String razao_social) {
        this.razao_social = razao_social;
    }

    public String getNome_fantasia() {
        return nome_fantasia;
    }

    public void setNome_fantasia(String nome_fantasia) {
        this.nome_fantasia = nome_fantasia;
    }

    public String getCnpj() {
        return util.removePontuacao(cnpj);
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
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

    public String getTelefone() {
        return util.removePontuacao(telefone);
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
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
