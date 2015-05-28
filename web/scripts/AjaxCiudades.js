/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


var xmlHttp;
function getCiudades(idNac) {

    if (window.XMLHttpRequest) {
        xmlHttp = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");       
    } else {
        alert("El navegador no soporta Ajax!");
        return;
    }

    var url = "subciudades.jsp?idNacionalidad=" + idNac;
    xmlHttp.onreadystatechange = subCiudades;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);

}

function subCiudades() {
    if (xmlHttp.readyState === 4) {
        document.getElementById("ciunac").innerHTML = xmlHttp.responseText;
    }

}
