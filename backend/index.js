const mysql = require("mysql");
const express = require("express");
const cors = require("cors");

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: process.env.MYSQL_PASSWORD,
  database: "HELLSKITCHEN"
});

db.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});

const app = express();
app.use(cors());

app.listen(8800, () => {
  console.log("backend running on 8800");
});

app.get("/ingredients", (request, response) => {
  const name = request.query.name.toLowerCase();
  const q = `
    SELECT * FROM INGREDIENT
    WHERE lower(ingredient_name) = ?
  `;
  db.query(q, [name], (err, data) => {
    if (err) return response.json(err);
    return response.json(data);
  });
});