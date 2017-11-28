<%@page import="br.com.solutionsource.dirceu.instituicao_categoria.InstituicaoCategoriaRN"%>
<%@page import="br.com.solutionsource.dirceu.instituicao_categoria.InstituicaoCategoria"%>
<jsp:useBean id="inst" class="br.com.solutionsource.dirceu.instituicao.Instituicao" scope="session"/>
<%@page import="br.com.solutionsource.dirceu.instituicao.InstituicaoRN"%>
<%@page import="br.com.solutionsource.dirceu.instituicao.Instituicao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="login" class="br.com.solutionsource.dirceu.login.Login" scope="session"/>
<%
    // Recebendo dados na codificação UTF-8
    request.setCharacterEncoding("UTF-8");
// Define qual bloco será executado dentro do bean
    String acao = request.getParameter("acao");
    String id_inst = request.getParameter("id_inst");
    InstituicaoRN iRN = new InstituicaoRN();

    if (acao.equals("cadastrar")) {
        String situacao = request.getParameter("situacao");
        String cnpj = request.getParameter("cnpj");
        String razao_social = request.getParameter("razao_social");
        String fantasia = request.getParameter("fantasia");
        String categoria = request.getParameter("categoria");
        String contato = request.getParameter("contato");
        String tipo = request.getParameter("tipo");
        String endereco = request.getParameter("logradouro");
        String numero = request.getParameter("numero");
        String bairro = request.getParameter("bairro");
        String complemento = request.getParameter("complemento");
        String uf = request.getParameter("uf");
        String cidade = request.getParameter("cidade");
        String latitude = request.getParameter("lat");
        String longitude = request.getParameter("long");
        String telefone = request.getParameter("fone");
        String email = request.getParameter("email");
        String site = request.getParameter("site");
        String obs = request.getParameter("obs");

        if (situacao != null && !situacao.isEmpty() && cnpj != null && !cnpj.isEmpty() && razao_social != null && !razao_social.isEmpty() && fantasia != null && !fantasia.isEmpty()
                && categoria != null && !categoria.isEmpty() && tipo != null && !tipo.isEmpty() && endereco != null && !endereco.isEmpty()
                && numero != null && !numero.isEmpty() && bairro != null && !bairro.isEmpty() && uf != null && !uf.isEmpty() && cidade != null && !cidade.isEmpty()
                && latitude != null && !latitude.isEmpty() && longitude != null && !longitude.isEmpty()) {

            Instituicao i = new Instituicao();

            i.setSituacao(situacao);
            i.setCnpj(cnpj);
            i.setRazao_social(razao_social);
            i.setNome_fantasia(fantasia);
            i.setId_categoria(Integer.parseInt(categoria));
            i.setTipo(tipo);
            i.setLogradouro(endereco);
            i.setNumero(Integer.parseInt(numero));
            i.setBairro(bairro);
            i.setComplemento(complemento);
            i.setId_uf(Integer.parseInt(uf));
            i.setId_cidade(Integer.parseInt(cidade));
            i.setTelefone(telefone);
            i.setEmail(email);
            i.setSite(site);
            i.setObservacoes(obs);
            i.setLatitude(latitude);
            i.setLongitude(longitude);
            i.setId_usuario(login.getId_usuario());

            if (id_inst != null && !id_inst.isEmpty()) {
                i.setId(Integer.parseInt(id_inst));
                out.print("<div id=\"resultadoacao\">" + iRN.editaInstituicao(i) + "</div>");
            } else {
                out.print("<div id=\"resultadoacao\">" + iRN.insereInstituicao(i) + "</div>");
            }
        }
    }

    if (acao.equals("checar")) {
        String cnpj = request.getParameter("cnpj");

        if (cnpj != null) {
            if (id_inst != null && !id_inst.isEmpty()) {
                out.print(iRN.checaInstituicaoExistente(cnpj, Integer.parseInt(id_inst), login.getId_usuario()));
            } else {
                out.print(iRN.checaInstituicaoExistente(cnpj, null, login.getId_usuario()));
            }
        }
    }

    if (acao.equals("listar")) {
        Instituicao pesquisa = new Instituicao();
        String pg = request.getParameter("pg");
        String pesquisa_id = request.getParameter("pesquisa_id");
        String pesquisa_cnpj = request.getParameter("pesquisa_cnpj");
        String pesquisa_rsocial = request.getParameter("pesquisa_rsocial");
        String pesquisa_uf = request.getParameter("pesquisa_uf");

        pesquisa.setPg(Integer.parseInt(pg));
        pesquisa.setId_usuario(login.getId_usuario());
        if (pesquisa_id != null && !pesquisa_id.isEmpty()) {
            pesquisa.setPesquisa_id(Integer.parseInt(pesquisa_id));
        }
        if (pesquisa_cnpj != null && !pesquisa_cnpj.isEmpty()) {
            pesquisa.setPesquisa_cnpj(pesquisa_cnpj);
        }
        if (pesquisa_rsocial != null && !pesquisa_rsocial.isEmpty()) {
            pesquisa.setPesquisa_rsocial(pesquisa_rsocial);
        }
        if (pesquisa_uf != null && !pesquisa_uf.isEmpty()) {
            pesquisa.setPesquisa_uf(Integer.parseInt(pesquisa_uf));
        }
        out.print(iRN.resultadoInstituicao(pesquisa));
    }

    if (acao.equals("mapa")) {
        out.print(iRN.retornaJSON());
    }

//    if (acao.equals("select")) {
//        InstituicaoRN iRN = new InstituicaoRN();
//        String id_inst = request.getParameter("id_inst");
//
//        if (id_inst != null) {
//            Instituicao result = iRN.selecionaInstituicao(Integer.parseInt(id_inst));
//            inst.setId(result.getId());
//            inst.setSituacao(result.getSituacao());
//            inst.setCnpj(result.getCnpj());
//            inst.setRazao_social(result.getRazao_social());
//            inst.setNome_fantasia(result.getNome_fantasia());
//            inst.setId_pai(result.getId_pai());
//            inst.setId_categoria(result.getId_categoria());
//            inst.setTipo(result.getTipo());
//            inst.setLogradouro(result.getLogradouro());
//            inst.setNumero(result.getNumero());
//            inst.setBairro(result.getBairro());
//            inst.setComplemento(result.getComplemento());
//            inst.setId_uf(result.getId_uf());
//            inst.setId_cidade(result.getId_cidade());
//            inst.setNome_uf(result.getNome_uf());
//            inst.setNome_cidade(result.getNome_cidade());
//            inst.setLatitude(result.getLatitude());
//            inst.setLongitude(result.getLongitude());
//            inst.setTelefone(result.getTelefone());
//            inst.setEmail(result.getEmail());
//            inst.setSite(result.getSite());
//            inst.setObservacoes(result.getObservacoes());
//        }
//    }
    if (acao.equals("cadastrar_categoria")) {
        String categoria = request.getParameter("categoria");
        if (categoria != null && !categoria.isEmpty()) {
            InstituicaoCategoria cat = new InstituicaoCategoria();
            cat.setCategoria(categoria);
            InstituicaoCategoriaRN catRN = new InstituicaoCategoriaRN();

            out.print("<div id=\"resultadoacao\">" + catRN.insereCategoria(cat) + "</div>");
        }
    }

    if (acao.equals("checar_categoria")) {
        String categoria = request.getParameter("categoria");
        InstituicaoCategoriaRN catRN = new InstituicaoCategoriaRN();

        if (categoria != null && !categoria.isEmpty()) {
            out.print(catRN.checaCategoriaExistente(categoria));
        }
    }

    if (acao.equals("buscar_categoria")) {
        String categoria = request.getParameter("categoria");
        InstituicaoCategoriaRN catRN = new InstituicaoCategoriaRN();
        out.print(catRN.retornaCategoriasJSON(categoria));
    }
    
    if (acao.equals("editar_categoria")){
        String id = request.getParameter("id");
        String categoria = request.getParameter("categoria");
        
        if (id != null && !id.isEmpty() && categoria != null && !categoria.isEmpty()){
            InstituicaoCategoria icat = new InstituicaoCategoria();
            InstituicaoCategoriaRN icatRN = new InstituicaoCategoriaRN();
            icat.setId(Integer.parseInt(id));
            icat.setCategoria(categoria);
            
            out.print("<div id=\"resultadoacao\">" + icatRN.editaCategoria(icat) + "</div>");
        }
    }
%>