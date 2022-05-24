let banco = openDatabase(
    'db_cadUsuario',
    '1.0',
    'cadastro de usuarios',
    2 * 1024 * 1024);

let form = document.getElementById("register-form");
let submit = document.getElementById("btn-submit");
let select = document.getElementById("btn-select");


function carregarDados() {
    let listar = document.getElementById("listUser");
    banco.transaction(function (tx) {
        tx.executeSql('SELECT * FROM tb_usuarios', [], function (tx, rs) {
            var tamanho = rs.rows.length;
            let i = 0;
            for (i = 0; i < tamanho; i++) {
                texto = '<tr><td>' + rs.rows.item(i).fname + '</td><td>' + rs.rows.item(i).lname + '</td><td>' + rs.rows.item(i).email + '</td></tr>';
                listar.innerHTML += texto;
            }
        }, function (error) {
            alert('Erro no SELECT: ' + error.message);
        });
    });

}


submit.addEventListener('click', function (e) {
    e.preventDefault();
    banco.transaction(function (tx) {
        tx.executeSql('CREATE TABLE IF NOT EXISTS tb_usuarios (email, fname, lname, password)');
        tx.executeSql('INSERT INTO tb_usuarios VALUES (?,?,?,?)', [form.querySelector("#email").value,
        form.querySelector("#fname").value,
        form.querySelector("#lname").value,
        form.querySelector("#password").value]);
    }, function (error) {
        alert('Transaction ERROR: ' + error.message);
    }, function () {
        form.reset();
        alert('Usuário cadastrado!');
    });
});




