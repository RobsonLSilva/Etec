<?php

include_once "algoritimoGenerico.php";
include_once "bd.php";

echo '<p><a href="index.php">Voltar</a><p>';
try {
  $pdo = new PDO("mysql:host=" . DB_HOST . "; dbname=" . DB_NAME, DB_USER, DB_PASSWORD);
  $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  $pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
  $stmt = $pdo->prepare("INSERT INTO teste_php (senha, senha_original, tipo_cript) VALUES (:senha, :senha_original, :tipo_cript)");
  $stmt->bindParam(':senha', $senha);
  $stmt->bindParam(':senha_original', $senha_original);
  $stmt->bindParam(':tipo_cript', $tipo_cript);

  // insert a row
  switch ($_POST['cripto']) {
    case 1:
      $senha =  md5($_POST['senha']);
      $senha_original =  $_POST['senha'];
      $tipo_cript = 'MD5';
      $stmt->execute();
      echo "O registro foi gravado com sucesso na base de dados." . "<br>";
      echo "Senha criptografada: " . $senha;
      break;

    case 2:
      $senha =  sha1($_POST['senha']);
      $senha_original =  $_POST['senha'];
      $tipo_cript = 'SHA1';
      $stmt->execute();
      echo "O registro foi gravado com sucesso na base de dados." . "<br>";
      echo "Senha criptografada: " . $senha;
      break;

    case 3:
      $senha =  criptografarSenha(8, $_POST['senha']);
      $senha_original =  $_POST['senha'];
      $tipo_cript = 'Algoritimo generico';
      $stmt->execute();
      echo "O registro foi gravado com sucesso na base de dados." . "<br>";
      echo "Senha criptografada: " . $senha;
      break;
    case 4:
      $senha =  base64_encode($_POST['senha']);
      $senha_original =  $_POST['senha'];
      $tipo_cript = 'BASE64';
      $stmt->execute();
      echo "O registro foi gravado com sucesso na base de dados." . "<br>";
      echo "Senha criptografada: " . $senha;
      break;
  }
 
} catch (PDOException $e) {
  echo "Error: " . $e->getMessage();
}
$pdo = null;
