// Wait for the deviceready event before using any of Cordova's device APIs.
// See https://cordova.apache.org/docs/en/latest/cordova/events/events.html#deviceready
document.addEventListener('deviceready', onDeviceReady, false);

function onDeviceReady() {
    // Cordova is now initialized. Have fun!
    // DADOS DE CONEXÃO E CRIAÇÃO DA BASE DE DADOS
    let configbd = {
        name: 'db_cadproduto.db',
        location: 'default',
        androidDatabaseProvider: 'system'
      };

    // CONEXÃO COM A BASE DE DADOS  
    var banco = window.sqlitePlugin.openDatabase(configbd);

    banco.transaction(function(tx) {
        tx.executeSql('CREATE TABLE IF NOT EXISTS DemoTable (name, score)');
        tx.executeSql('INSERT INTO DemoTable VALUES (?,?)', ['Alice', 101]);
        tx.executeSql('INSERT INTO DemoTable VALUES (?,?)', ['Betty', 202]);
      }, function(error) {
        console.log('Transaction ERROR: ' + error.message);
      }, function() {
        console.log('Populated database OK');
      });

    banco.transaction(function(tx) {
        tx.executeSql('SELECT count(*) AS mycount FROM DemoTable', [], function(tx, rs) {
          console.log('Record count (expected to be 2): ' + rs.rows.item(0).mycount);
        }, function(tx, error) {
          console.log('SELECT error: ' + error.message);
        });
      });


    console.log('Running cordova-' + cordova.platformId + '@' + cordova.version);
    document.getElementById('deviceready').classList.add('ready');
}
