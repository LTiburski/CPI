<%-- 
    Document   : lista
    Created on : 28/08/2017, 16:46:37
    Author     : Desenvolvimento
--%>
<jsp:useBean id="login" class="br.com.solutionsource.dirceu.login.Login" scope="session"/>
<jsp:useBean id="pRN" class="br.com.solutionsource.dirceu.pessoa.PessoaRN" scope="request"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (login.isLogado()) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../../template/imports.jsp" />
        <title>Pessoas</title>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <link href="../../recursos/css/lista_pessoas.css" rel="stylesheet" type="text/css"/>
        <script src="../../recursos/js/lista_pessoa.js" type="text/javascript"></script>
    </head>
    <body>
        <div id="wrapper">
            <div id="page-wrapper">
                <div class="container-fluid" id="conteudo">
                    <jsp:include page="../../template/menu.jsp" />
                    <div class="col-md-10 col-centered">
                        <div class="row">
                            <div class="page-header">
                                <h3><span class="fa fa-user fa-fw"></span> Pessoas</h3>
                                <ol class="breadcrumb">
                                    <li class="active">
                                        <i class="fa fa-fw fa-smile-o"></i>Pessoas / <b>Lista de Pessoas</b>
                                    </li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="pesquisa_situacao">Situação</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-search" aria-hidden="true"></i></span>
                                        <select name="pesquisa_situacao" class="form-control input-sm pesquisa" id="pesquisa_situacao">
                                            <option value=""></option>
                                            <option value="Ativo">Ativo</option>
                                            <option value="Inativo">Inativo</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <label for="pesquisa_id">Id</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-search" aria-hidden="true"></i></span>
                                    <input type="number" name="pesquisa_id" id="pesquisa_id" class="form-control input-sm pesquisa">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <label for="pesquisa_cpf">CPF</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-search" aria-hidden="true"></i></span>
                                    <input type="text" name="pesquisa_cpf" id="pesquisa_cpf" class="form-control input-sm pesquisa">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label for="pesquisa_nome">Nome</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-search" aria-hidden="true"></i></span>
                                    <input type="text" name="pesquisa_nome" id="pesquisa_nome" class="form-control input-sm pesquisa">
                                </div>
                            </div>
                        </div>
                        <div id="container_tbl_pessoa">
                            <table class="table table-bordered table-responsive table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Situação</th>
                                        <th>CPF</th>
                                        <th>Nome</th>
                                        <th>UF</th>
                                        <th>Cidade</th>
                                    </tr>
                                </thead>
                                <tbody id="conteudo_tabela">
                                    <c:forEach var="i" items="${pRN.listaPessoas(login.id_usuario)}">
                                        <tr value="${i.id}" style="cursor: pointer;">
                                            <td>${i.id}</td>
                                            <td>${i.situacao}</td>
                                            <td>${i.cpf}</td>
                                            <td>${i.nome}</td>
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