-- Gordon Ramseys Recipe Database
DROP DATABASE IF EXISTS HELLSKITCHEN;
CREATE DATABASE HELLSKITCHEN;
USE HELLSKITCHEN;

CREATE TABLE IF NOT EXISTS INGREDIENT (
	ingredient_name VARCHAR(50),
    ingredient_type VARCHAR(50),
    ingredient_cost FLOAT,
    PRIMARY KEY (ingredient_name)
);

CREATE TABLE IF NOT EXISTS RESTRICTION (
	ingredient_name VARCHAR(50),
	ingredient_type VARCHAR(50),
    is_vegan BOOLEAN,
    is_kosher BOOLEAN,
    is_gluten_free BOOLEAN,
    is_dairy_free BOOLEAN,
    is_halal BOOLEAN,
    is_nut_free BOOLEAN,
    is_vegetarian BOOLEAN,
    is_pescatarian BOOLEAN,
	PRIMARY KEY (ingredient_name, ingredient_type),
    FOREIGN KEY (ingredient_name) REFERENCES INGREDIENT(ingredient_name)
);

CREATE TABLE IF NOT EXISTS INVENTORY (
	ingredient_name VARCHAR(50),
    inventory_amt FLOAT,
    PRIMARY KEY (ingredient_name),
    FOREIGN KEY (ingredient_name) REFERENCES INGREDIENT(ingredient_name)
);

CREATE TABLE IF NOT EXISTS NUTRITION (
	ingredient_name VARCHAR(50),
	sugar_amt FLOAT,
    fat_amt FLOAT,
    protein_amt FLOAT,
    carb_amt FLOAT,
    PRIMARY KEY (ingredient_name),
    FOREIGN KEY (ingredient_name) REFERENCES INGREDIENT(ingredient_name)
);

CREATE TABLE IF NOT EXISTS FLAVORPROFILE (
	ingredient_name VARCHAR(50),
    is_bitter BOOLEAN,
    is_sweet BOOLEAN,
    is_salty BOOLEAN,
    is_sour BOOLEAN,
    is_umami BOOLEAN,
	PRIMARY KEY (ingredient_name),
    FOREIGN KEY (ingredient_name) REFERENCES INGREDIENT(ingredient_name)
);

CREATE TABLE IF NOT EXISTS RECIPE (
	recipe_id INT,
    difficulty VARCHAR(15),
    recipe_name VARCHAR(50),
    origin VARCHAR(50),
    PRIMARY KEY(recipe_id)
    );

CREATE TABLE IF NOT EXISTS INGREDIENTLIST (
	recipe_id INT,
	ingredient_name VARCHAR(50),
    ingredient_amt FLOAT,
    PRIMARY KEY (recipe_id, ingredient_name),
    FOREIGN KEY (ingredient_name) REFERENCES INGREDIENT(ingredient_name),
    FOREIGN KEY (recipe_id) REFERENCES RECIPE(recipe_id)
);

CREATE TABLE IF NOT EXISTS RECIPESTEP (
	step_number INT,
    recipe_id INT,
    ingredient_name VARCHAR(50),
    step_descript VARCHAR(100),
    prep_time INT,
    cook_time INT,
	PRIMARY KEY (recipe_id, ingredient_name),
    FOREIGN KEY (recipe_id) REFERENCES RECIPE(recipe_id),
    FOREIGN KEY (ingredient_name) REFERENCES INGREDIENT(ingredient_name)
);

-- insert into ingredient
INSERT INTO INGREDIENT (ingredient_name, ingredient_type, ingredient_cost) VALUES 
('Chicken Breast', 'Meat', 3.99);
('Salmon', 'Seafood', 7.99);
('Pork Chops', 'Meat', 5.49);
('Shrimp', 'Seafood', 9.99);
('Ground Beef', 'Meat', 4.49);
('Ground Turkey', 'Meat', 4.99);
('Lamb Chops', 'Meat', 8.99);
('Turkey Breast', 'Meat', 6.99);
('Sirloin Steak', 'Meat', 9.99);
('Ground Pork', 'Meat', 4.49);
('Tilapia', 'Seafood', 5.99);
('Chicken Thighs', 'Meat', 2.99);
('Broccoli', 'Vegetable', 1.25);
('Bell Pepper', 'Vegetable', 1.25);
('Zucchini', 'Vegetable', 1.00);
('Spinach', 'Vegetable', 1.50);
('Cucumber', 'Vegetable', 0.99);
('Onion', 'Vegetable', 0.75);
('Banana', 'Fruit', 0.5);
('Strawberries', 'Fruit', 2.99);
('Mango', 'Fruit', 2.50);
('Grapes', 'Fruit', 3.49);
('Pineapple', 'Fruit', 2.99);
('Avocado', 'Fruit', 1.50);
('Quinoa', 'Grain', 2.49);
('Pasta', 'Grain', 1.29);
('Bread', 'Grain', 2.49);
('Oats', 'Grain', 1.79);
('Couscous', 'Grain', 2.19);
('Barley', 'Grain', 1.89);
('Cheese', 'Dairy', 3.49);
('Yogurt', 'Dairy', 2.79);
('Butter', 'Dairy', 2.29);
('Soy Sauce', 'Condiment', 2.29);
('Honey', 'Condiment', 3.99);
('Ketchup', 'Condiment', 1.49);
('Mustard', 'Condiment', 1.29);
('Cumin', 'Spice', 1.79);
('Thyme', 'Spice', 1.69);
('Rosemary', 'Spice', 1.79);
('Parsley', 'Spice', 1.29);
('Cilantro', 'Spice', 1.49);
('Oregano', 'Spice', 1.59);
('Dill', 'Spice', 1.39);
('Bay Leaves', 'Spice', 1.99);
('Sage', 'Spice', 1.89);
('Coriander', 'Spice', 1.69);
('Turmeric', 'Spice', 2.29);
('Cardamom', 'Spice', 3.49);
('Cinnamon', 'Spice', 1.99);
('Nutmeg', 'Spice', 2.99);
('Paprika', 'Spice', 1.79);
('Chili Powder', 'Spice', 1.49);
('Garlic Powder', 'Spice', 1.49);
('Onion Powder', 'Spice', 1.29);
('Cayenne Pepper', 'Spice', 1.79);
('Ground Ginger', 'Spice', 1.99);
('Ground Turmeric', 'Spice', 2.29);
('Crushed Red Pepper', 'Spice', 1.49);
('Chia Seeds', 'Nut', 3.49);
('Canned Chickpeas', 'Canned Good', 1.99);
('Canned Corn', 'Canned Good', 1.29);
('Canned Tomatoes', 'Canned Good', 1.49);
('Canned Beans', 'Canned Good', 1.19);
('Canned Tuna', 'Canned Good', 2.49);
('Canned Salmon', 'Canned Good', 3.99);
('Canned Black Beans', 'Canned Good', 1.29);
('Canned Green Beans', 'Canned Good', 1.39);
('Canned Peas', 'Canned Good', 1.19);
('Canned Pineapple', 'Canned Good', 1.79);
('Canned Peaches', 'Canned Good', 2.29);
    

-- insert into RESTRICTION
INSERT INTO RESTRICTION (ingredient_name, ingredient_type, is_vegan, is_kosher, is_gluten_free, is_dairy_free, is_halal, is_nut_free, is_vegetarian, is_pescatarian) VALUES 
('Chicken Breast', 'Meat', false, false, true, true, true, true, false, false),
('Salmon', 'Seafood', false, true, true, true, true, true, false, true),
('Pork Chops', 'Meat', false, false, true, true, false, true, false, false),
('Shrimp', 'Seafood', false, false, true, true, false, true, false, true),
('Ground Beef', 'Meat', false, false, true, true, false, true, false, false),
('Ground Turkey', 'Meat', false, true, true, true, true, true, false, false),
('Lamb Chops', 'Meat', false, true, true, true, true, true, false, false),
('Turkey Breast', 'Meat', false, true, true, true, true, true, false, false),
('Sirloin Steak', 'Meat', false, false, true, true, false, true, false, false),
('Ground Pork', 'Meat', false, false, true, true, false, true, false, false),
('Tilapia', 'Seafood', false, true, true, true, true, true, false, true),
('Chicken Thighs', 'Meat', false, false, true, true, true, true, false, false),
('Broccoli', 'Vegetable', true, true, true, true, true, true, true, true),
('Bell Pepper', 'Vegetable', true, true, true, true, true, true, true, true),
('Zucchini', 'Vegetable', true, true, true, true, true, true, true, true),
('Spinach', 'Vegetable', true, true, true, true, true, true, true, true),
('Cucumber', 'Vegetable', true, true, true, true, true, true, true, true),
('Onion', 'Vegetable', true, true, true, true, true, true, true, true),
('Banana', 'Fruit', true, true, true, true, true, true, true, true),
('Strawberries', 'Fruit', true, true, true, true, true, true, true, true),
('Mango', 'Fruit', true, true, true, true, true, true, true, true),
('Grapes', 'Fruit', true, true, true, true, true, true, true, true),
('Pineapple', 'Fruit', true, true, true, true, true, true, true, true),
('Avocado', 'Fruit', true, true, true, true, true, true, true, true),
('Quinoa', 'Grain', true, true, true, true, true, true, true, true),
('Pasta', 'Grain', true, true, false, true, true, true, true, true),
('Bread', 'Grain', true, true, false, true, true, true, true, true),
('Oats', 'Grain', true, true, true, true, true, true, true, true),
('Couscous', 'Grain', true, true, false, true, true, true, true, true),
('Barley', 'Grain', true, true, false, true, true, true, true, true),
('Cheese', 'Dairy', false, true, true, false, true, true, true, true),
('Yogurt', 'Dairy', false, true, true, false, true, true, true, true),
('Butter', 'Dairy', false, true, true, false, true, true, true, true),
('Soy Sauce', 'Condiment', true, true, false, true, true, true, true, true),
('Honey', 'Condiment', false, true, true, true, true, true, true, true),
('Ketchup', 'Condiment', true, true, true, true, true, true, true, true),
('Mustard', 'Condiment', true, true, true, true, true, true, true, true),
('Cumin', 'Spice', true, true, true, true, true, true, true, true),
('Thyme', 'Spice', true, true, true, true, true, true, true, true),
('Rosemary', 'Spice', true, true, true, true, true, true, true, true),
('Parsley', 'Spice', true, true, true, true, true, true, true, true),
('Cilantro', 'Spice', true, true, true, true, true, true, true, true),
('Oregano', 'Spice', true, true, true, true, true, true, true, true),
('Dill', 'Spice', true, true, true, true, true, true, true, true),
('Bay Leaves', 'Spice', true, true, true, true, true, true, true, true),
('Sage', 'Spice', true, true, true, true, true, true, true, true),
('Coriander', 'Spice', true, true, true, true, true, true, true, true),
('Turmeric', 'Spice', true, true, true, true, true, true, true, true),
('Cardamom', 'Spice', true, true, true, true, true, true, true, true),
('Cinnamon', 'Spice', true, true, true, true, true, true, true, true),
('Nutmeg', 'Condiment', true, true, true, true, true, false, true, true),
('Paprika', 'Spice', true, true, true, true, true, true, true, true),
('Chili Powder', 'Spice', true, true, true, true, true, true, true, true),
('Garlic Powder', 'Spice', true, true, true, true, true, true, true, true),
('Onion Powder', 'Spice', true, true, true, true, true, true, true, true),
('Cayenne Pepper', 'Spice', true, true, true, true, true, true, true, true),
('Ground Ginger', 'Spice', true, true, true, true, true, true, true, true),
('Ground Turmeric', 'Spice', true, true, true, true, true, true, true, true),
('Crushed Red Pepper', 'Spice', true, true, true, true, true, true, true, true),
('Chia Seeds', 'Nut', true, true, true, true, true, false, true, true),
('Canned Chickpeas', 'Canned Good', true, true, true, true, true, true, true, true),
('Canned Corn', 'Canned Good', true, true, true, true, true, true, true, true),
('Canned Tomatoes', 'Canned Good', true, true, true, true, true, true, true, true),
('Canned Beans', 'Canned Good', true, true, true, true, true, true, true, true),
('Canned Tuna', 'Canned Good', false, false, true, true, true, true, false, true),
('Canned Salmon', 'Canned Good', false, true, true, true, true, true, false, true),
('Canned Black Beans', 'Canned Good', true, true, true, true, true, true, true, true),
('Canned Green Beans', 'Canned Good', true, true, true, true, true, true, true, true),
('Canned Peas', 'Canned Good', true, true, true, true, true, true, true, true),
('Canned Pineapple', 'Canned Good', true, true, true, true, true, true, true, true),
('Canned Peaches', 'Canned Good', true, true, true, true, true, true, true, true);
    
-- insert into NUTRITION
INSERT INTO NUTRITION (ingredient_name, sugar_amt, fat_amt, protein_amt, carb_amt) VALUES
('Chicken Breast', 0, 2.7, 26, 0);
('Salmon', 0, 4.3, 23.5, 0);
('Pork Chops', 0, 11.7, 52.7, 0);
('Shrimp', 0, 1.4, 19.4, 1.3);
('Ground Beef', 0, 5.65, 24.19, 0);
('Ground Turkey', 0, 16.6, 34.5, 0);
('Lamb Chops', 0, 22.89, 24.96, 0);
('Turkey Breast', 0, 1.8, 26, 0);
('Sirloin Steak', 0, 6.4, 22.8, 0);
('Ground Pork', 0, 18, 22, 0);
('Tilapia', 0, 4.5, 44, 0);
('Chicken Thighs', 0, 9, 20, 0);
('Broccoli', 1.55, 0.34, 2.57, 6.04);
('Bell Pepper', 5.0, 0.36, 1.2, 7.2);
('Zucchini', 3.1, 0.4, 1.5, 3.9);
('Spinach', 0.13, 0.12, 0.86, 1.1);
('Cucumber', 1.7, 0.11, 0.68, 3.8);
('Onion', 4.4, 0.2, 1.3, 9.5);
('Banana', 14, 0.4, 1.3, 27);
('Strawberries', 4.9, 0.3, 0.7, 7.7);
('Mango', 45, 1, 3, 50);
('Grapes', 15, 0.3, 0.6, 16);
('Pineapple', 16, 0.2, 0.89, 21.65);
('Avocado', 1.3, 29, 4, 17);
('Quinoa', 0.8, 1.8, 4.1, 20);
('Pasta', 0.7, 1.2, 7.2, 38);
('Bread', 1.6, 0.97, 2.6, 14.3);
('Oats', 0.4, 2.6, 5.3, 27);
('Couscous', 0.2, 0.3, 6, 36);
('Barley', 0.69, 0.44, 3.55, 44.3);
('Cheese', 0.1, 9.3, 6.4, 0.9);
('Yogurt', 12, 2.6, 8.9, 12);
('Butter', 0.01, 11.52, 0.12, 0.01);
('Soy Sauce', 0.06, 0.09, 1.3, 0.79);
('Honey', 13.2, 0, 0.06, 17.3);
('Ketchup', 3.6, 0, 0.2, 4.7);
('Mustard', 0.05, 0.17, 0.19, 0.29);
('Cumin', 0.1, 0.5, 0.4, 0.9);
('Thyme', 0, 0.1, 0.1, 0.9);
('Rosemary', 0, 0, 0, 0.1);
('Parsley', 0, 0, 0.1, 0.2);
('Cilantro', 0, 0, 0, 0.1);
('Oregano', 0, 0, 0.1, 0.7);
('Dill', 0, 0, 0, 0.1);
('Bay Leaves', 0, 0, 0, 0.2);
('Sage', 0, 0, 0, 0);
('Coriander', 0, 0, 0.1, 0.2);
('Turmeric', 0.1, 0.1, 0.3, 2);
('Cardamom', 0, 0.1, 0.2, 1.4);
('Cinnamon', 0.06, 0.03, 0.1, 2.1);
('Nutmeg', 0.07, 0.8, 0.13, 1.1);
('Paprika', 0.7, 0.88, 0.96, 3.7);
('Chili Powder', 0.2, 0.4, 0.4, 1.3);
('Garlic Powder', 0.63, 0.02, 0.47, 2.04);
('Onion Powder', 0.2, 0, 0.3, 1.9);
('Cayenne Pepper', 0.2, 0.3, 0.2, 1);
('Ground Ginger', 0.06, 0.08, 0.16, 1.3);
('Ground Turmeric', 0.1, 0.1, 0.3, 2);
('Crushed Red Pepper', 0.2, 0.3, 0.2, 1);
('Chia Seeds', 0, 8.7, 4.7, 12);
('Canned Chickpeas', 10, 7, 18, 57);
('Canned Corn', 12, 3.2, 6, 38);
('Canned Tomatoes', 4.8, 0.5, 1.5, 6.6);
('Canned Beans', 5.4, 2.8, 16, 47);
('Canned Tuna', 0, 5.1, 41, 0);
('Canned Salmon', 0, 16, 73, 0);
('Canned Black Beans', 0.9, 1.6, 25, 68);
('Canned Green Beans', 1.1, 0.6, 1.5, 5.8);
('Canned Peas', 4, 0.6, 3.7, 13);
('Canned Pineapple', 36, 0.2, 1, 39);
    
    
INSERT INTO FLAVORPROFILE (ingredient_name, is_bitter, is_sweet, is_salty, is_sour, is_umami) VALUES
('Almonds', FALSE, TRUE, FALSE, FALSE, FALSE),
('Apple', FALSE, TRUE, FALSE, TRUE, FALSE),
('Avocado', FALSE, FALSE, FALSE, FALSE, TRUE),
('Banana', FALSE, TRUE, FALSE, TRUE, FALSE),
('Barley', FALSE, FALSE, FALSE, FALSE, FALSE),
('Basil', TRUE, FALSE, FALSE, TRUE, FALSE),
('Bay Leaves', TRUE, FALSE, FALSE, TRUE, FALSE),
('Bell Pepper', FALSE, TRUE, FALSE, FALSE, FALSE),
('Bread', FALSE, TRUE, TRUE, FALSE, FALSE),
('Broccoli', TRUE, FALSE, FALSE, FALSE, FALSE),
('Butter', FALSE, FALSE, TRUE, FALSE, FALSE),
('Canned Beans', FALSE, FALSE, TRUE, FALSE, TRUE),
('Canned Black Beans', FALSE, FALSE, TRUE, FALSE, TRUE),
('Canned Chickpeas', FALSE, FALSE, TRUE, FALSE, TRUE),
('Canned Corn', FALSE, TRUE, TRUE, FALSE, FALSE),
('Canned Green Beans', FALSE, FALSE, TRUE, FALSE, FALSE),
('Canned Peaches', FALSE, TRUE, FALSE, TRUE, FALSE),
('Canned Peas', FALSE, TRUE, TRUE, FALSE, FALSE),
('Canned Pineapple', FALSE, TRUE, FALSE, TRUE, FALSE),
('Canned Salmon', TRUE, FALSE, TRUE, FALSE, FALSE),
('Canned Tomatoes', TRUE, TRUE, TRUE, TRUE, TRUE),
('Canned Tuna', TRUE, FALSE, TRUE, FALSE, TRUE),
('Cardamom', FALSE, TRUE, FALSE, FALSE, FALSE),
('Carrot', FALSE, TRUE, FALSE, FALSE, FALSE),
('Cayenne Pepper', TRUE, FALSE, FALSE, FALSE, FALSE),
('Cheese', FALSE, FALSE, TRUE, FALSE, TRUE),
('Chia Seeds', TRUE, TRUE, FALSE, FALSE, FALSE),
('Chicken Breast', FALSE, FALSE, TRUE, FALSE, TRUE),
('Chicken Thighs', FALSE, FALSE, TRUE, FALSE, TRUE),
('Chili Powder', TRUE, FALSE, FALSE, FALSE, TRUE),
('Cilantro', TRUE, FALSE, FALSE, FALSE, TRUE),
('Cinnamon', FALSE, TRUE, FALSE, FALSE, FALSE),
('Coriander', TRUE, FALSE, FALSE, TRUE, FALSE),
('Couscous', FALSE, FALSE, FALSE, FALSE, TRUE),
('Crushed Red Pepper', TRUE, FALSE, FALSE, FALSE, TRUE),
('Cucumber', FALSE, FALSE, FALSE, FALSE, FALSE),
('Cumin', TRUE, FALSE, FALSE, FALSE, TRUE),
('Dill', TRUE, TRUE, FALSE, TRUE, TRUE),
('Garlic Powder', TRUE, FALSE, FALSE, FALSE, TRUE),
('Grapes', FALSE, TRUE, FALSE, TRUE, FALSE),
('Ground Beef', FALSE, FALSE, TRUE, FALSE, TRUE),
('Ground Ginger', TRUE, TRUE, FALSE, TRUE, TRUE),
('Ground Pork', FALSE, FALSE, TRUE, FALSE, TRUE),
('Ground Turkey', FALSE, FALSE, TRUE, FALSE, TRUE),
('Ground Turmeric', TRUE, FALSE, FALSE, FALSE, TRUE),
('Honey', FALSE, TRUE, FALSE, FALSE, FALSE),
('Ketchup', FALSE, TRUE, TRUE, TRUE, TRUE),
('Lamb Chops', FALSE, FALSE, TRUE, FALSE, TRUE),
('Mango', FALSE, TRUE, FALSE, TRUE, FALSE),
('Milk', FALSE, TRUE, FALSE, FALSE, FALSE),
('Mustard', TRUE, TRUE, TRUE, TRUE, TRUE),
('Nutmeg', TRUE, TRUE, FALSE, FALSE, FALSE),
('Oats', TRUE, TRUE, FALSE, FALSE, FALSE),
('Olive Oil', TRUE, FALSE, FALSE, FALSE, FALSE),
('Onion', TRUE, TRUE, FALSE, TRUE, TRUE),
('Onion Powder', TRUE, TRUE, FALSE, TRUE, TRUE),
('Oregano', TRUE, FALSE, FALSE, FALSE, TRUE),
('Paprika', FALSE, TRUE, FALSE, FALSE, FALSE),
('Parsley', TRUE, FALSE, FALSE, FALSE, FALSE),
('Pasta', FALSE, FALSE, FALSE, FALSE, FALSE),
('Pineapple', FALSE, TRUE, FALSE, TRUE, FALSE),
('Pork Chops', FALSE, FALSE, TRUE, FALSE, TRUE),
('Quinoa', TRUE, FALSE, TRUE, FALSE, FALSE),
('Rice', FALSE, FALSE, TRUE, FALSE, FALSE),
('Rosemary', TRUE, FALSE, FALSE, FALSE, FALSE),
('Sage', TRUE, FALSE, FALSE, FALSE, TRUE),
('Salmon', FALSE, FALSE, TRUE, FALSE, TRUE),
('Shrimp', FALSE, FALSE, TRUE, FALSE, TRUE),
('Sirloin Steak', FALSE, FALSE, TRUE, FALSE, FALSE),
('Soy Sauce', FALSE, FALSE, TRUE, TRUE, TRUE),
('Spinach', TRUE, FALSE, FALSE, FALSE, FALSE),
('Strawberries', FALSE, TRUE, FALSE, TRUE, FALSE),
('Thyme', TRUE, FALSE, FALSE, FALSE, FALSE),
('Tilapia', FALSE, FALSE, TRUE, FALSE, TRUE),
('Tomato Sauce', TRUE, TRUE, TRUE, TRUE, TRUE),
('Turkey Breast', FALSE, FALSE, TRUE, FALSE, TRUE),
('Turmeric', TRUE, FALSE, FALSE, FALSE, FALSE),
('Yogurt', FALSE, TRUE, FALSE, TRUE, FALSE),
('Zucchini', TRUE, TRUE, FALSE, FALSE, FALSE);

INSERT INTO RECIPE (recipe_id, difficulty, recipe_name, origin) VALUES 
();

INSERT INTO INGREDIENTLIST (recipe_id, ingredient_name, ingredient_amt) VALUES
();

INSERT INTO RECIPESTEP (step_number, recipe_id, step_descript, prep_time, cook_time) VALUES
();
