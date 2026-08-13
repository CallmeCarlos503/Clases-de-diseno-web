<?php

 class Controller{
    public function procesar(){
        $num1 = $_POST['num1'];
        $num2 = $_POST['num2'];
        $operacion = $_POST['operacion'];
        $model= new Model();
        $resultado =0;
        if($operacion =="suma"){
            $resultado = $model ->suma($num1,$num2);
        }else if($operacion=="resta"){
            $resultado = $model ->resta($num1,$num2);
        }else if($operacion=="multiplicacion"){
            $resultado = $model ->multiplicar($num1,$num2);
        }elseif ($operacion == "division") {
            $resultado = $model ->division($num1,$num2);
        }
        require_once './views/ViewResultado.php';
    }
 }
?>