SELECT 
INGREDIENT.ingredient_name, INGREDIENT.ingredient_type, ingredient_cost, 
is_vegan, is_kosher, is_gluten_free, is_dairy_free, is_halal, is_nut_free, is_vegetarian, is_pescatarian,
sugar_amt, fat_amt, protein_amt, carb_amt
is_bitter, is_sweet, is_salty, is_sour, is_umami
FROM INGREDIENT
JOIN RESTRICTION ON INGREDIENT.ingredient_name = RESTRICTION.ingredient_name
JOIN NUTRITION ON INGREDIENT.ingredient_name = NUTRITION.ingredient_name
JOIN FLAVORPROFILE ON INGREDIENT.ingredient_name = FLAVORPROFILE.ingredient_name
WHERE lower(INGREDIENT.ingredient_name) LIKE '%pp%';

SELECT DISTINCT(ST.recipe_id), ST.recipe_name, ST.difficulty, ST.origin, ROUND(SUM(ingredient_cost), 2) as cost
FROM (
	SELECT DISTINCT(RECIPE.recipe_id), recipe_name, difficulty, origin FROM RECIPE
  JOIN INGREDIENTLIST ON RECIPE.recipe_id = INGREDIENTLIST.recipe_id
  WHERE INGREDIENTLIST.ingredient_name IN ('Pasta', 'Lemon', 'Tomato Sauce')
) ST
JOIN INGREDIENTLIST ON ST.recipe_id = INGREDIENTLIST.recipe_id
JOIN INGREDIENT ON INGREDIENTLIST.ingredient_name = INGREDIENT.ingredient_name
GROUP BY ST.recipe_id;


SELECT INGREDIENT.ingredient_name, INGREDIENT.ingredient_type, ingredient_cost
FROM INGREDIENT
JOIN INGREDIENTLIST ON INGREDIENT.ingredient_name = INGREDIENTLIST.ingredient_name
WHERE INGREDIENTLIST.recipe_id = 1;

SELECT step_number, prep_time, cook_time, step_descript
FROM RECIPESTEP
WHERE recipe_id = 2
ORDER BY step_number;

SELECT DISTINCT(ingredient_type) FROM INGREDIENT;

INSERT INTO INGREDIENT (ingredient_name, ingredient_type, ingredient_cost)
VALUES ('Squid', 'Seafood', 5.15);
INSERT INTO FLAVORPROFILE (ingredient_name, is_bitter, is_sweet, is_salty, is_sour, is_umami)
VALUES ('Squid', FALSE, FALSE, TRUE, FALSE, TRUE);
INSERT INTO NUTRITION (ingredient_name, sugar_amt, fat_amt, protein_amt, carb_amt)
VALUE ('Squid', 0, 10, 9, 2);