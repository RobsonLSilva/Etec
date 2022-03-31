<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" />
    <title>exercicio 007</title>
</head>

<body>

    <header>
        <h2 class="title">Carrinho de comprar com PHP</h2>
    </header>
    <div class="container">
        <div class="carrinho-container">
            <?php

            $itens = array(
                ['nome' => 'Banana', 'imagem' => 'img/banana.jpg', 'preco' => '1.19'],
                ['nome' => 'Maca', 'imagem' => 'img/maca.jpg', 'preco' => '1.99'],
                ['nome' => 'Laranja', 'imagem' => 'img/laranja.jpg', 'preco' => '1.20']
            );
            foreach ($itens as $key => $value) {

            ?>

                <div class="produto">
                    <p class="nomeProduto"><?php echo $value['nome'] ?></p>
                    <img src="<?php echo $value['imagem'] ?>" alt="teste">
                    <p>R$ <?php echo number_format($value['preco'], 2, ',', '.') ?></p>
                    <a class=" btn btn-info"href="carrinho.php?acao=add&id=<?php echo $key ?>">Adicionar ao carrinho!</a>

                </div>


            <?php
            }

            ?>
        </div>


</body>

</html>