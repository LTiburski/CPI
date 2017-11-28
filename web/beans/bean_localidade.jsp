<%@page import="br.com.solutionsource.dirceu.localidade.LocalidadeRN"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String acao = request.getParameter("acao");

    if (acao.equals("lista_cidades")) {
        
        LocalidadeRN lRN = new LocalidadeRN();
        
        String id_uf = request.getParameter("id_uf");
        
        if (id_uf != null && !id_uf.isEmpty()){
            out.print(lRN.listaCidades(Integer.parseInt(id_uf)));
        }
    }
%>