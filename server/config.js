const mysql = require('mysql')
const db = mysql.createConnection({
host: "localhost",
user: "root",
password: "123",
database:"shopsmart2" 
})

db.connect((err) => {
if (err) throw err;
else {
    console.log("MySQL Connected Successfully!");
}
});

module.exports = db;