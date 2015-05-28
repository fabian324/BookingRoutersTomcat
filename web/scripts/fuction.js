
function validarForm () {
//alert("validando");
    var verificar = true;
    var exRegEmail=/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
    var formulario=document.getElementById("form1");
    var nombres=document.getElementById("nombres");
    var apellidos=document.getElementById("apellidos");
    var doc=document.getElementById("doc");
    var date=document.getElementById("date");
    var tel=document.getElementById("tel");
    var cor=document.getElementById("cor");
    var paisnac=document.getElementById("paisnac");
    var ciunac=document.getElementById("ciunac");
    var con=document.getElementById("con");
    var vcon=document.getElementById("vcon");
if(!nombres.value)
{
	alert("El campo nombre es requerido");
	nombres.focus();
	verificar=false;
}
else if(!apellidos.value)
{
	alert("El campo apellidos es requerido");
	apellidos.focus();
	verificar=false;
}
else if(!doc.value)
{
	alert("El campo doc es requerido");
	doc.focus();
	verificar=false;
}
else if(!date.value)
{
	alert("El campo date es requerido");
	date.focus();
	verificar=false;
}
else if(!tel.value)
{
	alert("El campo tel es requerido");
	tel.focus();
	verificar=false;
}
else if(!cor.value)
{
	alert("El campo cor es requerido");
	cor.focus();
	verificar=false;
}
else if(!expRegEmail.exec(cor.value))
{
	alert("El campo cor no es valido");
	cor.focus();
	verificar=false;
}
else if(!paisnac.value)
{
	alert("El campopaisnac es requerido");
	paisnac.focus();
	verificar=false;
}
else if(!ciunac.value)
{
	alert("El campociunac es requerido");
	ciunac.focus();
	verificar=false;
}
else if(!con.value)
{
	alert("El campocon es requerido");
	con.focus();
	verificar=false;
}
else if(!vcon.value)
{
	alert("El campovcon es requerido");
	vcon.focus();
	verificar=false;
}
 if(verificar==true){
		alert("Se ha enviado el formulario");
		//document.form1.submit();
	}

window.onload = function()
{
	var botonEnviar;
	botonEnviar = document.form1.registro;
	botonEnviar.onclick=validarForm;
}
}