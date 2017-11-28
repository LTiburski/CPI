<%-- 
    Document   : mapa-instituicoes
    Created on : 14/09/2017, 14:17:44
    Author     : Desenvolvimento
--%>
<jsp:useBean id="login" class="br.com.solutionsource.dirceu.login.Login" scope="session"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (login.isLogado()) {
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mapa de Instituições</title>
        <jsp:include page="../../template/imports.jsp" />
        <script src="../../recursos/js/mapa-instituicoes.js" type="text/javascript"></script>
    </head>
    <body>
        <div id="wrapper">
            <div id="page-wrapper">
                <div class="container-fluid" id="conteudo">
                    <jsp:include page="../../template/menu.jsp" />
                    <div class="col-md-10 col-centered">
                        <div class="row">
                            <div class="page-header">
                                <h3><span class="fa fa-map-marker fa-fw"></span> Mapa de Instituições</h3>
                                <ol class="breadcrumb">
                                    <li class="active">
                                        <i class="fa fa-fw fa-university"></i>Instituições / <b>Mapa de Instituições</b>
                                    </li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div id="map_instituicoes" style="height: 600px"></div>
                                </div>
                            </div>
                        </div>
                        <script async defer
                                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDYSJ8v9gmAv7hHex4xiW4QAn_-RuEsEa8&callback=initMap">
                        </script>
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
