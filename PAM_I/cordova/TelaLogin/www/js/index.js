document.addEventListener('deviceready', onDeviceReady, false);

function onDeviceReady() {
    console.log('Running cordova-' + cordova.platformId + '@' + cordova.version);
    document.getElementById('deviceready').classList.add('ready');
}
function login(){
    let usuario = document.getElementById("username").value;
    let senha   = document.getElementById("senha").value;
    
    if (usuario == "admin" && senha == "123") {
        
    } else {
        console.log("Tente novamente, usuario ou senha incorretos.");
    }
}