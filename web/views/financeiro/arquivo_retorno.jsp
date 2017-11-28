<%-- 
    Document   : arquivo_retorno
    Created on : 01/10/2017, 10:46:57
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
        <title>Arquivo de Retorno</title>
    </head>
    <body>
        <div id="wrapper">
            <div id="page-wrapper">
                <jsp:include page="../../template/menu.jsp" />
                <div class="col-md-10 col-centered">
                    <div class="row">
                        <div class="page-header">
                            <h3><span class="fa fa-file-text fa-fw"></span> Arquivos de Retorno</h3>
                            <ol class="breadcrumb">
                                <li class="active">
                                    <i class="fa fa-fw fa-usd"></i>Financeiro / <b>Arquivos de Retorno</b>
                                </li>
                            </ol>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-7 col-centered">
                            <div class="form-group">
                                <div class="alert alert-info" role="alert">
                                    <b>Instruções:</b><br>
                                    - Faça download do arquivo de retorno diretamente do site do seu banco.<br>
                                    - Escolha o arquivo e clique em "Upload"
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-centered">
                            <div class="form-group">
                                <b>Selecione o arquivo</b> <input type="file" name="file" class="form-">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-2 col-lg-offset-3">
                            <div class="form-group">
                                <button type="button" class="btn btn-green">
                                    Upload
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <h4>Arquivos Registrados</h4>
                        <div class="col-lg-12">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    tr000000002.ret <span class="badge"><i class="fa fa-check" aria-hidden="true"></i> 01 de Setembro de 2017 - 11:03</span>
                                </li>
                                <li class="list-group-item list-group-item-danger">
                                    tr000000018.ret <span class="badge"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Arquivo corrompido</span>
                                </li>
                                <li class="list-group-item">tr000000094.ret <span class="badge"> <i class="fa fa-check" aria-hidden="true"></i> 03 de Março de 2017 - 15:00</span></li>
                            </ul>
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
