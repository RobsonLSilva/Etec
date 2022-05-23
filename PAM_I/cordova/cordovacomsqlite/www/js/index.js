document.addEventListener('deviceready', onDeviceReady, false);

// DADOS DE CONEXÃO E CRIAÇÃO DA BASE DE DADOS
let configbd = {
  name: 'db_cadUsuario.db',
  location: 'default',
  androidDatabaseProvider: 'system'
};




let form = document.getElementById("register-form");
let submit = document.getElementById("btn-submit");
let selecionar = document.getElementById("listarUser");

function inserir(bd) {
  bd.transaction(function (tx) {
    tx.executeSql('CREATE TABLE IF NOT EXISTS tb_usuarios (email, fname, lname, password)');
    tx.executeSql('INSERT INTO tb_usuarios VALUES (?,?,?,?)', [form.querySelector("#email").value,
    form.querySelector("#fname").value,
    form.querySelector("#lname").value,
    form.querySelector("#password").value]);
  }, function (error) {
    console.log('Transaction ERROR: ' + error.message);
  }, function () {
    form.reset();
    console.log('Populated database OK');
  });
}

function selec() {
  var bd = window.sqlitePlugin.openDatabase(configbd);
  bd.transaction(function (tx) {
    tx.executeSql("select count(email) as cnt from tb_usuarios;", [], function (tx, res) {
      console.log("res.rows.length: " + res.rows.length + " -- should be 1");
      console.log("res.rows.item(0).cnt: " + res.rows.item(0).cnt + " -- should be 1");
    });
  });
}

selecionar.addEventListener("click", function (e) {
  e.preventDefault()
  selec();
});




function onDeviceReady() {
  submit.addEventListener('click', function (e) {
    e.preventDefault();
    // CONEXÃO COM A BASE DE DADOS  
    var banco = window.sqlitePlugin.openDatabase(configbd);
    inserir(banco);
  });

  //console.log('Running cordova-' + cordova.platformId + '@' + cordova.version);
  //document.getElementById('deviceready').classList.add('ready');
}
