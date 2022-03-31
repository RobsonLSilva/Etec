<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exercícios de 01 à 03</title>
</head>
<body>
    <h1>Exercícios de 01 à 03</h1>
    <?php  
        $nome = "robson";
        $peso = 67;
        $alturaPessoa = 1.68;
        $volumeAzul = 0;
        $volumeVerde = 0;
        $raio1 = 5;
        $raio2 = 3;
        $altura1 = 12;
        $altura2 = 18;
        const PI = 3.14;

        echo strtoupper($nome); // função strtoupper() converte a string em Maiuscula.
        echo "<br/>";
        echo strtolower($nome); // função strtolower() converte a string em minuscula.
        echo "<br/>";
        echo strlen($nome);     // função strlen() faz a contagem dos caracteres contidos na string.
        echo "<br/>";
        $vogais = array("a", "e", "i", "o", "u", "A", "E", "I", "O", "U"); // guarda todas as vogais em um array
        $consoantes = str_replace($vogais, "", $nome); // substitui todas as vogais por "" nada.
        echo "$consoantes"; // imprime apenas as consoantes
        echo "<br/>";
        $aux = str_replace(substr($nome, 2, 1), strtoupper(substr($nome, 2, 1)), $nome); //substitui a 3 letra minuscula por maiuscula
        echo ucfirst($aux); //printa o conteudo da variavel aux e coloca a primeira letra da palavra maiuscula
        echo "<br/><br/>";
        $imc = $peso / ($alturaPessoa * $alturaPessoa); 
        
        if ($imc > 40) {
            echo "Imc: ".number_format($imc, 2,'.',',')." - Obesidade III (mórbida)";
        } elseif ($imc >= 35 && $imc <= 35.99){
            echo "Imc: ".number_format($imc, 2, '.', ',')." - Obesidade II (severa)";
        } elseif ($imc >= 30 && $imc <= 34.99){
            echo "Imc: ".number_format($imc, 2, '.', ',')." - Obesidade I";
        } elseif ($imc >= 25 && $imc <= 29.99){
            echo "Imc: ".number_format($imc, 2, '.', ',')." - Acima do peso";
        } elseif ($imc >= 18.5 && $imc <= 24.99){
            echo "Imc: ".number_format($imc, 2, '.', ',')." - Peso normal";
        } elseif ($imc >= 17 && $imc <= 18.49){
            echo "Imc: ".number_format($imc, 2, '.', ',')." - Abaixo do peso";
        } else {
            echo "Imc: ".number_format($imc, 2, '.', ',')." - Muito abaixo do peso";
        }
        echo "<br/><br/>";


        // V = π * r² * h  Formula de calculo de volume
        
        $volumeAzul = PI * pow($raio1, 2) * $altura1;
        $volumeVerde = PI * pow($raio2, 2) * $altura2;

        if ($volumeAzul > $volumeVerde) {
            echo "Volume do copo azul: " . $volumeAzul . "cm³<br/>Volume do copo verde: " . $volumeVerde . "cm³<br/>";
            echo "O copo azul tem o maior volume, pois volume do copo verde é menor que o do azul.";
        } else {
            echo "O copo verde tem o maior volume, pois o volume do copo azul é menor que o do verde.";
        }
    ?>
</body>
</html>