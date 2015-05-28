 function requisitos(idelemento)
{
	if (idelemento.value=="") {
		//idelemento.placeholder="Debe registrar este campo";
		idelemento.style.border="1px solid red";
		war.hidden=false;
	}	
	else if (idelemento!==""){
		idelemento.style.border="1px solid green";
		war.hidden=true;
		}
	}
function validar(){
         if (tel.value==""){		
		tel.style.border="1px solid red";
		tel.value="";
	}
        else if(tel.value.length>12){  
          swal("ERROR!","Para registrar su telefono debe ingresar menos de 12 digitos!", "error")
          tel.style.border="1px solid red";
          tel.value="";
        }
         else if(tel.value.length<7){    
          swal("ERROR!","Para registrar su telefono debe ingresar mas de 7 digitos!", "error")
          tel.style.border="1px solid red";
          tel.value="";
        }
	else {
	tel.style.border="1px solid green";
	}
         if (nombrePer.value==""){		
		nombrePer.style.border="1px solid red";
		nombrePer.value="";
	}
	else {
	nombrePer.style.border="1px solid green";
	}                  
         if (apellidoPer.value==""){		
		apellidoPer.style.border="1px solid red";
		apellidoPer.value="";
	}
	else {
	apellidoPer.style.border="1px solid green";
	}
         if (nacio.value==""){		
		nacio.style.border="1px solid red";
		nacio.value="";
	}
	else {
	nacio.style.border="1px solid green";
	}        
        if (fechNac.value==""){		
		fechNac.style.border="1px solid red";
		fechNac.value="";
	}
	else {
	fechNac.style.border="1px solid green";
	}
         
    }
    


