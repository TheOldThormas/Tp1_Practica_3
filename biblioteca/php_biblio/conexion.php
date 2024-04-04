<?php

class mysqlconex{

	public function conex(){

	$enlace=mysqli_connect('127.0.0.1','gabriel','123','bibliotecas');
	return $enlace;
	}


}





?>