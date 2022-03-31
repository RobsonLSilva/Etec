<?php
session_start();

if (!isset($_SESSION['carrinho'])) {
    $_SESSION['carrinho'] = array();
}
$total = 0.0;
$desconto = 0.0;
//adicionar produto

if (isset($_GET['acao'])) {

    //adicionar ao carrinho
    if ($_GET['acao'] == 'add') {
        $id = intval($_GET['id']);
        if (!isset($_SESSION['carrinho'][$id])) {
            $_SESSION['carrinho'][$id] = 1;
        } else {
            $_SESSION['carrinho'][$id] += 1;
        }
    }

    //remover do carrinho
    if ($_GET['acao'] == 'del') {
        $id = intval($_GET['id']);
        if (isset($_SESSION['carrinho'][$id])) {
            unset($_SESSION['carrinho'][$id]);
        }
    }

    //alterar quantidade
    if ($_GET['acao'] == 'up') {
        if (is_array($_POST['prod'])) {
            foreach ($_POST['prod'] as $id => $qtd) {
                $id = intval($id);
                $qtd = intval($qtd);
                if (!empty($qtd) || $qtd <> 0) {
                    $_SESSION['carrinho'][$id] =  $qtd;
                } else {
                    unset($_SESSION['carrinho'][$id]);
                }
            }
        }
    }
}



?>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" />
    <title>Document</title>
</head>

<body>

    <div class="container">
        <div class="card mt-5">
            <div class="card-body">
                <h4 class="card-title">Carrinho</h4>
                <a href="index.php">Lista de Produtos</a>
            </div>
        </div>

        <form action="carrinho.php" method="POST">
            <label>Forma de pagamento:
                <select class="escolha" id="escolha" name="escolha">
                    <option value="0" disabled selected>Escolha uma opção</option>
                    <option value="1">Pix</option>
                    <option value="2">Débito</option>
                    <option value="3">Crédito</option>
                </select>
                <input class="btn btn-info" type="submit" value="Escolher" />
            </label>
        </form>
        <table class="table table-strip">
            <thead>
                <tr>
                    <th width="244">Produto</th>
                    <th width="79">Quantidade</th>
                    <th width="89">Pre&ccedil;o</th>
                    <th width="100">Subtotal</th>
                    <th width="64">Remover</th>
                </tr>
            </thead>
            <form action="?acao=up" method="post">
                <tbody>
                    <?php
                    $itens = array(
                        ['nome' => 'Banana', 'preco' => '1.19'],
                        ['nome' => 'Maca', 'preco' => '1.99'],
                        ['nome' => 'Laranja', 'preco' => '1.20']
                    );

                    if (count($_SESSION['carrinho']) == 0) {
                        echo '<tr><td colspan="5">Não há produto no carrinho</td></tr>';
                    } else {

                        foreach ($_SESSION['carrinho'] as $id => $qtd) {
                            $nome           = $itens[$id]['nome'];
                            $preco          = number_format($itens[$id]['preco'], 2, ',', '.');
                            $sub            = number_format($itens[$id]['preco'] * $qtd, 2, ',', '.');
                            $total += floatval($itens[$id]['preco'] * $qtd);

                            echo '
                            <tr>
                                <td>' . $nome . '</td>
                                <td><input type="text" size="3" name="prod[' . $id . ']" value="' . $qtd . '" /></td>
                                <td>R$ ' . $preco . '</td>
                                <td>R$ ' . $sub . '</td>
                                <td><a href="?acao=del&id=' . $id . '">Remove</a></td>
                            </tr>
                        ';
                        }
                        //Calcular desconto

                        $escolha = isset($_POST['escolha']);
                        if ($escolha == "1") {
                            $desconto = $total * 0.02;
                            //var_dump($total);
                        }
                        $total -= $desconto;
                        $total = number_format($total, 2, ',', '.');

                        $desconto = number_format($desconto, 2, ',', '.');
                        echo '
                        <tr>
                            <td colspan="5" class="text-right">Desconto</td>
                            <td>R$ ' . $desconto . '</td>
                        </tr>
                        <tr>
                            <td colspan="5" class="text-right">Total</td>
                            <td>R$ ' . $total . '</td>
                        </tr>
                    ';
                    }

                    ?>
                </tbody>

                <tfoot>
                    <tr>
                        <td colspan="5"><input type="submit" value="Atualizar Carrinho" /> </td>

                    </tr>
                    <td colspan="5"><a class="btn btn-info" href="index.php">Continuar Comprando</a></td>
                    <td colspan="5"><a class="btn btn-info" href="finalizarCompra.php">Finalizar Compra</a></td>
                </tfoot>
            </form>

        </table>
    </div>
    
</body>

</html>