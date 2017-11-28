<%@page import="br.com.solutionsource.dirceu.gestores.GestorRN"%>
<%@page import="br.com.solutionsource.dirceu.gestores.Gestor"%>
<%
    String acao = request.getParameter("acao");

    if (acao.equals("cadastrar")) {
        String situacao = request.getParameter("situacao");
        String nome = request.getParameter("nome");
        String apelido = request.getParameter("apelido");
        String cpf = request.getParameter("cpf");
        String rg = request.getParameter("rg");
        String cargo = request.getParameter("cargo");
        String obs = request.getParameter("obs");

        if (situacao != null && !situacao.isEmpty() && nome != null && !nome.isEmpty() && cpf != null && !cpf.isEmpty()
                && rg != null && !rg.isEmpty() && cargo != null && !cargo.isEmpty()) {
            Gestor gestor = new Gestor();

            gestor.setSituacao(situacao);
            gestor.setNome(nome);
            gestor.setApelido(apelido);
            gestor.setCpf(cpf);
            gestor.setRg(rg);
            gestor.setCargo(cargo);
            gestor.setObs(obs);

            GestorRN gRN = new GestorRN();

            out.print("<div id=\"resultadoacao\">" + gRN.insereGestor(gestor) + "</div>");
        }
    }

    if (acao.equals("checar")) {
        String cpf = request.getParameter("cpf");
        GestorRN gRN = new GestorRN();
        if (cpf != null) {
            out.print(gRN.buscaPorCpf(cpf));
        }
    }
%>