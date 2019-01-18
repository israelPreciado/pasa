<script type="text/javascript">// <![CDATA[
if (navigator.geolocation) {
  var tiempo_de_espera = 3000;
  navigator.geolocation.getCurrentPosition(mostrarCoordenadas, mostrarError, { enableHighAccuracy: true, timeout: tiempo_de_espera, maximumAge: 0 } );
}
else {
  alert("La Geolocalización no es soportada por este navegador");
}

function mostrarCoordenadas(position) {
  alert("Latitud: " + position.coords.latitude + ", Longitud: " + position.coords.longitude);
}

function mostrarError(error) {
  var errores = {1: 'Permiso denegado', 2: 'Posición no disponible', 3: 'Expiró el tiempo de respuesta'};
  alert("Error: " + errores[error.code]);
}
// ]]></script>