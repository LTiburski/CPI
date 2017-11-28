<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">

    <head>

        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Autenticação - CPI</title>

        <!-- CSS -->
        <jsp:include page="../../template/imports.jsp" />
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="../../recursos/css/form-elements.css">
        <link rel="stylesheet" href="../../recursos/css/login.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>
        <!-- Top content -->
        <div class="top-content">
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>CPI -</strong> Controle de Propina Integrado</h1>
                            <div class="description">
                                <p>
                                    Sistema para controle interno.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                            <div class="form-top">
                                <div class="form-top-left">
                                    <h3>Autenticação</h3>
                                    <p>Preencha seus dados para ter acesso ao sistema:</p>
                                </div>
                                <div class="form-top-right">
                                    <i class="fa fa-lock"></i>
                                </div>
                                <div id="resultado" style="color: red;">

                                </div>
                            </div>
                            <div class="form-bottom">
                                <form role="form_login" id="form_login" action="" method="POST" class="login-form">
                                    <div class="form-group">
                                        <label class="sr-only" for="email">Username</label>
                                        <input type="text" name="email" placeholder="Email" class="form-username form-control" id="form-username">
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="senha">Password</label>
                                        <input type="password" name="senha" placeholder="Senha" class="form-password form-control" id="form-password">
                                    </div>
                                    <button type="submit" class="btn">Entrar!</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 social-login">
                            <h3>...ou entre utilizando sua rede social:</h3>
                            <div class="social-login-buttons">
                                <a class="btn btn-link-2" href="#">
                                    <i class="fa fa-facebook"></i> Facebook
                                </a>
                                <a class="btn btn-link-2" href="#">
                                    <i class="fa fa-twitter"></i> Twitter
                                </a>
                                <a class="btn btn-link-2" href="#">
                                    <i class="fa fa-google-plus"></i> Google Plus
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Javascript -->
        <script src="../../recursos/js/login.js"></script>
        <script src="../../recursos/js/jquery.backstretch.min.js"></script>

        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->
    </body>
</html>