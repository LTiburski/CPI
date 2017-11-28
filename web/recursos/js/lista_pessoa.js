/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    $("#conteudo_tabela").on('click', 'tr', function (e) {
        e.preventDefault();
        var id = $(this).attr('value');
        window.location.href = "/ProjetoDirceu/views/pessoa/pessoa.jsp?cod=" + id + "";
    });
});

// Paginação conforme scroll da tabela
var pg = 1;
$(document).ready(function () {
    $("#container_tbl_pessoa").scroll(function () {
        if ($(this).scrollTop() + $(this).height() == $(this).get(0).scrollHeight) {
            $.ajax({
                url: '/ProjetoDirceu/beans/bean_pessoa.jsp',
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
        var situacao = $("#pesquisa_situacao").val();
        var id = $("#pesquisa_id").val();
        var cpf = $("#pesquisa_cpf").val();
        var nome = $("#pesquisa_nome").val();

        $.ajax({
            url: '/ProjetoDirceu/beans/bean_pessoa.jsp',
            type: 'POST',
            cache: 'false',
            data: {
                'acao': 'listar',
                'pesquisa_situacao': situacao,
                'pesquisa_id': id,
                'pesquisa_cpf': cpf,
                'pesquisa_nome': nome,
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