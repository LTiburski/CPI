<%-- 
    Document   : pessoa
    Created on : 24/08/2017, 16:14:25
    Author     : Desenvolvimento
--%>
<%@page import="br.com.solutionsource.dirceu.pessoa.PessoaRN"%>
<jsp:useBean id="login" class="br.com.solutionsource.dirceu.login.Login" scope="session"/>
<jsp:useBean id="pessoa" class="br.com.solutionsource.dirceu.pessoa.Pessoa" scope="request"/>
<jsp:useBean id="lRN" class="br.com.solutionsource.dirceu.localidade.LocalidadeRN" scope="request"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (login.isLogado()) {
        PessoaRN pRN = new PessoaRN();
        String cod = request.getParameter("cod");
        if (cod != null) {
            pessoa.setResultado(pRN.selecionaPessoa(Integer.parseInt(cod)));
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../../template/imports.jsp" />
        <script src="../../recursos/js/nova_pessoa.js" type="text/javascript"></script>
        <link href="../../recursos/css/pessoa.css" rel="stylesheet" type="text/css"/>
        <title>Pessoa</title>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    </head>
    <body>
        <div id="wrapper">
            <div id="page-wrapper">
                <jsp:include page="../../template/menu.jsp" />
                <div class="col-md-10 col-centered">
                    <form id="nova_pessoa" action="#" method="POST">
                        <input type="hidden" id="id" value="${pessoa.resultado.id}" name="id">
                        <input type="hidden" value="cadastrar" name="acao">
                        <div class="row">
                            <div class="page-header">
                                <c:if test="${pessoa.resultado == null}">
                                    <h3><span class="fa fa-user-plus fa-fw"></span> Nova Pessoa</h3>
                                    <ol class="breadcrumb">
                                        <li class="active">
                                            <i class="fa fa-fw fa-smile-o"></i>Pessoas / <b>Nova Pessoa</b>
                                        </li>
                                    </ol>
                                </c:if>
                                <c:if test="${pessoa.resultado != null}">
                                    <h3><span class="fa fa-user-plus fa-fw"></span> Edição: <small><b>Cód. ${pessoa.resultado.id} - ${pessoa.resultado.nome}</b></small></h3>
                                    <ol class="breadcrumb">
                                        <li class="active">
                                            <i class="fa fa-fw fa-smile-o"></i>Pessoas / <b>Edição de Pessoa</b>
                                        </li>
                                    </ol>
                                </c:if>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <div class="col-lg-12">
                                    <div class="panel panel-default" >
                                        <div class="panel-heading">
                                            <h5 class="panel-title"><i class="fa fa-long-arrow-right fa-fw"></i> Guia Rápida</h5>
                                        </div>
                                        <div class="panel-body">
                                            <div class="col-lg-10 col-centered">
                                                <div class="col-lg-4">
                                                    <a href="../../recursos/img/termo_adesao.pdf" target="_blank">
                                                        <i class="fa fa-print" aria-hidden="true"></i> <b>Termo de Adesão</b>
                                                    </a>
                                                </div>
                                                <div class="col-lg-4">
                                                    <a href="../../recursos/img/boleto.pdf" target="_blank">
                                                        <i class="fa fa-file-text" aria-hidden="true"></i> <b>Boleto Bancário</b>
                                                    </a>
                                                </div>
                                                <c:if test="${pessoa.resultado != null}">
                                                    <div class="col-lg-4">
                                                        <a href="#" target="_blank" data-toggle="modal" data-target="#modal_docs">
                                                            <i class="fa fa-id-card-o" aria-hidden="true"></i> <b>Documentação Necessária</b>
                                                        </a>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-4 col-md-2">
                                    <a href="#" class="thumbnail">
                                        <img src="../../recursos/img/avatar_pessoa.png" alt="Avatar">
                                    </a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="radio">
                                        <c:if test="${pessoa.resultado.situacao == 'Ativo' || pessoa.resultado.situacao == null}">
                                            <label><input type="radio" name="situacao" value="Ativo" checked>Ativo</label>
                                            <label><input type="radio" name="situacao" value="Inativo">Inativo</label>
                                            </c:if>
                                            <c:if test="${pessoa.resultado.situacao == 'Inativo'}">
                                            <label><input type="radio" name="situacao" value="Ativo">Ativo</label>
                                            <label><input type="radio" name="situacao" value="Inativo" checked>Inativo</label>
                                            </c:if>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="cnpj">CPF*</label>
                                        <input type="text" name="cpf" id="cpf" class="form-control" value="${pessoa.resultado.cpf}">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="razao_social">Nome*</label>
                                    <input type="text" name="nome" class="form-control" value="${pessoa.resultado.nome}">
                                </div>
                                <div class="col-md-3">
                                    <label for="fantasia">Apelido</label>
                                    <input type="text" name="apelido" class="form-control" value="${pessoa.resultado.apelido}">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="form-group">
                                        <label for="logradouro">Logradouro*</label>
                                        <input type="text" name="logradouro" class="form-control" value="${pessoa.resultado.logradouro}">
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <label for="numero">Número*</label>
                                    <input type="number" name="numero" class="form-control" value="${pessoa.resultado.numero}">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-7">
                                    <div class="form-group">
                                        <label for="bairro">Bairro*</label>
                                        <input type="text" name="bairro" class="form-control" value="${pessoa.resultado.bairro}">
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <label for="complemento">Complemento</label>
                                    <input type="text" name="complemento" class="form-control" value="${pessoa.resultado.complemento}">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label for="uf">UF*</label>
                                        <select name="uf" id="uf" class="form-control">
                                            <option value="">--</option>
                                            <c:if test="${pessoa.resultado.id_uf != 0}">
                                                <option value="${pessoa.resultado.id_uf}" selected>${pessoa.resultado.nome_uf}</option>
                                            </c:if>
                                            <c:forEach var="e" items="${lRN.listaEstados()}">
                                                <c:if test="${e.id != pessoa.resultado.id_uf}">
                                                    <option value="${e.id}">${e.uf}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <label for="cidade">Cidade*</label>
                                    <select class="form-control" name="cidade" id="cidade">
                                        <c:if test="${pessoa.resultado.id_cidade != 0}">
                                            <option value="${pessoa.resultado.id_cidade}" selected>${pessoa.resultado.nome_cidade}</option>
                                        </c:if>
                                        <option value="">Escolha um estado</option>
                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <label for="cep">CEP*</label>
                                    <input type="text" name="cep" id="cep" class="form-control" value="${pessoa.resultado.cep}}">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="tel">Telefone</label>
                                        <input type="text" name="tel" class="form-control tel" value="${pessoa.resultado.fone_fixo}">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label for="tel_comercial">Telefone Comercial</label>
                                    <input type="text" name="tel_comercial" class="form-control tel" value="${pessoa.resultado.fone_comercial}">
                                </div>
                                <div class="col-md-6">
                                    <label for="email">Email</label>
                                    <input type="text" name="email" class="form-control" value="${pessoa.resultado.email}">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="obs">Observações</label>
                                        <textarea name="obs" class="form-control" rows="5" style="resize: none;">${pessoa.resultado.observacoes}</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <button type="submit" class="btn-padrao btn-green">
                                            Gravar
                                        </button>
                                    </div>
                                </div>
                            </div>
                    </form>
                </div>
                <div class="modal fade" role="dialog" id="modal_docs">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h3><i class="fa fa-id-card-o" aria-hidden="true"></i> Documentação ${pessoa.resultado.apelido}</h3>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <ul class="list-group">
                                                <li class="list-group-item borderless"><b>CPF</b> <span class="badge">Entregue</span> </li>
                                                <li class="list-group-item borderless"><b style="color: #f0ad4e;">RG</b> <span class="badge"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Imagem de baixa resolução</span> </li>
                                                <li class="list-group-item borderless"><b style="color: red;">Carteira de Trabalho</b> <span class="badge">Não entregue</span> </li>
                                                <li class="list-group-item borderless"><b>Carteira de Habilitação</b> <span class="badge">Entregue</span> </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <form action="/ProjetoDirceu/beans/bean_pessoa.jsp?id=${pessoa.resultado.id}&acao=upload" method="POST" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="doc_entregue">Selecione o documento a ser entregue</label>
                                                <select name="doc_entregue" class="form-control input-sm">
                                                    <option value="">RG</option>
                                                    <option vlaue="">Carteira de Trabalho</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <b>Selecione o arquivo</b> <input type="file" name="file">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <input type="submit" value="Upload" class="btn btn-green"/>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<%
    } else {
        response.sendRedirect("/ProjetoDirceu/views/login/login.jsp");
    }
%>
