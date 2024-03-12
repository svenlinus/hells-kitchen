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

app.get('/recipes', (req, res) => {
  const ingredients = req.query.ingredients.split(',');

  if (!ingredients || !Array.isArray(ingredients) || ingredients.length === 0) {
    return res.status(400).json({ error: 'Invalid or missing ingredients in the request' });
  }

  const query = `
    SELECT DISTINCT(ST.recipe_id), ST.recipe_name, ST.difficulty, ST.origin, ROUND(SUM(ingredient_cost), 2) as cost
    FROM (
      SELECT DISTINCT(RECIPE.recipe_id), recipe_name, difficulty, origin FROM RECIPE
      JOIN INGREDIENTLIST ON RECIPE.recipe_id = INGREDIENTLIST.recipe_id
      WHERE INGREDIENTLIST.ingredient_name IN (?)
    ) ST
    JOIN INGREDIENTLIST ON ST.recipe_id = INGREDIENTLIST.recipe_id
    JOIN INGREDIENT ON INGREDIENTLIST.ingredient_name = INGREDIENT.ingredient_name
    GROUP BY ST.recipe_id;
  `;

  db.query(query, [ingredients], (err, data) => {
    if (err) {
      console.error('Error executing MySQL query: ' + err.message);
      return res.status(500).json({ error: 'Internal Server Error' });
    }

    res.json(data);
  });
});

app.get("/ingredients", (request, response) => {
  const nameLike = request.query.name?.toLowerCase();
  const recipeId = request.query.recipe;

  let q = `SELECT * FROM INGREDIENT;`;
  let arg = '';

  if (nameLike?.length > 0) {
    arg = `%${nameLike}%`
    q = `
      SELECT * FROM INGREDIENT
      WHERE lower(ingredient_name) LIKE ?;
    `;
  } 
  else if (recipeId) {
    arg = recipeId;
    q = `
      SELECT INGREDIENT.ingredient_name, INGREDIENT.ingredient_type, ingredient_cost
      FROM INGREDIENT
      JOIN INGREDIENTLIST ON INGREDIENT.ingredient_name = INGREDIENTLIST.ingredient_name
      WHERE INGREDIENTLIST.recipe_id = ?;
    `;
  }
  db.query(q, [arg], (err, data) => {
    if (err) return response.json(err);
    return response.json(data);
  });
});

app.get("/steps", (request, response) => {
  const recipeId = request.query.recipe;

  const q = `
    SELECT step_number, prep_time, cook_time, step_descript
    FROM RECIPESTEP
    WHERE recipe_id = ?
    ORDER BY step_number;
  `;

  db.query(q, [recipeId], (err, data) => {
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