<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculadora de numeros</title>
</head>
<body>
    <h2>Calculadora simple</h2>
    <form action="resultados.php" method="post">
        <label for="">Numero 1: </label>
        <input type="number" name="num1" step="any" id="">
        <label for="">Numero 2: </label>
        <input type="number" name="num2" step="any" id="">
        <label for=""> Operacion: </label>
        <select name="operacion" id="">
            <option value="suma">Suma</option>
            <option value="resta">Resta</option>
            <option value="multiplicacion">Multiplicacion</option>
            <option value="division">Division</option>
        </select>
        <button type="submit">Calcular</button>
    </form>
</body>
</html>