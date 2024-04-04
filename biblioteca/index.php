<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>documento</title>
	<style type="text/css">
		table,th,td{

			border:1px solid black;
			border-collapse:collapse;
		}
	</style>
</head>
<body>
	<form action="php_biblio/insertar.php" method="POST">
		<table>
			<tr>
				<th>autor</th>
				<label for="autor"></label> <input type="text" name="autor" id="autor" >
			</tr>
		</table>
		
		<table>
			<tr>
				<th>libro</th>

				<label for="libro"></label> <input type="text" name="libro" id="libro" >
			</tr>
		</table>
		

		
		<table>
			<tr>
				<th>editorial</th>
		

			</tr>
			<label for="editorial"></label> <input type="text" name="editorial" id="editorial" >
		</table>
		
		<table>
			<tr>
				<th>cantidad</th>
				
			</tr>
			<label for="autor"></label> <input type="number" id="cantidad" name="cantidad" min="0" max="50" id="cantidad" >
		</table>
		<input type="submit" name="registrar" value="registrar">
	</form>

	<form action="php_biblio/buscador.php" method="GET">
		
		<input type="submit" name="enviar al buscador" value="buscar">
		<br> <br> <br>


	</form>

	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>autor</th>
				<th>libro</th>
				<th>editorial</th>
				<th>cantidad</th>
				<th>ELIMINAR</th>
				<th>EDITAR</th>
			</tr>
		</thead>
		<tbody>
			<?php

			include("php_biblio/conexion.php");
			$getmysql = new mysqlconex();
			$getconex = $getmysql->conex();
			$consulta = "SELECT * FROM libros_biblioteca ";
			$resultado = mysqli_query($getconex,$consulta);
			while ($fila=mysqli_fetch_row($resultado)) {
				echo "<tr>";
				echo "<td>" . $fila[0]."</td>";
				echo "<td>" . $fila[1]."</td>";
				echo "<td>" . $fila[2]."</td>";
				echo "<td>" . $fila[3]."</td>";
				echo "<td>" . $fila[4]."</td>";
				echo "<td>
						<form action = php_biblio/eliminar.php method ='POST'>
						<input type = 'hidden' name = 'id' value ='".$fila[0] . "'>
						<input type = 'hidden' name= 'autor' value ='".$fila[1]."'>
						<input type = 'hidden' name= 'libro' value ='".$fila[2]."'>
						<input type  ='hidden' name= 'editorial' value ='".$fila[3]."'>
						<input type= 'hidden' name= 'cantidad' value ='".$fila[4]."'>
						<input type = 'submit' name = 'eliminar' value='eliminar' onclick=' return confirmacion()'>
						</form>
					</td>";
					echo "<td>
						<form action = php_biblio/editar.php method ='POST'>
						<input type = 'hidden' name = 'id' value ='".$fila[0] . "'>
						<input type = 'hidden' name= 'autor' value ='".$fila[1]."'>
						<input type = 'hidden' name= 'libro' value ='".$fila[2]."'>
						<input type  ='hidden' name= 'editorial' value ='".$fila[3]."'>
						<input type= 'hidden' name= 'cantidad' value ='".$fila[4]."'>
						<input type = 'submit' name = 'editar2' value = 'editar' >
						</form>
					</td>";
				echo "</tr>";
				// code...
			}
			mysqli_close($getconex);
			?>

		</tbody>


	</table>

	<input type="button" name="actualizar" value="actualizar" onclick="document.location.reload();">	
</body>
</html>