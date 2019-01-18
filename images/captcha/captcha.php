<?
	$root = "../../";
	include($root."lib/lib.php");
	
	// Tomar la clave por GET, mover los caracteres 13 posiciones (solo letras) y decifrar en base64
	$clave = base64_decode(str_rot13($_GET['c']));

	// Crear un captcha de 120x70
	$captcha = new Captcha();
	$captcha->generar_captcha($clave, 120, 70);
?>
