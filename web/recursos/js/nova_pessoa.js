/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    $(document).on("submit", "#nova_pessoa", function (event) {
        event.preventDefault();
        event.stopImmediatePropagation();
        $.ajax({
            url: '/ProjetoDirceu/beans/bean_pessoa.jsp',
            contentType: 'Content-type: text/plain',
            type: 'GET',
            data: $(this).serialize(),
            cache: false,
            processData: false,
            success: function (returndata) {
                var $resposta = $(returndata).filter("#resultadoacao").text();
                if ($resposta == "Cadastro alterado com sucesso!") {
                    new Noty({
                        type: 'success',
                        layout: 'center',
                        text: $resposta,
                        modal: true,
                        closeWith: ['click', 'button'],
                        callbacks: {
                            onClose: function () {
                                window.location.href = "/ProjetoDirceu/views/pessoa/lista.jsp";
                            }
                        }
                    }).show();
                }
                if ($resposta == "Pessoa cadastrada com sucesso!") {
                    new Noty({
                        type: 'success',
                        layout: 'center',
                        text: $resposta,
                        modal: true,
                        closeWith: ['click', 'button'],
                        callbacks: {
                            onClose: function () {
                                location.reload();
                            }
                        }
                    }).show();
                }
                if ($resposta == null) {
                    new Noty({
                        type: 'error',
                        layout: 'center',
                        text: $resposta,
                        modal: true,
                        closeWith: ['click', 'button']
                    }).show();
                }
            }
        });
    });
});

// Paginação conforme scroll da tabela
var pg = 1;
$(document).ready(function () {
    $("#container_tbl").scroll(function () {
        if ($(this).scrollTop() + $(this).height() == $(this).get(0).scrollHeight) {
            $.ajax({
                url: '/ProjetoDirceu/beans/bean_pessoa.jsp',
                type: 'POST',
                cache: 'false',
                data: {
                    'acao': 'list',
                    'pg': pg,
                    'nome': $("#pesquisa_nome").val(),
                    'perfil': $("#pesquisa_perfil").val(),
                    'ativo': $("#pesquisa_situacao").val()
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

// Validação aplicando classe visual de erro/sucesso do bootstrap
$.validator.setDefaults({
    errorElement: "span",
    highlight: function (element) {
        $(element).parent().removeClass('has-success').addClass('has-error');
    },
    unhighlight: function (element) {
        $(element).parent().removeClass('has-error').addClass('has-success');
    },
    errorPlacement: function (error, element) {
        if (element.parent('.input-group').length || element.prop('type') === 'checkbox' || element.prop('type') === 'radio') {
            error.insertAfter(element.parent());
        } else {
            error.insertAfter(element);
        }
    }
});

$(document).ready(function () {
    $("#nova_pessoa").validate({
        rules: {
            cpf: {
                required: true,
                cpf: true,
                remote: {
                    url: '/ProjetoDirceu/beans/bean_pessoa.jsp',
                    type: 'POST',
                    async: false,
                    data: {
                        'acao': 'checar',
                        'id': function () {
                            return $("#id").val();
                        },
                        'cpf_check': function () {
                            return $("#cpf").val();
                        }
                    }
                }
            },
            nome: {
                required: true
            },
            logradouro: {
                required: true
            },
            numero: {
                required: true
            },
            bairro: {
                required: true
            },
            email: {
                email: true
            },
            uf: {
                required: true
            },
            cidade: {
                required: true
            },
            cep: {
                required: true
            }
        },
        messages: {
            cpf: {
                required: "Campo obrigatório",
                cpf: "CPF inválido!",
                remote: "Pessoa já cadastrada!"
            },
            nome: {
                required: "Campo obrigatório"
            },
            logradouro: {
                required: "Campo obrigatório"
            },
            numero: {
                required: "Campo obrigatório"
            },
            bairro: {
                required: "Campo obrigatório"
            },
            email: {
                email: "Preencha um email válido!"
            },
            uf: {
                required: "Campo obrigatório"
            },
            cidade: {
                required: "Campo obrigatório"
            },
            cep: {
                required: "Campo obrigatório"
            }
        }
    });
});

$(document).ready(function () {
    $("#uf").change(function () {
        var id_uf = $(this).val();
        if (id_uf != "") {
            $.ajax({
                url: '/ProjetoDirceu/beans/bean_localidade.jsp',
                type: 'POST',
                data: {
                    'acao': 'lista_cidades',
                    'id_uf': id_uf
                },
                cache: false,
                success: function (returndata) {
                    var $resposta = returndata;
                    if ($resposta != null) {
                        $("#cidade").html($resposta);
                    }
                }
            });
        } else {
            $("#cidade").html("<option value=\"\">Escolha um estado</option>");
        }
    });
});

$(document).ready(function () {
    $("#cpf").mask('000.000.000-00', {reverse: true});
    $("#cep").mask('00000-000');
    $(".tel").mask('(00) 0000-0000');
});