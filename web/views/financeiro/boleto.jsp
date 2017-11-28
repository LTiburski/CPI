<%-- 
    Document   : boleto
    Created on : 02/10/2017, 09:35:00
    Author     : Desenvolvimento
--%>

<jsp:useBean id="login" class="br.com.solutionsource.dirceu.login.Login" scope="session"/>
<jsp:useBean id="pRN" class="br.com.solutionsource.dirceu.pessoa.PessoaRN" scope="session"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (login.isLogado()) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../../template/imports.jsp" />
        <title>Geração de Boleto</title>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    </head>
    <body>
        <div id="wrapper">
            <div id="page-wrapper">
                <jsp:include page="../../template/menu.jsp" />
                <div class="col-lg-10 col-centered">
                    <div class="row">
                        <div class="page-header">
                            <h3><span class="fa fa-file-text fa-fw"></span> Geração de Boleto Bancário</h3>
                            <ol class="breadcrumb">
                                <li class="active">
                                    <i class="fa fa-fw fa-usd"></i>Financeiro / <b>Geração de Boleto</b>
                                </li>
                            </ol>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-7 col-centered">
                            <div class="form-group">
                                <div class="alert alert-info" role="alert">
                                    <b>Instruções:</b><br>
                                    - Escolha a pessoa para quem deseja gerar o boleto<br>
                                    - Defina uma data de vencimento para o boleto<br>
                                    - Clique em "Gerar"
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-centered">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="pessoa">Selecione a pessoa:</label>
                                    <select name="pessoa" class="form-control">
                                        <c:forEach var="p" items="${pRN.listaPessoas()}">
                                            <option value="${p.id}">${p.nome}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-centered">
                            <div class="col-lg-9">
                                <label for="competencia">Competência</label>
                                <select name="competencia" class="form-control">
                                    <option value="01">Janeiro</option>
                                    <option value="02">Fevereiro</option>
                                    <option value="03">Março</option>
                                    <option value="04">Abril</option>
                                    <option value="05">Maio</option>
                                    <option value="06">Junho</option>
                                    <option value="07">Julho</option>
                                    <option value="08">Agosto</option>
                                    <option value="09">Setembro</option>
                                    <option value="10">Outubro</option>
                                    <option value="11">Novembro</option>
                                    <option value="12">Dezembro</option>
                                </select>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="dia">Dia Venc.</label>
                                    <select name="competencia" class="form-control">
                                        <option value="01">01</option>
                                        <option value="02">02</option>
                                        <option value="03">03</option>
                                        <option value="04">04</option>
                                        <option value="05">05</option>
                                        <option value="06">06</option>
                                        <option value="07">07</option>
                                        <option value="08">08</option>
                                        <option value="09">09</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                        <option value="13">13</option>
                                        <option value="14">14</option>
                                        <option value="15">15</option>
                                        <option value="16">16</option>
                                        <option value="17">17</option>
                                        <option value="18">18</option>
                                        <option value="19">19</option>
                                        <option value="20">20</option>
                                        <option value="21">21</option>
                                        <option value="22">22</option>
                                        <option value="23">23</option>
                                        <option value="24">24</option>
                                        <option value="25">25</option>
                                        <option value="26">26</option>
                                        <option value="27">27</option>
                                        <option value="28">28</option>
                                        <option value="29">29</option>
                                        <option value="30">30</option>
                                        <option value="31">31</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-1 col-centered">
                            <div class="form-group">
                                <a href="../../recursos/img/boleto.pdf" target="_blank" class="btn btn-green">
                                    Gerar
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <h4>Últimos boletos gerados</h4>
                        <div class="col-lg-12">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    boleto02102017003.pdf <span class="badge"><i class="fa fa-check" aria-hidden="true"></i> 10 minutos atrás</span>
                                </li>
                                <li class="list-group-item">
                                    boleto02102017002.pdf <span class="badge"><i class="fa fa-check" aria-hidden="true"></i> 2 horas atrás</span>
                                </li>
                                <li class="list-group-item">boleto15092017001.ret <span class="badge"> <i class="fa fa-check" aria-hidden="true"></i> 15 de setembro de 2017</span></li>
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
