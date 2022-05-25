$(document).ready(function () {

  let configbd = {
    name: 'db_cadUsuario.db',
    location: 'default',
    androidDatabaseProvider: 'system'
  };

  let banco;

  document.addEventListener('deviceready', onDeviceReady, false);

  //Abrindo a conexão com o banco de dados
  function onDeviceReady() {
    banco = window.sqlitePlugin.openDatabase(configbd);
  }

  //Criar nova tabela se não existir e inserir novos dados na tabela
  $("#btn-submit").click(function () {
    let email = $("#email").val();
    let fname = $("#fname").val();
    let lname = $("#lname").val();
    let senha = $("#password").val();

    banco.transaction(function (tx) {
      tx.executeSql('CREATE TABLE IF NOT EXISTS tb_usuarios (email, fname, lname, password)');
      tx.executeSql('INSERT INTO tb_usuarios VALUES (?,?,?,?)', [email, fname, lname, senha]);
    }, function (error) {
      alert('Transaction ERROR: ' + error.message);
    }, function () {
      alert('Usuário cadastrado!');
      $("#limpa").click();
    });
  });

  //Busca todos os dados inseridos na tabela do banco de dados e popula a table da pagina listar usuarios
  $("#showTable").click(function () {
    $("#TableData").html("");
    banco.transaction(function (tx) {
      tx.executeSql('SELECT * FROM tb_usuarios', [], function (tx, rs) {
        var len = rs.rows.length, i;
        for (i = 0; i < len; i++) {
          $("#TableData").append("<tr><td>" + rs.rows.item(i).fname + "</td><td>" + rs.rows.item(i).lname + "</td><td>" + rs.rows.item(i).email + "</td></tr>");
        }
      }, null);
    });
  });
  document.getElementById('deviceready').classList.add('ready');
});

