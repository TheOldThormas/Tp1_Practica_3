 <!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>biblioteca</title>
</head>
<body>
<?php
//require_once './parametros.php'//
$enlace=mysqli_connect('127.0.0.1','gabriel','123','bibliotecas');



$autor=$_POST['autor'];
	$libro=$_POST['libro'];
	$editorial=$_POST['editorial'];
	$cantidad=$_POST['cantidad'];

if(!mysqli_connect_errno()){
	echo "conexion exitosa. <br/>";
	$sql = "INSERT INTO `libros_biblioteca`(`ID`, `autor`, `libro`, `editorial`, `cantidad`) VALUES (NULL,'$autor','$libro','$editorial','$cantidad')";
	$exito=mysqli_query($enlace,$sql);
	if ($exito) {
		// code...
		echo "registro insertado exitosamente. <br/>";
	}
}else{
echo"error en la conexion ".mysqli_connect_errno()."<br/>";

}


return $enlace;
	
?>
</body>
</html>