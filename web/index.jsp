<%-- 
    Document   : index
    Created on : 30/08/2017, 11:21:02
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
        <title>Index</title>
        <link href="recursos/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="recursos/css/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
        <link href="recursos/css/sb-admin.css" rel="stylesheet" type="text/css"/>
        <link href="recursos/css/morris.css" rel="stylesheet" type="text/css"/>
        <link href="recursos/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="recursos/css/noty.css" rel="stylesheet" type="text/css"/>

        <script src="recursos/js/jquery-3.1.1.min.js" type="text/javascript"></script>
        <script src="recursos/js/jquery-ui.min.js" type="text/javascript"></script>
        <script src="recursos/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="recursos/js/morris/raphael.min.js" type="text/javascript"></script>
        <script src="recursos/js/morris/morris.min.js" type="text/javascript"></script>
        <script src="recursos/js/morris/morris-data.js" type="text/javascript"></script>
        <script src="recursos/js/jquery.validate.js" type="text/javascript"></script>
        <script src="recursos/js/noty.min.js" type="text/javascript"></script>
        <script src="recursos/js/jquery.mask.min.js" type="text/javascript"></script>
        <script src="recursos/js/mapa-instituicoes.js" type="text/javascript"></script>


        <!-- Font Awesome -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" 
              integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="template/menu.jsp" />
            <div id="page-wrapper">
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <div class="row">
                        <div class="col-lg-12">
                            <h3 class="page-header">
                                Painel Principal <small>Estatísticas</small>
                            </h3>
                        </div>
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="alert alert-info alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                <i class="fa fa-info-circle"></i>  <strong>Atenção!</strong> Existem novas atualizações a serem vistas!
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> Movimento Mensal</h3>
                                </div>
                                <div class="panel-body">
                                    <div id="bar"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-map fa-fw"></i> Mapa de Instituições</h3>
                                </div>
                                <div class="form-group">
                                    <div id="map_instituicoes" style="height: 362px"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <script async defer
                            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDYSJ8v9gmAv7hHex4xiW4QAn_-RuEsEa8&callback=initMap">
                    </script>
                    <!-- /.row -->

                    <div class="row">
                        <div class="col-lg-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-long-arrow-right fa-fw"></i> Top 3 Instituições (semanal)</h3>
                                </div>
                                <div class="panel-body">
                                    <div id="morris-donut-chart"></div>
                                    <div class="text-right">
                                        <a href="#">Ver Detalhes <i class="fa fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-clock-o fa-fw"></i> Registro de Atividades</h3>
                                </div>
                                <div class="panel-body">
                                    <div class="list-group">
                                        <a href="#" class="list-group-item">
                                            <span class="badge">menos de um minuto atrás</span>
                                            <i class="fa fa-fw fa-usd"></i> Boleto gerado
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <span class="badge">4 minutos atrás</span>
                                            <i class="fa fa-fw fa-wrench"></i> Usuário cadastrado
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <span class="badge">23 minutos atrás</span>
                                            <i class="fa fa-fw fa-usd"></i> Arquivo de Retorno adicionado
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <span class="badge">46 minutos atrás</span>
                                            <i class="fa fa-fw fa-smile-o"></i> Cadastro de pessoa alterado
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <span class="badge">1 hora atrás</span>
                                            <i class="fa fa-fw fa-user"></i> Gestor adicionado
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <span class="badge">2 horas atrás</span>
                                            <i class="fa fa-fw fa-check"></i> Procedimento finalizado
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <span class="badge">Ontem</span>
                                            <i class="fa fa-fw fa-globe"></i> Backup geral realizado
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <span class="badge">2 dias atrás</span>
                                            <i class="fa fa-fw fa-university"></i> Instituição cadastrada
                                        </a>
                                    </div>
                                    <div class="text-right">
                                        <a href="#">Ver todas as atividades <i class="fa fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> Movimento por Instituições</h3>
                                </div>
                                <div class="panel-body">
                                    <div id="morris-area-chart"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->
        </div>
        <!-- /#wrapper -->
    </body>
</html>
<%
    } else {
        response.sendRedirect("/ProjetoDirceu/views/login/login.jsp");
    }
%>
