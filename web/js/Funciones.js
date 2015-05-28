function validarFecha() {
    var temp = document.getElementById("fecNac").value;
    var y = temp.split("-")
    var fechaSolicitud=new Date(y[0],y[1]-1,y[2]); // se forma la fecha que viene del formulario
    var fechaActual = new Date();   //Fecha actual
    var ftemp = new Date(); // Variable con la fecha actual
    var ftemp2 = new Date();
    var fechaMinima = new Date(ftemp.getTime() + (5 * 24 * 3600 * 1000));   //Sumo 5 dias a la fecha actual para obtener la fecha m�nima
    var fechaMaxima = new Date (ftemp2.getTime() + (30 * 24 * 3600 * 1000));  // sumo 30 d�as a la fecha actual para

   //alert("Actual  : "+fechaActual + "  fecha calendario : "+fechaSolicitud+ "la fecha m�nima es : "+fechaMinima);
     if (fechaSolicitud < fechaActual){      
        fecNac.style.border="1px solid red";
        swal("ERROR!", "ESTA SELECCIONANDO UNA FECHA ANTERIOR A LA ACTUAL!", "error")
        //alert ('ESTA SELECCIONANDO UNA FECHA ANTERIOR A LA ACTUAL');
        document.getElementById("fecNac").focus();
        
       
    } else if (fechaSolicitud >= fechaActual && fechaSolicitud <fechaMinima){
        fecNac.style.border="1px solid red";
        swal("ERROR!", "EN ESE TIEMPO NO SE ALCANZAMOS A GESTIONAR LA RESERVA!", "error")
        //alert ('EN ESE TIEMPO NO SE ALCANZAMOS A GESTIONAR LA RESERVA');
        document.getElementById("fecNac").focus();
        
    }else if (fechaSolicitud >= fechaMaxima) {
        fecNac.style.border="1px solid red";
        swal("ERROR", "NO HAEMOS PEDIDOS CON TANTA ANTICIPACION!", "error")
        //alert('NO HAEMOS PEDIDOS CON TANTA ANTICIPACION');
        document.getElementById("fecNac").focus();
       
    }else {
        //alert('FECHA VALIDA');
        swal("MUY BIEN!", "FECHA VALIDA!", "success")
      
    }

}
