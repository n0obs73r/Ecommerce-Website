<?php
$servername="localhost";
$username="u908947830_customerdash";
$password="utoGNTe5@4";
$database="u908947830_website";
$con=new mysqli($servername,$username,$password,$database);
if($con->connect_error)
{
	die("connection failed".$con->connect_error);
}
?>