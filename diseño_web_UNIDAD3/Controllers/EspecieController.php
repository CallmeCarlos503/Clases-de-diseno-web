<?php
require_once 'models/EspecieModel.php';

class EspecieController
{
    public function index()
    {
        $modelo = new EspecieModel();
        $datos = $modelo->obtenerTodas();
        require_once 'views/especies/index.php';
    }
    public function crear()
    {
        require_once 'views/especies/crear.php';
    }
    public function guardar()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST' && !empty($_POST['nombre'])) {
            $modelo = new EspecieModel();
            $modelo->guardar($_POST['nombre']);
            header('Location: index.php?controlador=especie&accion=index');
            exit;
        }
    }
    public function editar()
    {
        if (isset($_GET['id'])) {
            $modelo = new EspecieModel();
            $especie = $modelo->obtenerporID($_GET['id']);
            require_once 'views/especies/editar.php';
        }
    }
    public function actualizar()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['id'], $_POST['nombre'])) {
            $modelo = new EspecieModel();
            $modelo->actualizar($_POST['id'], $_POST['nombre']);
            header('Location: index.php?controlador=especie&accion=index');
            exit;
        }
    }
    public function eliminar()
    {
        try {
            if (isset($_GET['id'])) {
                $modelo = new EspecieModel();
                $modelo->eliminar($_GET['id']);
                header('Location: index.php?controlador=especie&accion=index');
                exit;
            }
        } catch (Exception $ex) {
            
        }
    }
}
