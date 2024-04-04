

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
</head>
<body>

<form id="form" name="form" method="GET">
		autor: <input type="text" name="autor">
		libro: <input type="text" name="libro">
		editorial: <input type="text" name="editorial">
		<input type="submit" name="buscar" value="enviar">
</form>

<?php 
 
 if (isset($_GET['buscar'])) {
 	
 	$autor = $_GET['autor'];
 	$libro = $_GET['libro'];
 	$editorial = $_GET['editorial'];
 	$servername = "127.0.0.1";
 	$username = "gabriel";
 	$password = "123";
 	$schema ="bibliotecas";

 	$mysqli = new mysqli($servername,$username, $username, $schema);


 	$sql = "SELECT * FROM libros_biblioteca WHERE 1";

 	if (!empty($autor)) {
 		$sql = $sql ." AND autor = '$autor'";
 		// code...
 	}
 	if (!empty($libro)) {
 		$sql = $sql ." AND libro = '$libro";
 		// code...
 	}
 	if (!empty($editorial)) {
 		$sql = $sql ." AND editorial '$editorial'";
 		// code...
 	}

 	if ($resultado =$mysqli-> query($sql)) {
 		// code...
 		while ($fila = $resultado->fetch_object()) {
 			echo "autor". $fila->autor. "libro". $fila->libro."editorial". $fila->editorial. "<br>";
 			// code...
 		}
 	}

 	

 			echo "nombre:" . $autor . "libro:" . $libro . "editorial:" . $editorial ."<br>";

 		
 		// code...
 	

 }


?>
<h1>se ha buscado con exito</h1>
	<a href="<?=$_SERVER["HTTP_REFERER"]?>">Continuar</a>
</body>
</html>