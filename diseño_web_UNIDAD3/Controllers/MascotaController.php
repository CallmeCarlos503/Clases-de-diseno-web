<?php 
require_once 'models/MascotaModel.php';
class MascotaController{
    public function index(){
        $modelo= new MascotaModel();
        $datos = $modelo->obtenerTodas();
        require_once 'views/mascotas/index.php';
    }
}
?>