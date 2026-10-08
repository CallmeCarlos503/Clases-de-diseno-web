<?php include 'views/layout/header.php'; ?>
<h2>Nueva especie</h2>
<form action="index.php?controlador=especie&accion=guardar" method="POST">
    nombre: <input type="text" name="nombre" id="" required> <br><br>
    <button type="submit" class="btn btn-success">Guardar</button>
    <a href="index.php?controlador=especie&accion=index" class="btn btn-danger">cancelar</a>
</form>
<?php include 'views/layout/footer.php'; ?>