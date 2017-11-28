<%-- 
    Document   : lista_instituicoes
    Created on : 25/08/2017, 10:21:29
    Author     : Desenvolvimento
--%>
<jsp:useBean id="login" class="br.com.solutionsource.dirceu.login.Login" scope="session"/>
<jsp:useBean id="iRN" class="br.com.solutionsource.dirceu.instituicao.InstituicaoRN" scope="request"/>
<jsp:useBean id="lRN" class="br.com.solutionsource.dirceu.localidade.LocalidadeRN" scope="request"/>
<%@page import="br.com.solutionsource.dirceu.instituicao.InstituicaoRN"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (login.isLogado()) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../../template/imports.jsp" />
        <title>Instituições</title>
        <script src="../../recursos/js/lista_instituicao.js" type="text/javascript"></script>
        <link href="../../recursos/css/lista_instituicoes.css" rel="stylesheet" type="text/css"/>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    </head>
    <body>
        <div id="wrapper">
            <div id="page-wrapper">
                <div class="container-fluid" id="conteudo">
                    <jsp:include page="../../template/menu.jsp" />
                    <div class="col-md-10 col-centered">
                        <div class="row">
                            <div class="page-header">
                                <h3><span class="fa fa-university fa-fw"></span> Instituições</h3>
                                <ol class="breadcrumb">
                                    <li class="active">
                                        <i class="fa fa-fw fa-university"></i>Instituições / <b>Lista de Instituições</b>
                                    </li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="pesquisa_id">Id</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-search" aria-hidden="true"></i></span>
                                        <input type="number" name="pesquisa_id" id="pesquisa_id" class="form-control input-sm pesquisa">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <label for="pesquisa_cnpj">CNPJ</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-search" aria-hidden="true"></i></span>
                                    <input type="text" name="pesquisa_cnpj" id="pesquisa_cnpj" class="form-control input-sm pesquisa">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <label for="pesquisa_rsocial">Razão Social</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-search" aria-hidden="true"></i></span>
                                    <input type="text" name="pesquisa_rsocial" id="pesquisa_rsocial" class="form-control input-sm pesquisa">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <label for="pesquisa_uf">UF</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-search" aria-hidden="true"></i></span>
                                    <select name="pesquisa_uf" class="form-control input-sm pesquisa" id="pesquisa_uf">
                                        <option value="" selected></option>
                                        <c:forEach var="e" items="${lRN.listaEstados()}">
                                            <option value="${e.id}">${e.uf}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div id="container_tbl_instituicoes">
                            <table class="table table-bordered table-responsive table-hover">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>CNPJ</th>
                                        <th>Razão Social</th>
                                        <th>UF</th>
                                        <th>Cidade</th>
                                    </tr>
                                </thead>
                                <tbody id="conteudo_tabela">
                                    <c:forEach var="i" items="${iRN.retornaLista(login.id_usuario)}">
                                        <tr value="${i.id}" style="cursor: pointer;">
                                            <td id="id">${i.id}</td>
                                            <td>${i.cnpj}</td>
                                            <td>${i.razao_social}</td>
                                            <td>${i.nome_uf}</td>
                                            <td>${i.nome_cidade}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
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
