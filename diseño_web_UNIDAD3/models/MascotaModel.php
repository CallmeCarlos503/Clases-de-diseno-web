<?php
 require_once 'config/conexion.php';
 class MascotaModel{
    private $db;
    public function __construct()
    {
        $this->db=Conexion::conectar();
    }
    public function obtenerTodas(){
        
    }
 }
?>