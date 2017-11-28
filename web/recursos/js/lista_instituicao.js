/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    $("#conteudo_tabela").on('click', 'tr', function (e) {
        e.preventDefault();
        var id = $(this).attr('value');
        window.location.href = "/ProjetoDirceu/views/instituicao/instituicao.jsp?cod=" + id + "";

    });
});

var pg = 1;
// Paginação por demanda
$(document).ready(function () {
    $("#container_tbl_instituicoes").scroll(function () {
        if ($(this).scrollTop() + $(this).height() == $(this).get(0).scrollHeight) {
            $.ajax({
                url: '/ProjetoDirceu/beans/bean_instituicao.jsp',
                type: 'POST',
                cache: 'false',
                data: {
                    'acao': 'listar',
                    'pg': pg
                },
                success: function (returndata) {
                    var $resposta = returndata;
                    if ($resposta != null) {
                        pg++;
                        $("#conteudo_tabela").append($resposta);
                    }
                }
            });
        }
    });
});

$(document).ready(function () {
    $(".pesquisa").on("keyup change", function () {
        var id = $("#pesquisa_id").val();
        var cnpj = $("#pesquisa_cnpj").val();
        var rsocial = $("#pesquisa_rsocial").val();
        var uf = $("#pesquisa_uf").val();

        $.ajax({
            url: '/ProjetoDirceu/beans/bean_instituicao.jsp',
            type: 'POST',
            cache: 'false',
            data: {
                'acao': 'listar',
                'pesquisa_id': id,
                'pesquisa_cnpj': cnpj,
                'pesquisa_rsocial': rsocial,
                'pesquisa_uf': uf,
                'pg': '0'
            },
            success: function (returndata) {
                var $resposta = returndata;
                if ($resposta != null) {
                    $("#conteudo_tabela").html($resposta);
                }
            }
        });
    });
});