<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h2>Resumen del libro registrado</h2>
    <p>
        <strong>Titulo: <?php echo $libro->getTitulo()?></strong>
        <strong>Precio Unitario: <?php echo $libro->getPrecio()?></strong>
        <strong>Cantidad: <?php echo $libro->getCantidad()?></strong>
        <br>
        <h3>Total a pagar: <?php echo $libro->calcularTotal()?></h3>
        <br>
        
    </p>
    <br><a href="index.php?route=formulario">Registrar otro libro</a>
</body>
</html>