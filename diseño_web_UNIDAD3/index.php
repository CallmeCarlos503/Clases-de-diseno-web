<?php

if (isset($_GET['controlador'])) {
    $controladorURL =$_GET['controlador'];
}else{
    $controladorURL = 'especie';
}
$nombreClase = ucfirst($controladorURL).'Controller';
$archivoControlador = "Controllers/".$nombreClase. ".php";

if (isset($_GET['accion'])) {
    $accion = $_GET['accion'];
}else{
    $accion = 'index';
}

if (!file_exists($archivoControlador)) {
    die("Error 404: No se encuentra el archivo Controlador $archivoControlador");
}
require_once $archivoControlador;

if(!class_exists($nombreClase)){
    die("Error: La accion $accion no existe en el controlador $nombreClase");

}
$controlador = new $nombreClase();
$controlador ->$accion();
?>