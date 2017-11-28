/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    $(document).on("submit", "#novo_usuario", function (event) {
        event.preventDefault();
        event.stopImmediatePropagation();
        $.ajax({
            url: '/ProjetoDirceu/beans/bean_usuario.jsp',
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
                                window.location.href = "/ProjetoDirceu/index.jsp";
                            }
                        }
                    }).show();
                }
                if ($resposta == "Usuário cadastrado com sucesso!") {
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
    $("#novo_usuario").validate({
        rules: {
            situacao: {
                required: true
            },
            email: {
                required: true,
                email: true,
                remote: {
                    url: '/ProjetoDirceu/beans/bean_usuario.jsp',
                    type: 'POST',
                    async: false,
                    data: {
                        'acao': 'checar',
                        'email': function () {
                            return $('#email').val();
                        }
                    }
                }
            },
            senha: {
                required: true
            },
            senha2: {
                required: true,
                equalTo: "#senha"
            }

        },
        messages: {
            situacao: {
                required: "Campo obrigatório!"
            },
            email: {
                required: "Campo obrigatório",
                email: "Preencha um e-mail válido!",
                remote: "Usuário já cadastrado!"
            },
            senha: {
                required: "Campo obrigatório"
            },
            senha2: {
                required: "Campos obrigatório",
                equalTo: "As senhas não conferem"
            }
        }
    });
});