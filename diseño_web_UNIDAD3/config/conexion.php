<?php
  class Conexion{
    public static function conectar(){
        $host = "localhost";
        $usuario= "root";
        $password="";
        $base_datos="veterinarios";
        $conexion= new mysqli($host,$usuario,$password,$base_datos);
        if($conexion ->connect_error){
            die("Error en la conexion de base de datos". $conexion->connect_error);
        }
        $conexion->set_charset("utf8mb4");
        return $conexion;
    }
  }
?>