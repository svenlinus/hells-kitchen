-- Gordon Ramseys Recipe Database
DROP DATABASE IF EXISTS HELLSKITCHEN;
CREATE DATABASE HELLSKITCHEN;
USE HELLSKITCHEN;

CREATE TABLE
IF NOT EXISTS RESTRICTION
(
	ingredient_type VARCHAR
(50) NOT NULL,
    is_vegan BOOLEAN NOT NULL,
    is_kosher BOOLEAN NOT NULL,
    is_gluten_free BOOLEAN NOT NULL,
    is_dairy_free BOOLEAN NOT NULL,
    is_halal BOOLEAN NOT NULL,
    is_nut_free BOOLEAN NOT NULL,
    is_vegetarian BOOLEAN NOT NULL,
    is_pescatarian BOOLEAN NOT NULL,
	PRIMARY KEY
(ingredient_type)
);

CREATE TABLE
IF NOT EXISTS INGREDIENT
(
	ingredient_name VARCHAR
(50) NOT NULL,
    ingredient_type VARCHAR
(50) NOT NULL,
    ingredient_cost FLOAT NOT NULL,
    PRIMARY KEY
(ingredient_name),
	FOREIGN KEY 
(ingredient_type) REFERENCES RESTRICTION
(ingredient_type)
);

CREATE TABLE
IF NOT EXISTS INVENTORY
(
	ingredient_name VARCHAR
(50) NOT NULL,
    inventory_amt FLOAT DEFAULT 0,
    PRIMARY KEY
(ingredient_name),
    FOREIGN KEY
(ingredient_name) REFERENCES INGREDIENT
(ingredient_name)
);

CREATE TABLE
IF NOT EXISTS NUTRITION
(
	ingredient_name VARCHAR
(50) NOT NULL,
	sugar_amt FLOAT DEFAULT 0,
    fat_amt FLOAT DEFAULT 0,
    protein_amt FLOAT DEFAULT 0,
    carb_amt FLOAT DEFAULT 0,
    PRIMARY KEY
(ingredient_name),
    FOREIGN KEY
(ingredient_name) REFERENCES INGREDIENT
(ingredient_name)
);

CREATE TABLE
IF NOT EXISTS FLAVORPROFILE
(
	ingredient_name VARCHAR
(50) NOT NULL,
    is_bitter BOOLEAN NOT NULL,
    is_sweet BOOLEAN NOT NULL,
    is_salty BOOLEAN NOT NULL,
    is_sour BOOLEAN NOT NULL,
    is_umami BOOLEAN NOT NULL,
	PRIMARY KEY
(ingredient_name),
    FOREIGN KEY
(ingredient_name) REFERENCES INGREDIENT
(ingredient_name)
);

CREATE TABLE
IF NOT EXISTS RECIPE
(
	recipe_id INT NOT NULL,
    difficulty VARCHAR
(15) DEFAULT 'Easy',
    recipe_name VARCHAR
(50) NOT NULL,
    origin VARCHAR
(50) NULL,
    PRIMARY KEY
(recipe_id)
);

CREATE TABLE
IF NOT EXISTS INGREDIENTLIST
(
	recipe_id INT,
	ingredient_name VARCHAR
(50),
    ingredient_amt FLOAT,
    PRIMARY KEY
(recipe_id, ingredient_name),
    FOREIGN KEY
(ingredient_name) REFERENCES INGREDIENT
(ingredient_name),
    FOREIGN KEY
(recipe_id) REFERENCES RECIPE
(recipe_id)
);

CREATE TABLE
IF NOT EXISTS RECIPESTEP
(
	step_number INT,
    recipe_id INT,
    ingredient_name VARCHAR
(50),
    step_descript VARCHAR
(100),
    prep_time INT,
    cook_time INT,
	PRIMARY KEY
(recipe_id, step_number),
    FOREIGN KEY
(recipe_id) REFERENCES RECIPE
(recipe_id),
    FOREIGN KEY
(ingredient_name) REFERENCES INGREDIENT
(ingredient_name)
);

-- insert into RESTRICTION
INSERT INTO RESTRICTION
    (ingredient_type, is_vegan, is_kosher, is_gluten_free, is_dairy_free, is_halal, is_nut_free, is_vegetarian, is_pescatarian)
VALUES
    ('Meat', false, false, true, true, false, true, false, false),
    ('Vegetable', true, true, true, true, true, true, true, true),
    ('Seafood', false, true, true, true, true, true, false, true),
    ('Fruit', true, true, true, true, true, true, true, true),
    ('Grain', true, true, true, true, true, true, true, true),
    ('Dairy', false, true, true, false, true, true, true, true),
    ('Condiment', true, true, false, true, true, true, true, true),
    ('Spice', true, true, true, true, true, true, true, true),
    ('Nut', true, true, true, true, true, false, true, true),
    ('Canned Good', false, true, true, true, true, true, false, true),
    ('Broth', false, true, true, false, true, true, true, true),
    ('Sauce', false, true, true, false, true, true, true, true),
    ('Oil', true, true, true, true, true, true, true, true);

-- insert into ingredient
INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Almonds', 'Nut', 3.99),
    ('Apple', 'Fruit', 0.99),
    ('Basil', 'Spice', 1.99),
    ('Carrot', 'Vegetable', 0.99),
    ('Milk', 'Dairy', 4.99),
    ('Olive Oil', 'Oil', 4.99),
    ('Balsamic Glaze', 'Oil', 5.99),
    ('Vinegar', 'Oil', 2.99),
    ('Rice', 'Grain', 3.99),
    ('Tomato Sauce', 'Sauce', 3.99),
    ('Chicken Breast', 'Meat', 3.99),
    ('Tofu', 'Vegetable', 3.99),
    ('Salmon', 'Seafood', 7.99),
    ('Pork Chops', 'Meat', 5.49),
    ('Potato', 'Vegetable', 0.99),
    ('Shrimp', 'Seafood', 9.99),
    ('Ground Beef', 'Meat', 4.49),
    ('Ground Turkey', 'Meat', 4.99),
    ('Lamb Chops', 'Meat', 8.99),
    ('Turkey Breast', 'Meat', 6.99),
    ('Sirloin Steak', 'Meat', 9.99),
    ('Ground Pork', 'Meat', 4.49),
    ('Tilapia', 'Seafood', 5.99),
    ('Chicken Thighs', 'Meat', 2.99),
    ('Broccoli', 'Vegetable', 1.25),
    ('Bell Pepper', 'Vegetable', 1.25),
    ('Zucchini', 'Vegetable', 1.00),
    ('Spinach', 'Vegetable', 1.50),
    ('Cucumber', 'Vegetable', 0.99),
    ('Onion', 'Vegetable', 0.75),
    ('Mixed Greens', 'Vegetable', 1.00),
    ('Banana', 'Fruit', 0.5),
    ('Strawberries', 'Fruit', 2.99),
    ('Mango', 'Fruit', 2.50),
    ('Grapes', 'Fruit', 3.49),
    ('Pineapple', 'Fruit', 2.99),
    ('Lime', 'Fruit', 0.30),
    ('Lemon', 'Fruit', 0.30),
    ('Avocado', 'Fruit', 1.50),
    ('Tomatoes', 'Fruit', 0.50),
    ('Quinoa', 'Grain', 2.49),
    ('Pasta', 'Grain', 1.29),
    ('Bread', 'Grain', 2.49),
    ('Oats', 'Grain', 1.79),
    ('Couscous', 'Grain', 2.19),
    ('Pizza Dough', 'Grain', 3.50),
    ('Barley', 'Grain', 1.89),
    ('Puff Pastry', 'Grain', 4.00),
    ('Cheese', 'Dairy', 3.49),
    ('Yogurt', 'Dairy', 2.79),
    ('Butter', 'Dairy', 2.29),
    ('Soy Sauce', 'Condiment', 2.29),
    ('Honey', 'Condiment', 3.99),
    ('Ketchup', 'Condiment', 1.49),
    ('Mustard', 'Condiment', 1.29),
    ('Cumin', 'Spice', 1.79),
    ('Thyme', 'Spice', 1.69),
    ('Rosemary', 'Spice', 1.79),
    ('Parsley', 'Spice', 1.29),
    ('Cilantro', 'Spice', 1.49),
    ('Oregano', 'Spice', 1.59),
    ('Dill', 'Spice', 1.39),
    ('Bay Leaves', 'Spice', 1.99),
    ('Sage', 'Spice', 1.89),
    ('Coriander', 'Spice', 1.69),
    ('Turmeric', 'Spice', 2.29),
    ('Cardamom', 'Spice', 3.49),
    ('Cinnamon', 'Spice', 1.99),
    ('Nutmeg', 'Spice', 2.99),
    ('Paprika', 'Spice', 1.79),
    ('Chili Powder', 'Spice', 1.49),
    ('Garlic Powder', 'Spice', 1.49),
    ('Onion Powder', 'Spice', 1.29),
    ('Cayenne Pepper', 'Spice', 1.79),
    ('Pepper', 'Spice', 0.39),
    ('Ground Ginger', 'Spice', 1.99),
    ('Ground Turmeric', 'Spice', 2.29),
    ('Crushed Red Pepper', 'Spice', 1.49),
    ('Sugar', 'Spice', 0.50),
    ('Chia Seeds', 'Nut', 3.49),
    ('Canned Chickpeas', 'Canned Good', 1.99),
    ('Canned Corn', 'Canned Good', 1.29),
    ('Canned Tomatoes', 'Canned Good', 1.49),
    ('Canned Beans', 'Canned Good', 1.19),
    ('Canned Tuna', 'Canned Good', 2.49),
    ('Canned Salmon', 'Canned Good', 3.99),
    ('Canned Black Beans', 'Canned Good', 1.29),
    ('Canned Green Beans', 'Canned Good', 1.39),
    ('Canned Peas', 'Canned Good', 1.19),
    ('Canned Pineapple', 'Canned Good', 1.79),
    ('Canned Peaches', 'Canned Good', 2.29),
    ('Mushrooms', 'Vegetable', 3.25),
    ('Water', 'Broth', 0.0),
    ('Alfredo Sauce', 'Broth', 2.00);

-- insert into NUTRITION
INSERT INTO NUTRITION
    (ingredient_name, sugar_amt, fat_amt, protein_amt, carb_amt)
VALUES
    ('Chicken Breast', 0, 2.7, 26, 0),
    ('Tofu', 0, 2.7, 26, 0),
    ('Salmon', 0, 4.3, 23.5, 0),
    ('Pork Chops', 0, 11.7, 52.7, 0),
    ('Potato', 0, 0.1, 3.1, 23.2),
    ('Shrimp', 0, 1.4, 19.4, 1.3),
    ('Ground Beef', 0, 5.65, 24.19, 0),
    ('Ground Turkey', 0, 16.6, 34.5, 0),
    ('Lamb Chops', 0, 22.89, 24.96, 0),
    ('Turkey Breast', 0, 1.8, 26, 0),
    ('Sirloin Steak', 0, 6.4, 22.8, 0),
    ('Ground Pork', 0, 18, 22, 0),
    ('Tilapia', 0, 4.5, 44, 0),
    ('Chicken Thighs', 0, 9, 20, 0),
    ('Broccoli', 1.55, 0.34, 2.57, 6.04),
    ('Bell Pepper', 5.0, 0.36, 1.2, 7.2),
    ('Zucchini', 3.1, 0.4, 1.5, 3.9),
    ('Spinach', 0.13, 0.12, 0.86, 1.1),
    ('Cucumber', 1.7, 0.11, 0.68, 3.8),
    ('Onion', 4.4, 0.2, 1.3, 9.5),
    ('Mixed Greens', 0, 0, 0, 0),
    ('Banana', 14, 0.4, 1.3, 27),
    ('Strawberries', 4.9, 0.3, 0.7, 7.7),
    ('Mango', 45, 1, 3, 50),
    ('Grapes', 15, 0.3, 0.6, 16),
    ('Pineapple', 16, 0.2, 0.89, 21.65),
    ('Lime', 0, 0, 0, 0),
    ('Lemon', 0, 0, 0, 0),
    ('Avocado', 1.3, 29, 4, 17),
    ('Tomatoes', 1.3, .1, 2, 2),
    ('Quinoa', 0.8, 1.8, 4.1, 20),
    ('Pasta', 0.7, 1.2, 7.2, 38),
    ('Bread', 1.6, 0.97, 2.6, 14.3),
    ('Oats', 0.4, 2.6, 5.3, 27),
    ('Couscous', 0.2, 0.3, 6, 36),
    ('Barley', 0.69, 0.44, 3.55, 44.3),
    ('Pizza Dough', 0.5, 0.5, 2, 20),
    ('Puff Pastry', 10, 0.5, 2, 20),
    ('Cheese', 0.1, 9.3, 6.4, 0.9),
    ('Yogurt', 12, 2.6, 8.9, 12),
    ('Milk', 12, 2.6, 8.9, 12),
    ('Olive Oil', 0, 20, 0, 0),
    ('Vinegar', 0, 20, 0, 0),
    ('Balsamic Glaze', 0, 20, 0, 0),
    ('Butter', 0.01, 11.52, 0.12, 0.01),
    ('Soy Sauce', 0.06, 0.09, 1.3, 0.79),
    ('Honey', 13.2, 0, 0.06, 17.3),
    ('Ketchup', 3.6, 0, 0.2, 4.7),
    ('Mustard', 0.05, 0.17, 0.19, 0.29),
    ('Cumin', 0.1, 0.5, 0.4, 0.9),
    ('Thyme', 0, 0.1, 0.1, 0.9),
    ('Rosemary', 0, 0, 0, 0.1),
    ('Parsley', 0, 0, 0.1, 0.2),
    ('Cilantro', 0, 0, 0, 0.1),
    ('Oregano', 0, 0, 0.1, 0.7),
    ('Dill', 0, 0, 0, 0.1),
    ('Bay Leaves', 0, 0, 0, 0.2),
    ('Sage', 0, 0, 0, 0),
    ('Coriander', 0, 0, 0.1, 0.2),
    ('Turmeric', 0.1, 0.1, 0.3, 2),
    ('Cardamom', 0, 0.1, 0.2, 1.4),
    ('Cinnamon', 0.06, 0.03, 0.1, 2.1),
    ('Sugar', 30, 0, 0, 30),
    ('Nutmeg', 0.07, 0.8, 0.13, 1.1),
    ('Paprika', 0.7, 0.88, 0.96, 3.7),
    ('Chili Powder', 0.2, 0.4, 0.4, 1.3),
    ('Garlic Powder', 0.63, 0.02, 0.47, 2.04),
    ('Onion Powder', 0.2, 0, 0.3, 1.9),
    ('Cayenne Pepper', 0.2, 0.3, 0.2, 1),
    ('Pepper', 0.2, 0.3, 0.2, 1),
    ('Ground Ginger', 0.06, 0.08, 0.16, 1.3),
    ('Ground Turmeric', 0.1, 0.1, 0.3, 2),
    ('Crushed Red Pepper', 0.2, 0.3, 0.2, 1),
    ('Chia Seeds', 0, 8.7, 4.7, 12),
    ('Canned Chickpeas', 10, 7, 18, 57),
    ('Canned Corn', 12, 3.2, 6, 38),
    ('Canned Tomatoes', 4.8, 0.5, 1.5, 6.6),
    ('Canned Beans', 5.4, 2.8, 16, 47),
    ('Canned Tuna', 0, 5.1, 41, 0),
    ('Canned Salmon', 0, 16, 73, 0),
    ('Canned Black Beans', 0.9, 1.6, 25, 68),
    ('Canned Green Beans', 1.1, 0.6, 1.5, 5.8),
    ('Canned Peas', 4, 0.6, 3.7, 13),
    ('Canned Pineapple', 36, 0.2, 1, 39),
    ('Mushrooms', 0.3, 0.1, 0.3, 0.6),
    ('Water', 0, 0, 0, 0),
    ('Alfredo Sauce', 2, 17, 5, 4);

INSERT INTO FLAVORPROFILE
    (ingredient_name, is_bitter, is_sweet, is_salty, is_sour, is_umami)
VALUES
    ('Alfredo Sauce', FALSE, FALSE, TRUE, FALSE, TRUE),
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
    ('Pepper', TRUE, FALSE, FALSE, FALSE, FALSE),
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
    ('Lime', FALSE, FALSE, FALSE, TRUE, FALSE),
    ('Lemon', FALSE, FALSE, FALSE, TRUE, FALSE),
    ('Mango', FALSE, TRUE, FALSE, TRUE, FALSE),
    ('Milk', FALSE, TRUE, FALSE, FALSE, FALSE),
    ('Mixed Greens', TRUE, FALSE, TRUE, FALSE, FALSE),
    ('Mushrooms', TRUE, FALSE, FALSE, FALSE, TRUE),
    ('Mustard', TRUE, TRUE, TRUE, TRUE, TRUE),
    ('Nutmeg', TRUE, TRUE, FALSE, FALSE, FALSE),
    ('Oats', TRUE, TRUE, FALSE, FALSE, FALSE),
    ('Olive Oil', TRUE, FALSE, FALSE, FALSE, FALSE),
    ('Balsamic Glaze', TRUE, FALSE, FALSE, FALSE, FALSE),
    ('Vinegar', TRUE, FALSE, FALSE, FALSE, FALSE),
    ('Onion', TRUE, TRUE, FALSE, TRUE, TRUE),
    ('Onion Powder', TRUE, TRUE, FALSE, TRUE, TRUE),
    ('Oregano', TRUE, FALSE, FALSE, FALSE, TRUE),
    ('Paprika', FALSE, TRUE, FALSE, FALSE, FALSE),
    ('Parsley', TRUE, FALSE, FALSE, FALSE, FALSE),
    ('Pasta', FALSE, FALSE, FALSE, FALSE, FALSE),
    ('Pineapple', FALSE, TRUE, FALSE, TRUE, FALSE),
    ('Pizza Dough', FALSE, TRUE, TRUE, FALSE, FALSE),
    ('Pork Chops', FALSE, FALSE, TRUE, FALSE, TRUE),
    ('Potato', FALSE, FALSE, TRUE, FALSE, FALSE),
    ('Puff Pastry', FALSE, TRUE, TRUE, FALSE, FALSE),
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
    ('Sugar', FALSE, TRUE, FALSE, FALSE, FALSE),
    ('Thyme', TRUE, FALSE, FALSE, FALSE, FALSE),
    ('Tilapia', FALSE, FALSE, TRUE, FALSE, TRUE),
    ('Tofu', FALSE, FALSE, TRUE, FALSE, TRUE),
    ('Tomato Sauce', TRUE, TRUE, TRUE, TRUE, TRUE),
    ('Tomatoes', TRUE, TRUE, TRUE, TRUE, TRUE),
    ('Turkey Breast', FALSE, FALSE, TRUE, FALSE, TRUE),
    ('Turmeric', TRUE, FALSE, FALSE, FALSE, FALSE),
    ('Water', FALSE, FALSE, FALSE, FALSE, TRUE),
    ('Yogurt', FALSE, TRUE, FALSE, TRUE, FALSE),
    ('Zucchini', TRUE, TRUE, FALSE, FALSE, FALSE);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Salt', 'Spice', 0.99);

INSERT INTO RECIPE
    (recipe_id, difficulty, recipe_name, origin)
VALUES
    (44, 'Easy', 'Mac n Cheese', 'USA'),
    (45, 'Medium', 'Curry', 'Indian'),
    (46, 'Hard', 'Beef Wellington', 'UK'),
    (1, 'Easy', 'Spaghetti Bolognese', 'Italian'),
    (2, 'Medium', 'Chicken Alfredo', 'Italian'),
    (4, 'Medium', 'Shrimp Scampi', 'Italian'),
    (5, 'Easy', 'Vegetarian Stir-Fry', 'Asian'),
    (6, 'Easy', 'Margherita Pizza', 'Italian'),
    (7, 'Medium', 'Chicken Tikka Masala', 'Indian'),
    (8, 'Hard', 'Beef and Broccoli Stir-Fry', 'Asian'),
    (9, 'Medium', 'Vegetarian Lasagna', 'Italian'),
    (10, 'Easy', 'Caprese Salad', 'Italian'),
    (11, 'Medium', 'Salmon Teriyaki', 'Japanese'),
    (12, 'Easy', 'Margherita Pasta', 'Italian'),
    (13, 'Hard', 'Beef Wellington', 'British'),
    (14, 'Medium', 'Chicken Alfredo Pizza', 'Italian'),
    (15, 'Easy', 'Avocado Shrimp Salad', 'International'),
    (16, 'Easy', 'Pepperoni Pizza', 'Italian');

INSERT
INTO INGREDIENTLIST
    (recipe_id, ingredient_name, ingredient_amt)
VALUES
    (1, 'Pasta', 250.0),
    (1, 'Ground Beef', 500.0),
    (1, 'Tomato Sauce', 700.0),
    (1, 'Salt', 5.0),
    (2, 'Chicken Breast', 400.0),
    (2, 'Pasta', 300.0),
    (2, 'Alfredo Sauce', 500.0),
    (44, 'Cheese', 44),
    (44, 'Pasta', 80),
    (44, 'Water', 800),
    (4, 'Shrimp', 300.0),
    (4, 'Garlic Powder', 2.0),
    (4, 'Lemon', 30.0),
    (5, 'Tofu', 400.0),
    (5, 'Broccoli', 200.0),
    (5, 'Soy Sauce', 50.0),
    (6, 'Pizza Dough', 400.0),
    (6, 'Tomato Sauce', 200.0),
    (6, 'Cheese', 300.0),
    (7, 'Chicken Thighs', 500.0),
    (7, 'Yogurt', 150.0),
    (7, 'Ground Ginger', 1.0),
    (7, 'Garlic Powder', 3.0),
    (7, 'Olive Oil', 30.0),
    (7, 'Onion', 2.0),
    (7, 'Tomato Sauce', 50.0),
    (7, 'Cumin', 10.0),
    (7, 'Tomatoes', 3.0),
    (7, 'Milk', 100.0),
    (7, 'Cilantro', 10.0),
    (8, 'Ground Beef', 400.0),
    (8, 'Broccoli', 250.0),
    (8, 'Soy Sauce', 30.0),
    (8, 'Ground Ginger', 1.0),
    (8, 'Garlic Powder', 2.0),
    (8, 'Olive Oil', 15.0),
    (8, 'Potato', 10.0),
    (8, 'Sugar', 15.0),
    (8, 'Vinegar', 15.0),
    (9, 'Pasta', 300.0),
    (9, 'Cheese', 200.0),
    (9, 'Spinach', 150.0),
    (10, 'Tomatoes', 400.0),
    (10, 'Cheese', 200.0),
    (10, 'Basil', 20.0),
    (10, 'Olive Oil', 30.0),
    (10, 'Balsamic Glaze', 15.0),
    (10, 'Salt', 5.0),
    (10, 'Pepper', 5.0),
    (11, 'Salmon', 500.0),
    (11, 'Soy Sauce', 50.0),
    (11, 'Sugar', 15.0),
    (11, 'Ground Ginger', 1.0),
    (12, 'Pasta', 400.0),
    (12, 'Tomatoes', 300.0),
    (12, 'Cheese', 200.0),
    (12, 'Basil', 20.0),
    (13, 'Ground Beef', 800.0),
    (13, 'Puff Pastry', 200.0),
    (13, 'Mushrooms', 150.0),
    (13, 'Pork Chops', 100.0),
    (13, 'Mustard', 15.0),
    (14, 'Pizza Dough', 400.0),
    (14, 'Chicken Breast', 300.0),
    (14, 'Alfredo Sauce', 200.0),
    (14, 'Cheese', 200.0),
    (15, 'Shrimp', 300.0),
    (15, 'Avocado', 2.0),
    (15, 'Tomatoes', 150.0),
    (15, 'Mixed Greens', 100.0),
    (15, 'Lime', 1.0),
    (15, 'Lemon', 1.0),
    (15, 'Olive Oil', 30.0);

INSERT
INTO RECIPESTEP
(step_number, recipe_id, ingredient_name, step_descript, prep_time, cook_time) VALUES
(1, 1, 'Pasta', 'Boil spaghetti according to package instructions, until just before al dente.', 1, 10),
(2, 1, 'Ground Beef', 'Cook ground beef until browned.', 1, 10),
(3, 1, 'Salt', 'Season ground beef with choice of seasonings, usually salt and pepper.', 1, 0),
(4, 1, 'Tomato Sauce', 'Add tomato sauce and simmer.', 1, 5),
(1, 2, 'Salt', 'Season raw chicken with seasonings, usually salt and pepper. Optionally let sit overnight.', 5, 0),
(2, 2, 'Chicken Breast', 'Grill or pan-fry chicken breast until fully cooked, 150-160 degrees farenheit. Let cool.', 5, 15),
(3, 2, 'Pasta', 'Cook fettuccine according to package instructions.', 1, 10),
(4, 2, 'Alfredo Sauce', 'Add fetticcine to pan or pot with alfredo and mix thoroughly. Add chicken.', 1, 10),
(1, 44, 'Water', 'Begin to boil water.', 0, 7.5),
(2, 44, 'Pasta', 'Place pasta into the boiling water.', 0, 15),
(3, 44, 'Cheese', 'Melt cheese and pour it over the pasta when it is finished', 2, 0),
(1, 4, 'Olive Oil', 'Heat olive oil in deep pan or pot on medium heat.', 10, 0),
(2, 4, 'Shrimp', 'Saute shrimp in olive oil until fully cooked.', 5, 5),
(3, 4, 'Garlic Powder', 'Mince garlic and add to the shrimp. Cook for an additional 2 minutes.', 5, 2),
(4, 4, 'Lemon', 'Squeeze lemon juice over the shrimp and garlic mixture.', 5, 0),
(1, 5, 'Tofu', 'Dice tofu and stir-fry in choice of oil until golden brown.', 10, 10),
(2, 5, 'Broccoli', 'Add broccoli to the tofu and continue stir-frying until tender-crisp.', 5, 5),
(3, 5, 'Soy Sauce', 'Pour soy sauce over the tofu and broccoli mixture. Stir well. Works well serving over rice.', 3, 0),
(1, 6, 'Pizza Dough', 'Roll out pizza dough and spread tomato sauce over it.', 15, 0),
(2, 6, 'Tomato Sauce', 'Spread tomato sauce over the pizza dough.', 5, 0),
(3, 6, 'Cheese', 'Sprinkle mozzarella cheese over the pizza. Cook in oven at 400F.', 5, 15),
(1, 7, 'Yogurt', 'Create marinade using yogurt, ginger, garlic, and spices.', 10, 0),
(2, 7, 'Chicken Thighs', 'Marinate chicken thighs in yogurt, ginger, garlic, and spices for at least 2 hours, or overnight.', 120, 0),
(3, 7, 'Olive Oil', 'Heat oil in a pan and sear marinated chicken until golden brown.', 10, 15),
(4, 7, 'Onion', 'Add finely chopped onions to the pan and sauté until golden brown.', 10, 5),
(5, 7, 'Tomato Sauce', 'Stir in tomato paste and cook for 2-3 minutes.', 1, 3),
(6, 7, 'Cumin', 'Add garam masala and continue cooking for another 2 minutes.', 1, 2),
(7, 7, 'Tomatoes', 'Add chopped tomatoes and cook until the oil separates from the masala.', 5, 10),
(8, 7, 'Milk', 'Pour in heavy cream and simmer for 10-15 minutes until the sauce thickens.', 5, 15),
(9, 7, 'Cilantro', 'Garnish with chopped cilantro before serving.', 5, 0),
(1, 8, 'Ground Beef', 'Slice beef sirloin thinly for stir-frying.', 15, 0),
(2, 8, 'Broccoli', 'Cut broccoli into florets for the stir-fry.', 10, 0),
(3, 8, 'Olive Oil', 'Stir-fry beef and broccoli in choice of oil.', 10, 5),
(4, 8, 'Ground Ginger', 'Finely chop ginger for the stir-fry.', 5, 0),
(5, 8, 'Garlic Powder', 'Mince garlic for the stir-fry then add broccoli.', 13, 5),
(9, 8, 'Soy Sauce', 'Mix soy sauce, brown sugar, and rice vinegar. Pour over beef and broccoli.', 5, 5),
(10, 8, 'Potato', 'Dissolve cornstarch in water and add to the stir-fry for thickness.', 5, 3),
(1, 9, 'Pasta', 'Boil lasagna noodles until al dente.', 10, 0),
(2, 9, 'Cheese', 'Spread ricotta cheese (or vegan cheese) over the cooked lasagna noodles.', 5, 0),
(3, 9, 'Spinach', 'Layer spinach over the cheese. Cook in oven until cheese is melted.', 8, 10),
(1, 10, 'Tomatoes', 'Slice fresh tomatoes into rounds.', 10, 0),
(2, 10, 'Cheese', 'Slice fresh mozzarella into rounds.', 5, 0),
(3, 10, 'Basil', 'Pick fresh basil leaves.', 1, 0),
(4, 10, 'Olive Oil', 'Drizzle olive oil over the tomato and mozzarella slices.', 1, 0),
(5, 10, 'Balsamic Glaze', 'Drizzle balsamic glaze over the salad.', 1, 0),
(6, 10, 'Salt', 'Sprinkle salt to taste.', 1, 0),
(7, 10, 'Pepper', 'Add freshly ground black pepper.', 1, 0),
(1, 11, 'Salmon', 'Marinate salmon fillets in a mixture of soy sauce, mirin, brown sugar, and ginger for 30 minutes.', 30, 0),
(2, 11, 'Olive Oil', 'Heat a pan with oil and sear the marinated salmon until cooked through.', 5, 10),
(3, 11, 'Soy Sauce', 'In a separate saucepan, simmer the remaining marinade until it thickens.', 5, 5),
(1, 12, 'Pasta', 'Cook spaghetti according to package instructions. Add to salmon + sauce.', 10, 0),
(2, 12, 'Tomatoes', 'Dice tomatoes and mix with fresh mozzarella and basil.', 8, 0),
(3, 12, 'Cheese', 'Toss the tomato, mozzarella, and basil mixture with the cooked spaghetti.', 5, 0),
(1, 13, 'Ground Beef', 'Sear beef tenderloin on high heat until browned on all sides.', 10, 0),
(2, 13, 'Mushrooms', 'Saute mushrooms in the same pan until golden brown.', 5, 5),
(3, 13, 'Pork Chops', 'Layer prosciutto over the beef tenderloin.', 5, 0),
(4, 13, 'Puff Pastry', 'Wrap the beef, mushrooms, and prosciutto in puff pastry and cook to liking.', 15, 55),
(1, 14, 'Alfredo Sauce', 'Roll out pizza dough and spread Alfredo sauce over it.', 15, 0),
(2, 14, 'Chicken Breast', 'Grill or pan-fry chicken breast until fully cooked. Slice into strips.', 15, 0),
(3, 14, 'Cheese', 'Top the pizza with chicken strips and mozzarella cheese.', 5, 15),
(4, 14, 'Pizza Dough', 'Bake the pizza in the oven until the crust is golden brown and the cheese is melted.', 15, 20),
(1, 15, 'Shrimp', 'Saute shrimp in olive oil until pink and cooked through.', 5, 5),
(2, 15, 'Avocado', 'Dice avocado and mix with cherry tomatoes and mixed greens.', 8, 0),
(3, 15, 'Lime', 'Squeeze lime juice over the shrimp and salad mixture.', 5, 0),
(4, 15, 'Olive Oil', 'Drizzle olive oil over the salad. Toss gently and serve.', 5, 0),
(1, 45, 'Potato', 'Cut potatoes into large cubes/chunks.', 1, 0),
(2, 45, 'Carrot', 'Cut carrots into wedges.', 1, 0),
(3, 45, 'Onion', 'Dice the onion, then place the onion and other vegetables into a pot.', 2, 5),
(4, 45, 'Ground Beef', 'Place the beef into the pot.', 0.5, 0),
(5, 45, 'Water', 'Cover ingredients in water and boil', 0, 15),
(6, 45, 'Tomato Sauce', 'Add tomato sauce as well as a series of spices', 0, 5),
(1, 16, 'Bread', 'Create a dough by kneading and adding flour', 10, 0),
(2, 16, 'Olive Oil', 'Add a drizzle of olive oil on top of the kneaded dough', 2, 0),
(3, 16, 'Tomato Sauce', 'Add tomato sauce on top of the completed dough', 2, 0),
(4, 16, 'Cheese', 'Add large chunks of mozzarella cheese to wherever desired', 1, 0),
(5, 16, 'Pork Chops', 'Add pepperoni slices to the pizza wherever desired', 1, 0),
(6, 16, 'Basil', 'Add some basil and then cook in the oven at 450 degrees F', 1, 20);