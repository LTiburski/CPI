<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="java.util.*"%>
<%@page import="br.com.solutionsource.dirceu.pessoa.PessoaRN"%>
<%@page import="br.com.solutionsource.dirceu.pessoa.Pessoa"%>
<jsp:useBean id="login" class="br.com.solutionsource.dirceu.login.Login" scope="session"/>
<%
    request.setCharacterEncoding("UTF-8");
    String acao = request.getParameter("acao");
    String id = request.getParameter("id");

    PessoaRN pRN = new PessoaRN();

    if (acao.equals("cadastrar")) {
        String situacao = request.getParameter("situacao");
        String cpf = request.getParameter("cpf");
        String nome = request.getParameter("nome");
        String apelido = request.getParameter("apelido");
        String logradouro = request.getParameter("logradouro");
        String numero = request.getParameter("numero");
        String bairro = request.getParameter("bairro");
        String complemento = request.getParameter("complemento");
        String uf = request.getParameter("uf");
        String cidade = request.getParameter("cidade");
        String cep = request.getParameter("cep");
        String tel = request.getParameter("tel");
        String tel_comercial = request.getParameter("tel_comercial");
        String email = request.getParameter("email");
        String obs = request.getParameter("obs");

        if (situacao != null && !situacao.isEmpty() && cpf != null && !cpf.isEmpty() && nome != null && !nome.isEmpty() && logradouro != null && !logradouro.isEmpty()
                && numero != null && !numero.isEmpty() && bairro != null && !bairro.isEmpty() && uf != null && !uf.isEmpty() && cidade != null && !cidade.isEmpty()
                && cep != null && !cep.isEmpty()) {

            Pessoa p = new Pessoa();

            p.setSituacao(situacao);
            p.setCpf(cpf);
            p.setNome(nome);
            p.setApelido(apelido);
            p.setLogradouro(logradouro);
            p.setNumero(Integer.parseInt(numero));
            p.setBairro(bairro);
            p.setComplemento(complemento);
            p.setId_uf(Integer.parseInt(uf));
            p.setId_cidade(Integer.parseInt(cidade));
            p.setCep(cep);
            p.setFone_fixo(tel);
            p.setFone_comercial(tel_comercial);
            p.setEmail(email);
            p.setObservacoes(obs);
            p.setId_usuario(login.getId_usuario());

            if (id != null && !id.isEmpty()) {
                p.setId(Integer.parseInt(id));
                out.print("<div id=\"resultadoacao\">" + pRN.editaPessoa(p) + "</div>");
            } else {
                out.print("<div id=\"resultadoacao\">" + pRN.inserePessoa(p) + "</div>");
            }
        }
    }

    if (acao.equals("checar")) {
        String cpf_check = request.getParameter("cpf");
        if (cpf_check != null) {
            if (id != null && !id.isEmpty()) {
                out.print(pRN.buscaPorCpf(cpf_check, Integer.parseInt(id), login.getId_usuario()));
            } else {
                out.print(pRN.buscaPorCpf(cpf_check, null, login.getId_usuario()));
            }
        }
    }

    if (acao.equals("listar")) {
        Pessoa pesquisa = new Pessoa();
        String pg = request.getParameter("pg");
        String pesquisa_situacao = request.getParameter("pesquisa_situacao");
        String pesquisa_id = request.getParameter("pesquisa_id");
        String pesquisa_cpf = request.getParameter("pesquisa_cpf");
        String pesquisa_nome = request.getParameter("pesquisa_nome");

        pesquisa.setPg(Integer.parseInt(pg));
        if (pesquisa_situacao != null && !pesquisa_situacao.isEmpty()) {
            pesquisa.setPesquisa_situacao(pesquisa_situacao);
        }
        if (pesquisa_id != null && !pesquisa_id.isEmpty()) {
            pesquisa.setPesquisa_id(Integer.parseInt(pesquisa_id));
        }
        if (pesquisa_cpf != null && !pesquisa_cpf.isEmpty()) {
            pesquisa.setPesquisa_cpf(pesquisa_cpf);
        }
        if (pesquisa_nome != null && !pesquisa_nome.isEmpty()) {
            pesquisa.setPesquisa_nome(pesquisa_nome);
        }
        pesquisa.setId_usuario(login.getId_usuario());
        out.print(pRN.pesquisaPessoa(pesquisa));
    }

    if (acao.equals("upload")) {
        try {
            ServletFileUpload fu = new ServletFileUpload();
            List fileItems = fu.parseRequest(request);
            Iterator i = fileItems.iterator();
            FileItem fi = (FileItem) i.next();
            InputStream in = fi.getInputStream();
            File file = new File("c:/arquivoSaida");
            FileOutputStream fos = new FileOutputStream(file);

            int c;
            while ((c = in.read()) != -1) {
                fos.write(c);
                fos.close();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        response.sendRedirect("/ProjetoDirceu/views/pessoa/pessoa.jsp?cod=" + id);
    }

    if (acao.equals("download")) {
        response.setHeader("Content-disposition", "attachment; filename=termo_adesao");
        FileInputStream input = new FileInputStream("/ProjetoDirceu/recursos/img/termo_adesao.pdf");
        ServletOutputStream outStream = response.getOutputStream();

        byte[] buffer = new byte[4096];
        int read = 0;
        while((read = input.read(buffer)) != -1){
           outStream.write(buffer);
           outStream.flush();
        }
           outStream.close();
    }
%>
