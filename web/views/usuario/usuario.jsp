<%-- 
    Document   : usuario
    Created on : 29/09/2017, 16:43:45
    Author     : Desenvolvimento
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
        <script src="../../recursos/js/novousuario.js" type="text/javascript"></script>
        <title>Novo Usuário - Projeto Dirceu</title>
    </head>
    <body>
        <div id="wrapper">
            <div id="page-wrapper">
                <jsp:include page="../../template/menu.jsp" />
                <div class="col-lg-10 col-centered">
                    <form id="novo_usuario">
                        <input type="hidden" name="acao" value="cadastrar">
                        <div class="row">
                            <div class="page-header">
                                <h3><span class="fa fa-user-plus fa-fw"></span> Novo Usuário</h3>
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
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="text" id="email" name="email" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="senha">Senha</label>
                                    <input type="password" id="senha" name="senha" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="senha2">Repita a senha</label>
                                    <input type="password" name="senha2" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="perfil">Perfil</label>
                                    <select name="perfil" class="form-control">
                                        <option value="1">Usuário</option>
                                        <option value="2">Administrador</option>
                                    </select>
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
