<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>document</title>
</head>
<body>

<?php

$id=$_POST['id'];
$autor=$_POST['autor'];
$libro=$_POST['libro'];
$editorial=$_POST['editorial'];
$cantidad=$_POST['cantidad'];

if (isset($_POST["editar2"])) {

	include ("conexion.php");
	$getmysql=new mysqlconex();
	$getconex=$getmysql->conex();
	// code...

	
	$query= "UPDATE libros_biblioteca SET autor=?, libro=?,editorial=?,cantidad=? WHERE ID=?";
		$sentencia = mysqli_prepare($getconex, $query);
		mysqli_stmt_bind_param($sentencia,"sssii",$autor,$libro,$editorial,$cantidad,$id);
		mysqli_stmt_execute($sentencia);

	mysqli_close($getconex);
}


?>

<form action="fin_editar.php" method="POST">
		<input type="hidden" value="<?php echo $id ?>" name="id">
		<label for="autor"></label> <input type="text" name="autor" id="autor" value="<?php echo $autor ?>">
		<label for="libro"></label> <input type="text" name="libro" id="libro" value="<?php echo $libro ?>">
		<label for="editorial"></label> <input type="text" name="editorial" id="editorial" value="<?php echo $editorial ?>">
		<label for="autor"></label> <input type="number" id="cantidad" name="cantidad" min="0" max="50" id="cantidad" value="<?php echo $cantidad ?>">
		<input type="submit" name="editar2" value="editar">
	</form>
	
	
</body>
</html>