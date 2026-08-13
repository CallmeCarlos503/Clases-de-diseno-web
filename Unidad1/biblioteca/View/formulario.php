<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="index.php?route=procesar" method="post">
        <label for="">Titulo del libro</label>
        <input type="text" name="titulo" id="" required>
        <label for="">Precio ($)</label>
        <input type="number" name="precio" step="0.01" id="" required>
        <label for="">Cantidad:</label>
        <input type="number" name="cantidad" id="" required>
        <button type="submit">
            Calcular y Guardar
        </button>
    </form>
</body>
</html>