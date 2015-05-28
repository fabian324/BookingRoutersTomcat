/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var xmlHttp;
function getRuta(idRuta) {

    if (window.XMLHttpRequest) {
        xmlHttp = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    } else {
        alert("El navegador no soporta Ajax!");
        return;
    }
    
    var url = "getRuta.jsp?id=" + idRuta;
    xmlHttp.onreadystatechange = resultadoRuta;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);

}
function getRuta1() {

    if (window.XMLHttpRequest) {
        xmlHttp = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    } else {
        alert("El navegador no soporta Ajax!");
        return;
    }
    
    var url = "getRuta1.jsp?id=" + document.getElementById("idRuta").value;
    xmlHttp.onreadystatechange = resultadoRuta;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);

}

function resultadoRuta() {
    if (xmlHttp.readyState === 4) {
        document.getElementById("divMod").innerHTML = xmlHttp.responseText;
        $('#divMod').modal('show');
    }
}