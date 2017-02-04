const mysql = require('mysql');

const client = mysql.createConnection({
    user: 'root',
    password: 'gkswogus15',
    database: 'market'
});

module.exports = client;