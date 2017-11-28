/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var obj_inst;
$.ajax({
    url: '/ProjetoDirceu/beans/bean_instituicao.jsp',
    type: 'POST',
    async: false,
    dataType: 'json',
    data: {
        'acao': 'mapa'
    },
    success: function (returndata) {
        obj_inst = returndata;
    }
});

var map_instituicoes;
var marker_instituicao;
function initMap() {
    var centro;
    centro = {lat: -25.4342, lng: -49.2713};
    map_instituicoes = new google.maps.Map(document.getElementById('map_instituicoes'), {
        zoom: 11,
        center: centro
    });

    for (var i in obj_inst) {
        var latitude = parseFloat(obj_inst[i]['latitude']);
        var longitude = parseFloat(obj_inst[i]['longitude']);
        var local = new google.maps.LatLng(latitude, longitude);
        marker_instituicao = new google.maps.Marker({
            map: map_instituicoes,
            position: local,
            animation: google.maps.Animation.DROP
        });
    }
}