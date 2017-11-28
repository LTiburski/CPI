/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    $(document).on("submit", "#nova_instituicao", function (event) {
        event.preventDefault();
        event.stopImmediatePropagation();
        $.ajax({
            url: '/ProjetoDirceu/beans/bean_instituicao.jsp',
            contentType: 'Content-type: text/plain',
            type: 'GET',
            data: $(this).serialize(),
            cache: false,
            async: true,
            processData: false,
            success: function (returndata) {
                var $resposta = $(returndata).filter("#resultadoacao").text();
                switch ($resposta) {
                    case "Cadastro alterado com sucesso!":
                        new Noty({
                            type: 'success',
                            layout: 'center',
                            text: $resposta,
                            modal: true,
                            closeWith: ['click', 'button'],
                            callbacks: {
                                onClose: function () {
                                    window.location.href = "/ProjetoDirceu/views/instituicao/lista.jsp";
                                }
                            }
                        }).show();
                        break;
                    case "Instituição cadastrada com sucesso!":
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
                        break;
                    default:
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
    $("#nova_instituicao").validate({
        rules: {
            cnpj: {
                required: true,
                cnpj: true,
                remote: {
                    url: '/ProjetoDirceu/beans/bean_instituicao.jsp',
                    type: 'POST',
                    async: false,
                    data: {
                        'acao': 'checar',
                        'cnpj': function () {
                            return $('#cnpj').val();
                        },
                        'id_inst': function () {
                            return $("#id_inst").val();
                        }
                    }
                }
            },
            razao_social: {
                required: true
            },
            fantasia: {
                required: true
            },
            tipo: {
                required: true
            },
            contato: {
                required: true
            },
            categoria: {
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
            uf: {
                required: true
            },
            cidade: {
                required: true
            },
            email: {
                email: true
            }
        },
        messages: {
            cnpj: {
                required: "Campo obrigatório",
                cnpj: "CNPJ inválido",
                remote: "Instituição já cadastrada!"
            },
            razao_social: {
                required: "Campo obrigatório"
            },
            fantasia: {
                required: "Campo obrigatório"
            },
            tipo: {
                required: "Campo obrigatório"
            },
            contato: {
                required: "Campo obrigatório"
            },
            categoria: {
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
            uf: {
                required: "Campo obrigatório"
            },
            cidade: {
                required: "Campo obrigatório"
            },
            email: {
                email: "Preencha um e-mail válido!"
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
    $('#cnpj').mask('00.000.000/0000-00', {reverse: true});
    $(".tel").mask('(00) 0000-0000');
});

$(document).ready(function () {
    $(".action-map").on("change", function () {
        searchAddress();
    });
});

var map;
var marker;
function initMap() {
    var centro;
    var lat = document.getElementById("latitude").value;
    var lng = document.getElementById("longitude").value;

    if (lat != "" && lng != "") {
        map = new google.maps.Map(document.getElementById('map'), {
            zoom: 11,
            center: centro
        });
        searchAddress();
    } else {
        centro = {lat: -25.508819, lng: -49.322317};
        map = new google.maps.Map(document.getElementById('map'), {
            zoom: 11,
            center: centro
        });
    }
}

function searchAddress() {
    if (document.getElementById("endereco").value != "" && document.getElementById("numero").value != "") {
        var endereco = document.getElementById("endereco").value + ", " + document.getElementById("numero").value;
        var geocoder = new google.maps.Geocoder();
        geocoder.geocode({address: endereco}, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                var resultado = results[0].geometry.location;
                map.setCenter(resultado);
                map.setZoom(11);
                createMarker(resultado);
            }
        });
    }
}

function createMarker(latlng) {
    deleteMarker();
    marker = new google.maps.Marker({
        map: map,
        position: latlng,
        animation: google.maps.Animation.DROP
    });
    var lat = latlng.lat();
    var lng = latlng.lng();
    document.getElementById("latitude").value = lat;
    document.getElementById("longitude").value = lng;
}

function deleteMarker() {
    if (marker != null) {
        marker.setMap(null);
    }
}