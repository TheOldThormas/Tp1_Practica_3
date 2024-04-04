<?php
	include("conexion.php");
	$getmysql= new mysqlconex();
	$getconex=$getmysql->conex();

	if(isset($_POST['eliminar'])){
		$id=$_POST['id'];
		$autor=$_POST['autor'];
		$query= "DELETE FROM libros_biblioteca WHERE ID=?";
		$sentencia = mysqli_prepare($getconex, $query);
		mysqli_stmt_bind_param($sentencia,"i",$id);
		mysqli_stmt_execute($sentencia);
		echo "borrado";

	
	


}
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
</head>
<body>
	<h1>se ha eliminado</h1>
	<a href="<?=$_SERVER["HTTP_REFERER"]?>">Continuar</a>
</body>
</html>