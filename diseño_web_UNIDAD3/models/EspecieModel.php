<?php
require_once 'config/conexion.php';
class EspecieModel{
    private $db;
    public function __construct(){
        $this->db = Conexion::conectar();
    }
    private function limpiarResultados(){
        while ($this->db->more_results() && $this->db->next_result()) {
            if($result = $this->db->store_result()){
                $result->free();
            }
        }
    }
    public function obtenerTodas(){
        $sql = "SELECT * FROM especie";
        $resultado = $this->db->query($sql);
        while ($fila = $resultado->fetch_assoc()) {
             $datos[] = $fila;
        }
        return $datos; 
    }
    
    public function guardar($nombre){
        $nombre = $this->db->real_escape_string($nombre);
        $sql = "CALL PR_ESPECIE2('$nombre')";
        $exito= $this->db->query($sql);
        $this ->limpiarResultados();
        return $exito;
    }
}
?>