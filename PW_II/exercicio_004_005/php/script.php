<html>
<body>
<?php 
    $lista = array(1.90,2.90,3.90,4.90,5.90,6.90,7.90,8.90,10.50);
    $calculo = $_POST['alcool'] / $_POST['gasolina'];

    if ($calculo >= 0.70) {
        echo "No momento é mais vantajoso abastecer seu veiculo com Alcool.<br/>
              Percentual: " . number_format($calculo * 100, 0, '.', ',') . "%";
    } else {
        echo "No momento é mais vantajoso abastecer seu veiculo com Gasolina.<br/>
              Percentual: " . number_format($calculo * 100, 0, '.', ',') . "%";
    }
    echo "<br/><br/>";
    echo "Valores que seriam vantajosos ou não abastecer com alcool<br/>";

    foreach ($lista as $value) {
        $calculo1 = $value / $_POST['gasolina'];

       if ($calculo1 < 0.70) {
        echo "R$ " . number_format($value, 2, '.', ',') . " Sim<br/>";    
       } else {
        echo "R$ " . number_format($value, 2, '.', ',') . " Não<br/>";
       }
    }

   
        
?>
</body>
</html>
