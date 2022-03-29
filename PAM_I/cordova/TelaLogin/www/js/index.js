document.addEventListener('deviceready', onDeviceReady, false);

function login(){
    let usuario = document.getElementById("username").value;
    let senha   = document.getElementById("senha").value;

    if (usuario == "admin" && senha == "123") {
        console.log("Usuario: " + usuario + " Logado");
    } else {
        console.log("Tente novamente, usuario ou senha incorretos.");
    }
}

function onDeviceReady() {
    console.log('Running cordova-' + cordova.platformId + '@' + cordova.version);
    document.getElementById('deviceready').classList.add('ready');
}
