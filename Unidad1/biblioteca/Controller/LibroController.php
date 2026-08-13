<?php
 require_once './model/Libro.php';
 class LibroController{
    public function mostrarformulario(){
    require_once './View/formulario.php';
    }
    public function procesarFormulario(){
        if(isset($_POST['titulo'])){
            $titulo=$_POST['titulo'];
            $precio=$_POST['precio'];
            $cantidad=$_POST['cantidad'];
            $libro = new Libro($titulo,$precio,$cantidad);
            require_once './View/resultado.php';
        }else{
            header('Location:./index.php?route=formulario');
        }

    }
 }
 
?>