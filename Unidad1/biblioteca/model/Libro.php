<?php
    class Libro{
    private $titulo;
    private $precio;
    private $cantidad;

    public function __construct($titulo,$precio,$cantidad){
        $this -> titulo= $titulo;
        $this ->precio = $precio;
        $this -> cantidad= $cantidad;
    }
    public function getTitulo(){
         return $this->titulo;
    }
    public function getPrecio(){
        return $this->precio;
    }
    public function getCantidad(){
        return $this->cantidad;
    }
    public function calcularTotal(){
        return $this->precio*$this->cantidad;
    }
    }
    
?>