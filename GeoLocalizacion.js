function ObtenerPosicionJson(){
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(EnviarPosicionNAV)
    } else { 
        alert("Geolocation is not supported by this browser.");
    }
}

function EnviarPosicionNAV(position) {
    const MiLocalizacion = {"Latitude": position.coords.latitude,
    "Longitude": position.coords.longitude};
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('PosicionCargadaJSon', [MiLocalizacion]);
};