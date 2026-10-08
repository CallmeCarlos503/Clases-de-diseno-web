<?php
 require_once 'models/EspecieModel.php';
 class EspecieController{
    public function index(){
        $modelo = new EspecieModel();
        $datos= $modelo->obtenerTodas();
        require_once 'views/especies/index.php';
    }
    public function crear(){
        require_once 'views/especies/crear.php';
    }
    public function guardar(){
        if($_SERVER['REQUEST_METHOD']=='POST' && !empty($_POST['nombre'])){
            $modelo = new EspecieModel();
            $modelo -> guardar($_POST['nombre']);
            header('Location: index.php?controlador=especie&accion=index');
            exit;
        }
    }
 }
?>