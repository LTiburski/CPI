<%@page import="br.com.solutionsource.dirceu.login.Login"%>
<%@page import="br.com.solutionsource.dirceu.login.LoginRN"%>
<%
    String acao = request.getParameter("acao");

    LoginRN lRN = new LoginRN();

    if (acao.equals("cadastrar")) {
        String situacao = request.getParameter("situacao");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String senha2 = request.getParameter("senha2");

        if (situacao != null && !situacao.isEmpty() && email != null && !email.isEmpty() && senha != null && !senha.isEmpty() && senha2 != null && !senha2.isEmpty()) {
            if (senha2.equals(senha)) {
                Login usuario = new Login();
                
                usuario.setSituacao(situacao);
                usuario.setEmail(email);
                usuario.setSenha(senha);
                
                out.print("<div id=\"resultadoacao\">" + lRN.insereUsuario(usuario) + "</div>");
            }
        }
    }
    
    if (acao.equals("checar")){
        String email = request.getParameter("email");
        
        if (email != null && !email.isEmpty()){
            out.print(lRN.checaEmailExistente(email));
        }
    }
%>