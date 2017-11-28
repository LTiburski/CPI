/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    $(document).on("submit", "#form_login", function (event) {
        event.preventDefault();
        event.stopImmediatePropagation();
        $("#resultado").text("Processando-... Aguarde");
        $.ajax({
            url: '/ProjetoDirceu/beans/bean_login.jsp',
            contentType: 'Content-type: text/plan',
            type: 'GET',
            data: $(this).serialize(),
            cache: false,
            processData: false,
            success: function (returndata) {
                var $resposta = $(returndata).filter("#resultadoacao").text();
                $("#resultado").text($resposta);
                if ($resposta == "Logado") {
                    window.location.replace("/ProjetoDirceu/index.jsp");
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

$(document).ready(function(){
    $("#form_login").validate({
        rules:{
            email:{
                required: true,
                email: true
            },
            senha:{
                required: true
            }
        },
        messages:{
            email:{
                required: "",
                email: "Preencha um email válido!"
            },
            senha:{
                required: ""
            }
        }
    });
});


jQuery(document).ready(function() {
	
    /*
        Fullscreen background
    */
    $.backstretch("/ProjetoDirceu/recursos/img/backgrounds/1.jpg");
    
});
