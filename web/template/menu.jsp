<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Botão de Navegação</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/ProjetoDirceu/index.jsp">CPI - Controle de Propina Integrado</a>
    </div>
    <!-- Top Menu Items -->
    <ul class="nav navbar-right top-nav">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> <b class="caret"></b></a>
            <ul class="dropdown-menu message-dropdown">
                <li class="message-preview">
                    <a href="#">
                        <div class="media">
                            <span class="pull-left">
                                <img class="media-object" src="http://placehold.it/50x50" alt="">
                            </span>
                            <div class="media-body">
                                <h5 class="media-heading"><strong></strong>
                                </h5>
                                <p class="small text-muted"><i class="fa fa-clock-o"></i> Ontem as 14:32</p>
                                <p>Necessidade de novos funcionários!</p>
                            </div>
                        </div>
                    </a>
                </li>
                <li class="message-preview">
                    <a href="#">
                        <div class="media">
                            <span class="pull-left">
                                <img class="media-object" src="http://placehold.it/50x50" alt="">
                            </span>
                            <div class="media-body">
                                <h5 class="media-heading"><strong>Márcio (Instituição 04)</strong>
                                </h5>
                                <p class="small text-muted"><i class="fa fa-clock-o"></i> Ontem às 4:32</p>
                                <p>Agendamento de reunião!</p>
                            </div> 
                        </div>
                    </a>
                </li>
                <li class="message-preview">
                    <a href="#">
                        <div class="media">
                            <span class="pull-left">
                                <img class="media-object" src="http://placehold.it/50x50" alt="">
                            </span>
                            <div class="media-body">
                                <h5 class="media-heading"><strong>Bruno (Instituição 14)</strong>
                                </h5>
                                <p class="small text-muted"><i class="fa fa-clock-o"></i> Há mais de um mês atrás</p>
                                <p>Precisamos avaliar a estrutura (...)</p>
                            </div>
                        </div>
                    </a>
                </li>
                <li class="message-footer">
                    <a href="#">Ler todas as mensagens</a>
                </li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> <b class="caret"></b></a>
            <ul class="dropdown-menu alert-dropdown">
                <li>
                    <a href="#"><span class="label label-danger">2 instituições sem movimento</span></a>
                </li>
                <li>
                    <a href="#"><span class="label label-success">Novas Instituições adicionadas</span></a>
                </li>
                <li>
                    <a href="#"><span class="label label-info">Verifique as novas atualizações</span></a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="#">Ver tudo</a>
                </li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li>
                    <a href="#"><i class="fa fa-fw fa-user"></i> Perfil</a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="/ProjetoDirceu/beans/bean_login.jsp?acao=logout"><i class="fa fa-fw fa-power-off"></i> Sair</a>
                </li>
            </ul>
        </li>
    </ul>
    <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
    <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav side-nav">
            <li class="active">
                <a href="/ProjetoDirceu/index.jsp" class="abre_pg"><i class="fa fa-fw fa-home"></i> Ínicio</a>
            </li>
            <li>
                <a href="javascript:;" data-toggle="collapse" data-target="#menu_pessoa"><i class="fa fa-fw fa-smile-o"></i> Pessoas <i class="fa fa-fw fa-caret-down"></i></a></a>
                <ul id="menu_pessoa" class="collapse">
                    <li>
                        <a href="/ProjetoDirceu/views/pessoa/lista.jsp" class="abre_pg">Lista de Pessoas</a>
                    </li>
                    <li>
                        <a href="/ProjetoDirceu/views/pessoa/pessoa.jsp" class="abre_pg">Nova Pessoa</a>
                    </li>
                    <li>
                        <a href="/ProjetoDirceu/recursos/img/termo_adesao.pdf" target="_blank" class="abre_pg">Termo de Adesão</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;" data-toggle="collapse" data-target="#menu_instituicao"><i class="fa fa-fw fa-university"></i> Instituições <i class="fa fa-fw fa-caret-down"></i></a></a>
                <ul id="menu_instituicao" class="collapse">
                    <li>
                        <a href="/ProjetoDirceu/views/instituicao/lista.jsp" class="abre_pg">Lista de Instituições</a>
                    </li>
                    <li>
                        <a href="/ProjetoDirceu/views/instituicao/instituicao.jsp" class="abre_pg">Nova Instituição</a>
                    </li>
                    <li>
                        <a href="/ProjetoDirceu/views/instituicao/mapa-instituicoes.jsp" class="abre_pg">Mapa de Instituições</a>
                    </li>
                    <li>
                        <a href="/ProjetoDirceu/views/instituicao/categoria.jsp" class="abre_pg">Categorias</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;" data-toggle="collapse" data-target="#menu_financeiro"><i class="fa fa-fw fa-usd"></i> Financeiro <i class="fa fa-fw fa-caret-down"></i></a></a>
                <ul id="menu_financeiro" class="collapse">
                    <li>
                        <a href="/ProjetoDirceu/views/financeiro/arquivo_retorno.jsp" class="abre_pg">Arquivos de Retorno</a>
                    </li>
                    <li>
                        <a href="/ProjetoDirceu/views/financeiro/boleto.jsp" class="abre_pg">Geração de Boleto</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;" data-toggle="collapse" data-target="#menu_usuario"><i class="fa fa-fw fa-wrench"></i> Administrativo <i class="fa fa-fw fa-caret-down"></i></a></a>
                <ul id="menu_usuario" class="collapse">
                    <li>
                        <a href="/ProjetoDirceu/views/usuario/usuario.jsp" class="abre_pg">Novo Usuário</a>
                    </li>
                    <li>
                        <a href="/ProjetoDirceu/views/gestor/gestor.jsp" class="abre_pg">Novo Gestor</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- /.navbar-collapse -->
</nav>