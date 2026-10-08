<?php include 'views/layout/header.php';?>
<h2>
    Lista de especies
</h2>
<a href="index.php?controlador=especie&accion=crear" class="btn btn-primary">
    Nueva Especie
</a>
<table class="table">
    <tr>
        <th>
            ID
        </th>
        <th>
            NOMBRE
        </th>
        <th>
            Acciones
        </th>
    </tr>
    <?php foreach ($datos as $d): ?>
    <tr>
        <td>
            <?= $d['ID'] ?>
        </td>
        <td>
            <?= htmlspecialchars($d['NOMBRE']) ?>
        </td>
        <td colspan="2">
            <a href="" class="btn btn-success">
                Editar
            </a>
            <a href="" class="btn btn-danger">
                Eliminar
            </a>
        </td>
    </tr>
    <?php endforeach; ?>
</table>