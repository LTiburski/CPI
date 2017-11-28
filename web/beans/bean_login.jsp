<%@page import="br.com.solutionsource.dirceu.login.Login"%>
<%@page import="br.com.solutionsource.dirceu.login.LoginRN"%>
<jsp:useBean id="login" class="br.com.solutionsource.dirceu.login.Login" scope="session"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String acao = request.getParameter("acao");

    if (acao != null && acao.equals("logout")) {
        session.invalidate();
        response.sendRedirect("/ProjetoDirceu/views/login/login.jsp");
    }

    String email = request.getParameter("email");
    String senha = request.getParameter("senha");

    if (email != null && !email.isEmpty() && senha != null && !senha.isEmpty()) {
        LoginRN loginRN = new LoginRN();
        Login resultado = loginRN.checaLogin(email, senha);

        if (resultado != null) {
            login.setEmail(resultado.getEmail());
            login.setSenha(resultado.getSenha());
            login.setPerfil(resultado.getPerfil());
            login.setId_usuario(resultado.getId_usuario());
            login.setLogado(true);

            out.print("<div id=\"resultadoacao\">Logado</div>");
        } else {
            out.print("<div id=\"resultadoacao\">ERRO: Login e/ou senha incorreto(s)!</div>");
        }
    }

%>
