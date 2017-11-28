/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    $(document).on("submit", "#form_gestor", function (event) {
        event.preventDefault();
        event.stopImmediatePropagation();
        $.ajax({
            url: '/ProjetoDirceu/beans/bean_gestor.jsp',
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
                if ($resposta == "Gestor cadastrado com sucesso") {
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
    $("#form_gestor").validate({
        rules: {
            situacao: {
                required: true
            },
            nome: {
                required: true
            },
            cpf: {
                required: true,
                cpf: true,
                remote: {
                    url: '/ProjetoDirceu/beans/bean_gestor.jsp',
                    type: 'POST',
                    async: false,
                    data:{
                        'acao': 'checar',
                        'cpf': function () {
                            return $('#cpf').val();
                        }
                    }
                }
            },
            rg: {
                required: true
            },
            cargo: {
                required: true
            }

        },
        messages: {
            situacao: {
                required: "Campo obrigatório!"
            },
            nome: {
                required: "Campo obrigatório"
            },
            cpf: {
                required: "Campo obrigatório",
                cpf: "CPF inválido!",
                remote: "Gestor já cadastrado"
            },
            rg: {
                required: "Campo obrigatório"
            },
            cargo: {
                required: "Campo obrigatório"
            }
        }
    });
});

$(document).ready(function () {
    $("#cpf").mask("999.999.999-99");
    $("#rg").mask("99.999.999-99");
});