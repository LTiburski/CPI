<%-- 
    Document   : categoria
    Created on : 02/10/2017, 11:33:45
    Author     : Desenvolvimento
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="login" class="br.com.solutionsource.dirceu.login.Login" scope="session"/>
<jsp:useBean id="catRN" class="br.com.solutionsource.dirceu.instituicao_categoria.InstituicaoCategoriaRN" scope="session"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (login.isLogado()) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../../template/imports.jsp" />
        <script src="../../recursos/js/instituicao_categoria.js"></script>
        <link href="../../recursos/css/categoria.css" rel="stylesheet" type="text/css"/>
        <title>Categoria</title>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    </head>
    <body>
        <div id="wrapper">
            <div id="page-wrapper">
                <jsp:include page="../../template/menu.jsp" />
                <div class="col-lg-10 col-centered">
                    <div class="row">
                        <div class="page-header">
                            <h3><span class="fa fa-tags fa-fw"></span> Cadastro de Categorias</h3>
                            <ol class="breadcrumb">
                                <li class="active">
                                    <i class="fa fa-fw fa-university"></i>Instituições / <b>Categorias</b>
                                </li>
                            </ol>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <form class="form-horizontal" id="form_categoria">
                                <input name="acao" type="hidden" value="cadastrar_categoria">
                                <div class="row">
                                    <div class="form-group">
                                        <label for="categoria" class="control-label col-lg-3">Adicionar Categoria: </label>
                                        <div class="col-lg-4">
                                            <input type="text" name="categoria" id="categoria" class="form-control" placeholder="Descrição da categoria">
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="submit" class="btn btn-green">
                                                Gravar
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="row">
                        <div id="container_tbl_categorias">
                            <table class="table table-bordered table-responsive table-hover">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Descrição</th>
                                    </tr>
                                </thead>
                                <tbody id="conteudo_tabela">
                                    <c:forEach var="cat" items="${catRN.retornaLista()}">
                                        <tr value="${cat.categoria}" style="cursor: pointer;">
                                            <td style="width: 100px;">${cat.id}</td>
                                            <td>${cat.categoria}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="modal fade" role="dialog" id="modal_categoria">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h3><i class="fa fa-tag" aria-hidden="true"></i> Edição de Categoria</h3>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label for="edit_categoria">Descrição</label>
                                                <input type="text" name="edit_categoria" id="edit_categoria" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <button class="btn-padrao btn-green" id="btn_salvar">
                                                Gravar
                                            </button>
                                        </div>
                                    </div>
                                </div>
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
