<%-- 
    Document   : instituicao
    Created on : 24/08/2017, 10:56:52
    Author     : Desenvolvimento
--%>
<%@page import="br.com.solutionsource.dirceu.instituicao.Instituicao"%>
<jsp:useBean id="inst" class="br.com.solutionsource.dirceu.instituicao.Instituicao" scope="request"/>
<jsp:useBean id="lRN" class="br.com.solutionsource.dirceu.localidade.LocalidadeRN" scope="request"/>
<jsp:useBean id="iRN" class="br.com.solutionsource.dirceu.instituicao.InstituicaoRN" scope="request"/>
<jsp:useBean id="catRN" class="br.com.solutionsource.dirceu.instituicao_categoria.InstituicaoCategoriaRN" scope="request"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="login" class="br.com.solutionsource.dirceu.login.Login" scope="session"/>

<%
    if (login.isLogado()) {
        String cod = request.getParameter("cod");
        if (cod != null && !cod.isEmpty()) {
            inst.setResultado(iRN.selecionaInstituicao(Integer.parseInt(cod)));
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:if test="${inst.resultado.id == null}">
            <title>Nova Instituição</title>
        </c:if>
        <c:if test="${inst.resultado.id != null}">
            <title>Edição de Instituição</title>
        </c:if>
        <jsp:include page="../../template/imports.jsp" />
        <script src="../../recursos/js/nova_instituicao.js" type="text/javascript"></script>
    </head>
    <body>
        <div id="wrapper">
            <div id="page-wrapper">
                <div class="container-fluid" id="conteudo">
                    <jsp:include page="../../template/menu.jsp" />
                    <div class="col-md-10 col-centered">
                        <form id="nova_instituicao">
                            <input type="hidden" value="${inst.resultado.id}" name="id_inst" id="id_inst">
                            <input type="hidden" value="cadastrar" name="acao">
                            <div class="row">
                                <div class="page-header">
                                    <c:if test="${inst.resultado == null}">
                                        <h3><span class="fa fa-university fa-fw"></span> Nova Instituição</h3>
                                        <ol class="breadcrumb">
                                            <li class="active">
                                                <i class="fa fa-fw fa-university"></i>Instituições / <b>Nova Instituição</b>
                                            </li>
                                        </ol>
                                    </c:if>
                                    <c:if test="${inst.resultado != null}">
                                        <h3><span class="fa fa-university fa-fw"></span> Edição: <small>Cód. ${inst.resultado.id} - ${inst.resultado.razao_social} </small></h3>
                                        <ol class="breadcrumb">
                                            <li class="active">
                                                <i class="fa fa-fw fa-university"></i>Instituições / <b>Edição de Instituição</b>
                                            </li>
                                        </ol>
                                    </c:if>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-5 col-centered">
                                    <div class="alert alert-info">
                                        <p><b>Instruções</b></p>
                                        <p>- Campos marcados com * são de preenchimento obrigatório!</p>
                                        <p>- Verifique todos os dados antes de gravar!</p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="radio">
                                        <c:if test="${inst.resultado.situacao == 'Ativo' || inst.resultado.situacao == null}">
                                            <label><input type="radio" name="situacao" value="Ativo" checked>Ativo</label>
                                            <label><input type="radio" name="situacao" value="Inativo">Inativo</label>
                                            </c:if>
                                            <c:if test="${inst.resultado.situacao == 'Inativo'}">
                                            <label><input type="radio" name="situacao" value="Ativo">Ativo</label>
                                            <label><input type="radio" name="situacao" value="Inativo" checked>Inativo</label>
                                            </c:if>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="cnpj">CNPJ*</label>
                                        <input type="text" name="cnpj" id="cnpj" class="form-control" value="${inst.resultado.cnpj}">
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <label for="razao_social">Razão Social*</label>
                                    <input type="text" name="razao_social" class="form-control" value="${inst.resultado.razao_social}">
                                </div>
                                <div class="col-md-4">
                                    <label for="fantasia">Nome Fantasia*</label>
                                    <input type="text" name="fantasia" class="form-control" value="${inst.resultado.nome_fantasia}">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="categoria">Categoria*</label>
                                        <select name="categoria" class="form-control">
                                            <c:if test="${inst.resultado.id_categoria != 0}">
                                                <option value="${inst.resultado.id_categoria}" selected>${inst.resultado.nome_categoria}</option>
                                            </c:if>
                                            <c:forEach var="cat" items="${catRN.retornaLista()}">
                                                <c:if test="${cat.id != inst.resultado.id_categoria}">
                                                    <option value="${cat.id}">${cat.categoria}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="tipo">Tipo*</label>
                                    <input type="text" name="tipo" class="form-control" value="${inst.resultado.tipo}">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="form-group">
                                        <label for="logradouro">Logradouro*</label>
                                        <input type="text" name="logradouro" id="endereco" class="form-control action-map" value="${inst.resultado.logradouro}">
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <label for="numero">Número*</label>
                                    <input type="number" name="numero" id="numero" class="form-control action-map" value="${inst.resultado.numero}">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-7">
                                    <div class="form-group">
                                        <label for="bairro">Bairro*</label>
                                        <input type="text" name="bairro" class="form-control" value="${inst.resultado.bairro}">
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <label for="complemento">Complemento</label>
                                    <input type="text" name="complemento" class="form-control" value="${inst.resultado.complemento}">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label for="uf">UF*</label>
                                        <select name="uf" id="uf" class="form-control">
                                            <option value="">--</option>
                                            <c:if test="${inst.resultado.id_uf != 0}">
                                                <option value="${inst.resultado.id_uf}" selected>${inst.resultado.nome_uf}</option>
                                            </c:if>
                                            <c:forEach var="e" items="${lRN.listaEstados()}">
                                                <c:if test="${e.id != inst.resultado.id_uf}">
                                                    <option value="${e.id}">${e.uf}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="cidade">Cidade*</label>
                                    <select class="form-control" name="cidade" id="cidade">
                                        <c:if test="${inst.resultado.id_cidade != 0}">
                                            <option value="${inst.resultado.id_cidade}" selected>${inst.resultado.nome_cidade}</option>
                                        </c:if>
                                        <option value="">Escolha um estado</option>
                                    </select>
                                </div>
                                <div class="col-md-2">
                                    <label for="latitude">Latitude*</label>
                                    <input type="number" name="lat" id="latitude" class="form-control" value="${inst.resultado.latitude}" readonly="true">
                                </div>
                                <div class="col-md-2">
                                    <label for="longitude">Longitude*</label>
                                    <input type="number" name="long" id="longitude" class="form-control" value="${inst.resultado.longitude}" readonly="true">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label for="fone">Telefone</label>
                                        <input type="text" name="fone" class="form-control tel" value="${inst.resultado.telefone}">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="email">Email</label>
                                    <input type="text" name="email" class="form-control" value="${inst.resultado.email}">
                                </div>
                                <div class="col-md-4">
                                    <label for="site">Site</label>
                                    <input type="text" name="site" class="form-control" value="${inst.resultado.site}">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="obs">Observações</label>
                                        <textarea name="obs" class="form-control" rows="5" style="resize: none;">${inst.resultado.observacoes}</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div id="map" style="height: 400px;"></div>
                                    </div>
                                </div>
                            </div>
                            <script async defer
                                    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDYSJ8v9gmAv7hHex4xiW4QAn_-RuEsEa8&callback=initMap">
                            </script>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <button type="submit" class="btn-padrao btn-green">
                                            Gravar
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<%    } else {
        response.sendRedirect("/ProjetoDirceu/views/login/login.jsp");
    }
%>