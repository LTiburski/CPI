/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    $(document).on("submit", "#form_categoria", function (event) {
        event.preventDefault();
        event.stopImmediatePropagation();
        $.ajax({
            url: '/ProjetoDirceu/beans/bean_instituicao.jsp',
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
                if ($resposta == "Categoria cadastrada com sucesso!") {
                    new Noty({
                        type: 'success',
                        layout: 'center',
                        text: "<p><b>Sucesso!</b></p>Categoria cadastrada com sucesso!",
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

var json_categoria;
$(document).ready(function () {
    $("#conteudo_tabela").on('click', 'tr', function (e) {
        e.preventDefault();
        var categoria = $(this).attr('value');
        $.ajax({
            url: '/ProjetoDirceu/beans/bean_instituicao.jsp',
            type: 'POST',
            async: false,
            dataType: 'json',
            data: {
                'acao': 'buscar_categoria',
                'categoria': categoria
            },
            success: function (returndata) {
                json_categoria = returndata;
                $("#edit_categoria").val(json_categoria[0]['categoria']);
                $("#modal_categoria").modal('show');
            }
        });
    });
});

$(document).ready(function () {
    $("#btn_salvar").on("click", function () {
        $.ajax({
            url: '/ProjetoDirceu/beans/bean_instituicao.jsp',
            type: 'GET',
            async: false,
            data: {
                'acao': 'editar_categoria',
                'categoria': function () {
                    return $("#edit_categoria").val();
                },
                'id': json_categoria[0]['id']
            },
            success: function (returndata) {
                var $resposta = $(returndata).filter("#resultadoacao").text();
                if ($resposta == "Cadastro alterado com sucesso!") {
                    new Noty({
                        type: 'success',
                        layout: 'center',
                        text: "<p><b>Sucesso!</b></p><p>Cadastro alterado com sucesso!</p>",
                        modal: true,
                        closeWith: ['click', 'button'],
                        callbacks: {
                            onClose: function () {
                                location.reload();
                            }
                        }
                    }).show();
                } 
                if ($resposta == "Categoria já existente!"){
                    new Noty({
                        type: 'error',
                        layout: 'center',
                        text: "<p><b>Erro!</b></p><p>Categoria já existente!</p>",
                        modal: true,
                        closeWith: ['click', 'button']
                    }).show();
                }
            }
        });
    });
});

$(document).ready(function () {
    $("#form_categoria").validate({
        rules: {
            categoria: {
                required: true,
                remote: {
                    url: '/ProjetoDirceu/beans/bean_instituicao.jsp',
                    type: 'POST',
                    async: false,
                    data: {
                        'acao': 'checar_categoria',
                        'categoria': function () {
                            return $("#categoria").val();
                        }
                    }
                }
            }
        },
        messages: {
            categoria: {
                required: "Campo obrigatório",
                remote: "Categoria já cadastrada!"
            }
        }
    });
});