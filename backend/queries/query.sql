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