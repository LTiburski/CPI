<%-- 
    Document   : gestor
    Created on : 01/10/2017, 22:12:02
    Author     : Lucas Fernando
--%>
<jsp:useBean id="login" class="br.com.solutionsource.dirceu.login.Login" scope="session"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (login.isLogado()) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../../template/imports.jsp" />
        <script src="../../recursos/js/gestor.js" type="text/javascript"></script>
        <title>Gestor</title>
    </head>
    <body>
        <div id="wrapper">
            <div id="page-wrapper">
                <jsp:include page="../../template/menu.jsp" />
                <div class="col-md-10 col-centered">
                    <form id="form_gestor">
                        <input type="hidden" value="cadastrar" name="acao">
                        <div class="row">
                            <div class="page-header">
                                <h3><span class="fa fa-users fa-fw"></span> Novo Gestor</h3>
                                <ol class="breadcrumb">
                                    <li class="active">
                                        <i class="fa fa-fw fa-wrench"></i>Administrativo / <b>Novo Gestor</b>
                                    </li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2">
                                <div class="radio">
                                    <label><input type="radio" name="situacao" value="Ativo" checked>Ativo</label>
                                    <label><input type="radio" name="situacao" value="Inativo">Inativo</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="nome">Nome*</label>
                                    <input type="text" name="nome" class="form-control">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="apelido">Apelido</label>
                                    <input type="text" name="apelido" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="cpf">CPF*</label>
                                    <input type="text" id="cpf" name="cpf" class="form-control">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="rg">RG*</label>
                                    <input type="text" id="rg" name="rg" class="form-control">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="cargo">Cargo*</label>
                                    <input type="text" name="cargo" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="obs">Observações</label>
                                    <textarea rows="5" name="obs" class="form-control" style="resize: none;"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2">
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
    </body>
</html>
<%
    } else {
        response.sendRedirect("/ProjetoDirceu/views/login/login.jsp");
    }
%>
