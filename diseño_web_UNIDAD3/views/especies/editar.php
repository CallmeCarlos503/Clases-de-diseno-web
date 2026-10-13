<?php include 'views/layout/header.php'?>
<h2>
    Editar Especie 
</h2>
<form action="index.php?controlador=especie&accion=actualizar" method="post">
    <input type="hidden" name="id" value="<?=$especie['ID'] ?>">
    Nombre: <input type="text" name="nombre" value="<?= $especie['NOMBRE'] ?>" required id="">
    <button type="submit" class="btn btn-success">Actualizar</button>
    <a href="index.php?controlador=especie&accion=index" class="btn btn-primary">Cancelar</a>
</form>
<?php include 'views/layout/footer.php';?>