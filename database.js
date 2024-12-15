let mysql = require('mysql')

let db = mysql.createPool({
    connectionLimit: 5,
    host:'localhost',
    user:'root',
    password:'',
    database:'musik'
})

module.exports = db
