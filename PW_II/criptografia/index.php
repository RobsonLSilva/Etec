<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">

    <title>Criptografando dados</title>
</head>

<body>

    <h2>Digite uma senha para criptografar e salvar na base de dados</h2>
    <form action="criptografia.php" method="post">
        <div>
            <label for="lname">Senha:</label><br>
            <input type="password" id="senha" name="senha" placeholder="Password"><br><br>

        </div>
        <h2>Escolha uma das Criptografias abaixo:</h2>
        <div>
            <input type="radio" id="md5" name="cripto" value=1 checked="checked">
            <label for="md5">MD5</label><br>
            <input type="radio" id="sha1" name="cripto" value=2>
            <label for="sha1">SHA1</label><br>
            <input type="radio" id="alg" name="cripto" value=3>
            <label for="alg">Algoritmo Genérico</label><br>
            <input type="radio" id="base64" name="cripto" value=4>
            <label for="alg">BASE64</label><br><br>
        </div>
        <button type="submit">Salvar na base</button>
    </form>
    <br>
    <hr />
    <div>
        <h2> Qual é a diferença entre MD5 e SHA1?</h2>
        <p>
            O md5 gera uma string alfa-numérica de 32 caracteres, não importa se você tá gerando o md5 de duas letras ou de um texto de 20 parágrafos… O md5 gerado sempre vai ter 32 caracteres.
        </p>
        <p>
            O sha1 é praticamente identico ao md5, só que tem 160 bits, o que acaba criando uma string-resultado maior: 40 caracteres alfa-numéricos.
        </p>
        <p>A diferença crucial entre o MD5 e o SHA1 é que o MD5 foi desenvolvido anteriormente e tinha várias vulnerabilidades nas quais é possível criar colisões para o resumo da mensagem. Por outro lado, SHA1 trouxe muitas melhorias em hashing e é melhor que MD5.</p>
    </div>
    <br>
    <hr />
    <div>
        <h2>Pesquisa aluno</h2>
        <form action="pesquisa.php" method="post">
            <label for="busca">Buscar</label>
            <input type="search" id="busca" name="pesquisa">
            <button type="submit">Pesquisar</button>
        </form>
    </div>



</body>

</html>