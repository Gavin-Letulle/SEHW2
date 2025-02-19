const mysql = require('mysql2');

const connection = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: 'gavsql156',
    database: 'cooking',
});

connection.connect((err => {
    if(err) throw err;
    console.log('MySQL connected successfully!');
}));

module.exports = connection;