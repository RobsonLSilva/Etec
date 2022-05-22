<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <link rel="stylesheet" href="css/style.css"> -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <title>Pesquisa</title>
</head>

<body>
    <p><a href="index.php">Voltar</a>
    <p>
        <?php
        include_once "bd.php";
        try {
            $pdo = new PDO("mysql:host=" . DB_HOST . "; dbname=" . DB_NAME, DB_USER, DB_PASSWORD);
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
            $stmt = $pdo->prepare("CALL Selecionar_alunos(:pesquisa)");
            $stmt->bindParam(':pesquisa', $pesquisa);
            $pesquisa =  $_POST['pesquisa'];
            $stmt->execute();
        ?>
    <div class="container theme-showcase" role="main">
        <h1>Alunos encontados</h1>
        <table class="table table-strip">
            <thead>
                <tr>
                    <th scope="col">Código</th>
                    <th scope="col">Nome</th>
                </tr>
            </thead>
            <tbody class="table-group-divider">
                <?php while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    echo '<tr>';
                    echo '<td scope="row">' . $row['id'] . '</td>';
                    echo '<td scope="row">' . $row['nome'] . '</td>';
                    echo '</tr>';
                }
                ?>
            </tbody>
    </div>
    </table>
    </div>
<?php
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
        }
        $pdo = null;
?>
</body>

</html>