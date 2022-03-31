<html>
<body>
    <h1>Exercicio 006</h1>
<?php 
    $calculo = ($_POST['n1'] + $_POST['n2'] + $_POST['n3'] + $_POST['n4']) / 4;

    if ($calculo > 7) {
        echo "O aluno: " 
            . $_POST['nome'] 
            . " teve média: " 
            . number_format($calculo, 2, '.', ',')
            . " e foi Aprovado";
    } elseif ($calculo >= 5 && $calculo <= 7) {
        echo "O aluno: " 
            . $_POST['nome'] 
            . " teve média: " 
            . number_format($calculo, 2, '.', ',')
            . " e está Recuperação";
    } else {
        echo "O aluno: " 
        . $_POST['nome'] 
        . " teve média: " 
        . number_format($calculo, 2, '.', ',')
        . " e está Reprovado";
    }
    
?>
</body>
</html>