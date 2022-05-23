document.addEventListener('deviceready', onDeviceReady, false);

let configbd = {
  name: 'db_cadUsuario.db',
  location: 'default',
  androidDatabaseProvider: 'system'
};

let banco;



let form = document.getElementById("register-form");
let submit = document.getElementById("btn-submit");
let selecionar = document.getElementById("btn-select");

submit.addEventListener('click', function (e) {
  e.preventDefault();
  banco.transaction(function (tx) {
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
});

selecionar.addEventListener('click', function (e) {
  e.preventDefault();
  banco.executeSql("SELECT * FROM tb_usuarios", [], function (tx, rs) {
    alert(JSON.stringify(rs));
    alert(rs.rows.length);
    let i = 0;
    for (i = 0; i < rs.length; i++) {
      alert("item " + i);
      let recordItem = rs.rows.item(i);
      alert(JSON.stringify(recordItem));
    }
  }, function (error) {
    alert('Erro no SELECT: ' + error.message);
  });
});


function onDeviceReady() {

  banco = window.sqlitePlugin.openDatabase(configbd);



  //console.log('Running cordova-' + cordova.platformId + '@' + cordova.version);
  document.getElementById('deviceready').classList.add('ready');
}
