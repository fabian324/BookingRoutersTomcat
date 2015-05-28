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
   
         if (OrigenPais.value==""){		
		OrigenPais.style.border="1px solid red";
		OrigenPais.value="";
	}
        else{          
          OrigenPais.style.border="1px solid green";
         
        }     
	                  
         if (DestinoPais.value==""){		
		DestinoPais.style.border="1px solid red";
		DestinoPais.value="";
	}
	else {
	DestinoPais.style.border="1px solid green";
	}
         if (aer.value==""){		
		aer.style.border="1px solid red";
		aer.value="";
	}
	else {
	aer.style.border="1px solid green";
	}        
        if (NumeroV.value==""){		
		NumeroV.style.border="1px solid red";
		NumeroV.value="";
	}
	else {
	NumeroV.style.border="1px solid green";
	}
        if (aerop.value==""){		
		aerop.style.border="1px solid red";
		aerop.value="";
	}
	else {
	aerop.style.border="1px solid green";
	} 
        if (registros.value==""){		
		registros.style.border="1px solid red";
		registros.value="";
	}
	else {
	registros.style.border="1px solid green";
	} 
        if (NumeroEquipaje.value==""){		
		NumeroEquipaje.style.border="1px solid red";
		NumeroEquipaje.value="";
	}
	else {
	NumeroEquipaje.style.border="1px solid green";
	} 
        if (ser.value==""){		
		ser.style.border="1px solid red";
		ser.value="";
	}
	else {
	ser.style.border="1px solid green";
	} 
         if (hora.value==""){		
		hora.style.border="1px solid red";
		hora.value="";
	}
	else {
	hora.style.border="1px solid green";
	} 
        if (fecNac.value==""){		
		fecNac.style.border="1px solid red";
		fecNac.value="";
	}
	else {
	fecNac.style.border="1px solid green";
	} 
    }
    
