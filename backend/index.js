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
  const nameLike = request.query.name.toLowerCase();
  const q = nameLike 
    ?  `SELECT * FROM INGREDIENT
        WHERE lower(ingredient_name) LIKE ?`
    : `SELECT * FROM INGREDIENT;`;
  db.query(q, [`%${nameLike}%`], (err, data) => {
    if (err) return response.json(err);
    return response.json(data);
  });
});

app.get("/ingredients/full", (request, response) => {
  const nameLike = request.query.name?.toLowerCase();
  const defaultQuery = `
    SELECT 
    INGREDIENT.ingredient_name, INGREDIENT.ingredient_type, ingredient_cost, 
    is_vegan, is_kosher, is_gluten_free, is_dairy_free, is_halal, is_nut_free, is_vegetarian, is_pescatarian,
    sugar_amt, fat_amt, protein_amt, carb_amt,
    is_bitter, is_sweet, is_salty, is_sour, is_umami
    FROM INGREDIENT
    JOIN RESTRICTION ON INGREDIENT.ingredient_name = RESTRICTION.ingredient_name
    JOIN NUTRITION ON INGREDIENT.ingredient_name = NUTRITION.ingredient_name
    JOIN FLAVORPROFILE ON INGREDIENT.ingredient_name = FLAVORPROFILE.ingredient_name
  `;
  const q = nameLike 
    ?  `${defaultQuery}
        WHERE lower(INGREDIENT.ingredient_name) LIKE ?;`
    : defaultQuery + ';';
  db.query(q, [`%${nameLike}%`], (err, data) => {
    if (err) return response.json(err);
    return response.json(data);
  });
});