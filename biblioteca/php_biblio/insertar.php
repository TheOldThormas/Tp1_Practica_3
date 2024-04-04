<?php

	include("conexion.php");
	$getmysql=new mysqlconex();
	$getconex=$getmysql->conex();

if (isset($_POST['registrar'])) {
	$autor=$_POST['autor'];
	$libro=$_POST['libro'];
	$editorial=$_POST['editorial'];
	$cantidad=$_POST['cantidad'];

	$query= "INSERT INTO `libros_biblioteca`(`ID`, `autor`, `libro`, `editorial`, `cantidad`) VALUES (NULL,'$autor','$libro','$editorial','$cantidad')";
	$exito=mysqli_query($getconex,$query);
	if ($exito) {
		echo "<script>alert('el dato de [$autor] se agrego correctamente); </script>";
		// code...
	}else {
		echo "<script>alert('el dato de [$autor] nose agrego correctamente); </script>";


	}

mysqli_close($getconex);

}




?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>insertar</title>
</head>
<body>
<h1>se ha ingresado el dato</h1>
	<a href="<?=$_SERVER["HTTP_REFERER"]?>">Continuar</a>
</body>
</html>