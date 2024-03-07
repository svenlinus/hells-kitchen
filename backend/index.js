const mysql = require("mysql");

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "Tamcross2021"
});





con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});