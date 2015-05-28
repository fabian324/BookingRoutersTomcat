/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function validarFechaIn() {
    var temp = document.getElementById("fecNac").value;
    var y = temp.split("-")
    var fechaSolicitud=new Date(y[0],y[1]-1,y[2]); // se forma la fecha que viene del formulario
    var fechaActual = new Date();   //Fecha actual
    var ftemp = new Date(); // Variable con la fecha actual
     var ftemp2 = new Date();
    var fechaMinima = new Date(ftemp.getTime() + (5 * 24 * 3600 * 1000));   //Sumo 5 dias a la fecha actual para obtener la fecha mínima
    var fechaMaxima = new Date (ftemp2.getTime() + (30 * 24 * 3600 * 1000));  // sumo 30 días a la fecha actual para

   //alert("Actual  : "+fechaActual + "  fecha calendario : "+fechaSolicitud+ "la fecha mínima es : "+fechaMinima);

    if (fechaSolicitud < fechaActual){
        alert ('Esta seleccionando una fecha anterior a la actual');
        document.getElementById("fecNac").focus();
    } else if (fechaSolicitud >= fechaActual && fechaSolicitud <fechaMinima){
        alert ('En ese tiempo no se alcanzaa tenr el pedido');
        document.getElementById("fecNac").focus();
    }else if (fechaSolicitud >= fechaMaxima) {
        alert('NO hacemos pedidos con tanta anticipación');
        document.getElementById("fecNac").focus();
    }else {
        alert('ok');
    }

}
