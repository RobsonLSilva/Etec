document.addEventListener('deviceready', onDeviceReady, false);


    // onSuccess Callback
    // This method accepts a Position object, which contains the
    // current GPS coordinates
    //
    var onSuccess = function(position) {
        document.getElementById("latitude").value = position.coords.latitude;
        document.getElementById("longitude").value = position.coords.longitude;
    }

    // onError Callback receives a PositionError object
    //
    function onError(error) {
        alert('code: '    + error.code    + '\n' +
              'message: ' + error.message + '\n');
    }

    



function onDeviceReady() {

    navigator.geolocation.getCurrentPosition(onSuccess, onError);  
    document.getElementById('deviceready').classList.add('ready');
}
