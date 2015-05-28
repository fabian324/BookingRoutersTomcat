   function requisitos(idelemento)
{
	if (idelemento.value=="") {
             swal("ERROR!", "DEBE LLENAR TODOS LOS CAMPOS DEL FORMULARIO!", "error")
		//idelemento.placeholder="Debe registrar este campo";
		idelemento.style.border="1px solid red";
		war.hidden=false;
	}	
	else if (idelemento!==""){
		idelemento.style.border="1px solid green";
		war.hidden=true;
		}
	}
function edad() {
var fecNac = new Date(date.value);
var hoy = new Date();
var a = hoy.getFullYear();
var m = hoy.getMonth()+1;
var d = hoy.getDate();
var af = fecNac.getFullYear();
var mf = fecNac.getMonth()+1;
var df = fecNac.getDate()+1;
var hoyx = (a*365)+(m*30)+d;
var fecNacx = (af*365)+(mf*30)+df;
var dif = hoyx-fecNacx;
var difx = dif/365;
if (difx<18){
//alert('Usted es Menor de edad!!!\n'+'Fecha Nacimiento'+fecNacx+'\n'+'Hoy'+hoyx+'\n'+'Edad'+difx);
swal("USTED ES MENOR DE EDAD!", "BOOKING ROUTERS NO PERMITE MENORES DE EDAD!", "error")
date.value="";
}
else {
    date.style.border="1px solid green";
}
}
function cerrarVentana() {
    window.close("registro.jsp");
    window.open("index.jsp");
}

function contrase(){
var x=con.value;
var y=vcon.value;
if ((x==y)&&(x!="")&&(y!=""))
{
	swal("MUY BIEN!", "CLAVE VALIDA!", "success")
	con.style.border="1px solid green";
	vcon.style.border="1px solid green";
        
}
else {
    swal("ERROR!", "CLAVE INVALIDA!", "error")
        con.style.border="1px solid red";
        vcon.style.border="1px solid red";
	con.value ="";
	vcon.value="";
}

}
function Eliminar(){
if(eliminar.value=="")
	alert('Desea Eliminar Este Usuario!!');
	con.style.border="1px solid green";
	vcon.style.border="1px solid green";
        
}


function validar(){
  
var x=con.value;
var y=vcon.value;
if ((x==y)&&(x!="")&&(y!=""))
{
//alert('Clave Valida!!');
        swal("MUY BIEN!", "CLAVE VALIDA!", "success")
	con.style.border="1px solid green";
	vcon.style.border="1px solid green";        
}   
else {
    swal("ERROR!", "CLAVE INVALIDA!", "error")
   // alert('Clave Invalida!!\nLas clave no son iguales!!');
        con.style.border="1px solid red";
        vcon.style.border="1px solid red";
	con.value ="";
	vcon.value="";
}
if(vcon&&con.value==""){
    con.style.border="1px solid red";
        vcon.style.border="1px solid red";
}
	 if (nombres.value==""){		
		nombres.style.border="1px solid red";
		nombres.value="";
	}
	else {
	nombres.style.border="1px solid green";
	}
                if (apellidos.value==""){
		apellidos.style.border="1px solid red";
		apellidos.value="";
	}        
	else {
	apellidos.style.border="1px solid green";
	}
		if (doc.value==""){
		doc.style.border="1px solid red";
		doc.value="";
	}
        else if(doc.value.length<=6){  
         swal("ERROR!","Para registrar su documento debe ingresar mas de 6 digitos!", "error")
        // alert ('Para registrar su documento debe ingresar mas de 6 digitos');
          doc.style.border="1px solid red";
          doc.value="";
        }
        else if(doc.value.length>13){  
            swal("ERROR!","Para registrar su documento debe ingresar menos de 13 digitos!", "error")
         //alert ('Para registrar su documento debe ingresar menos de 13 digitos');
          doc.style.border="1px solid red";
          doc.value="";
        }
	else {
	doc.style.border="1px solid green";
	}
	if (date.value==""){
		date.style.border="1px solid red";
		date.value="";
	}
	else {
	date.style.border="1px solid green";
	}
	if (tel.value==""){		
		tel.style.border="1px solid red";
		tel.value="";
	}
	else if(tel.value.length<5){   
          swal("ERROR!","Para registrar su telefono debe ingresar mas de 6 digitos!", "error")
         //alert ('Para registrar su telefono debe ingresar mas de 6 digitos');
          tel.style.border="1px solid red";
          tel.value="";
	}
	if (cor.value==""){		
		cor.style.border="1px solid red";
		cor.value="";
	}
	else {
	cor.style.border="1px solid green";
	}
	if (paisnac.value==""){		
		paisnac.style.border="1px solid red";
		paisnac.value="";
	}
	else {
	paisnac.style.border="1px solid green";
	}
	if (ciunac.value==""){		
		ciunac.style.border="1px solid red";
		ciunac.value="";
	}
	else {
	ciunac.style.border="1px solid green";
	}	
        if (pSexo.value==""){		
		pSexo.style.border="1px solid red";
		pSexo.value="";
	}
	else {
	pSexo.style.border="1px solid green";
	}
        
	 }
         
function validNumber(e) {
var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
return ((tecla > 47 && tecla < 58) || tecla == 8);
}

function validLetter(e) {
var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
var especiales = [8, 32, 13];/*back, space, enter */

for (var i in especiales) {
if (tecla == especiales[i]) { return true;/*break; */}
}
return (((tecla > 96 && tecla < 123) || (tecla > 64 && tecla < 91)) || tecla == 8);
}




   