<?php
require_once 'Controller/LibroController.php';
$controller = new LibroController();
$route=$_GET['route'] ?? 'formulario';
switch ($route){
    case 'formulario':
        $controller->mostrarformulario();
        break;
    case 'procesar':
        $controller ->procesarFormulario();
        break;
    default:
    echo "404 - pagina no encontrada";
    break;
}
?>