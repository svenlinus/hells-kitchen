-- Gordon Ramseys Recipe Database
DROP DATABASE IF EXISTS HELLSKITCHEN;
CREATE DATABASE HELLSKITCHEN;
USE HELLSKITCHEN;

CREATE TABLE
IF NOT EXISTS INGREDIENT
(
	ingredient_name VARCHAR
(50),
    ingredient_type VARCHAR
(50),
    ingredient_cost FLOAT,
    PRIMARY KEY
(ingredient_name)
);

CREATE TABLE
IF NOT EXISTS RESTRICTION
(
	ingredient_name VARCHAR
(50),
	ingredient_type VARCHAR
(50),
    is_vegan BOOLEAN,
    is_kosher BOOLEAN,
    is_gluten_free BOOLEAN,
    is_dairy_free BOOLEAN,
    is_halal BOOLEAN,
    is_nut_free BOOLEAN,
    is_vegetarian BOOLEAN,
    is_pescatarian BOOLEAN,
	PRIMARY KEY
(ingredient_name, ingredient_type),
    FOREIGN KEY
(ingredient_name) REFERENCES INGREDIENT
(ingredient_name)
);

CREATE TABLE
IF NOT EXISTS INVENTORY
(
	ingredient_name VARCHAR
(50),
    inventory_amt FLOAT,
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
(50),
	sugar_amt FLOAT,
    fat_amt FLOAT,
    protein_amt FLOAT,
    carb_amt FLOAT,
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
(50),
    is_bitter BOOLEAN,
    is_sweet BOOLEAN,
    is_salty BOOLEAN,
    is_sour BOOLEAN,
    is_umami BOOLEAN,
	PRIMARY KEY
(ingredient_name),
    FOREIGN KEY
(ingredient_name) REFERENCES INGREDIENT
(ingredient_name)
);

CREATE TABLE
IF NOT EXISTS RECIPE
(
	recipe_id INT,
    difficulty VARCHAR
(15),
    recipe_name VARCHAR
(50),
    origin VARCHAR
(50),
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
(recipe_id, ingredient_name),
    FOREIGN KEY
(recipe_id) REFERENCES RECIPE
(recipe_id),
    FOREIGN KEY
(ingredient_name) REFERENCES INGREDIENT
(ingredient_name)
);

-- insert into ingredient
-- Meat
INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Chicken Breast', 'Meat', 3.99);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Salmon', 'Seafood', 7.99);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Pork Chops', 'Meat', 5.49);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Shrimp', 'Seafood', 9.99);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Ground Beef', 'Meat', 4.49);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Ground Turkey', 'Meat', 4.99);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Lamb Chops', 'Meat', 8.99);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Turkey Breast', 'Meat', 6.99);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Sirloin Steak', 'Meat', 9.99);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Ground Pork', 'Meat', 4.49);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Tilapia', 'Seafood', 5.99);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Chicken Thighs', 'Meat', 2.99);

-- Vegetables
INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Carrot', 'Vegetable', 0.75);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Broccoli', 'Vegetable', 1.25);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Bell Pepper', 'Vegetable', 1.25);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Zucchini', 'Vegetable', 1.00);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Spinach', 'Vegetable', 1.50);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Cucumber', 'Vegetable', 0.99);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Onion', 'Vegetable', 0.75);

-- Fruits
INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Apple', 'Fruit', 0.75);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Banana', 'Fruit', 0.5);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Strawberries', 'Fruit', 2.99);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Mango', 'Fruit', 2.50);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Grapes', 'Fruit', 3.49);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Pineapple', 'Fruit', 2.99);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Avocado', 'Fruit', 1.50);

-- Grains
INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Rice', 'Grain', 1.99);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Quinoa', 'Grain', 2.49);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Pasta', 'Grain', 1.29);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Bread', 'Grain', 2.49);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Oats', 'Grain', 1.79);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Couscous', 'Grain', 2.19);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Barley', 'Grain', 1.89);

-- Dairy
INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Milk', 'Dairy', 1.99);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Cheese', 'Dairy', 3.49);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Yogurt', 'Dairy', 2.79);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Butter', 'Dairy', 2.29);

-- Condiments
INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Olive Oil', 'Condiment', 4.99);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Soy Sauce', 'Condiment', 2.29);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Honey', 'Condiment', 3.99);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Ketchup', 'Condiment', 1.49);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Mustard', 'Condiment', 1.29);

-- Herbs and Spices
INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Basil', 'Spice', 1.99);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Cumin', 'Spice', 1.79);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Thyme', 'Spice', 1.69);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Rosemary', 'Spice', 1.79);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Parsley', 'Spice', 1.29);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Cilantro', 'Spice', 1.49);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Oregano', 'Spice', 1.59);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Dill', 'Spice', 1.39);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Bay Leaves', 'Spice', 1.99);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Sage', 'Spice', 1.89);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Coriander', 'Spice', 1.69);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Turmeric', 'Spice', 2.29);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Cardamom', 'Spice', 3.49);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Cinnamon', 'Spice', 1.99);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Nutmeg', 'Spice', 2.99);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Paprika', 'Spice', 1.79);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Chili Powder', 'Spice', 1.49);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Garlic Powder', 'Spice', 1.49);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Onion Powder', 'Spice', 1.29);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Cayenne Pepper', 'Spice', 1.79);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Ground Ginger', 'Spice', 1.99);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Ground Turmeric', 'Spice', 2.29);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Crushed Red Pepper', 'Spice', 1.49);

-- Nuts and Seeds
INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Almonds', 'Nut', 5.99);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Chia Seeds', 'Nut', 3.49);

-- Canned Goods
INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Tomato Sauce', 'Canned Good', 1.29);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Canned Chickpeas', 'Canned Good', 1.99);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Canned Corn', 'Canned Good', 1.29);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Canned Tomatoes', 'Canned Good', 1.49);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Canned Beans', 'Canned Good', 1.19);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Canned Tuna', 'Canned Good', 2.49);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Canned Salmon', 'Canned Good', 3.99);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Canned Black Beans', 'Canned Good', 1.29);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Canned Green Beans', 'Canned Good', 1.39);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Canned Peas', 'Canned Good', 1.19);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Canned Pineapple', 'Canned Good', 1.79);

INSERT INTO INGREDIENT
    (ingredient_name, ingredient_type, ingredient_cost)
VALUES
    ('Canned Peaches', 'Canned Good', 2.29);


-- insert into RESTRICTION
-- Meat
INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Chicken Breast', 'Meat', false, false, true, true, true, true, false, false);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Salmon', 'Seafood', false, true, true, true, true, true, false, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Pork Chops', 'Meat', false, false, true, true, false, true, false, false);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Shrimp', 'Seafood', false, false, true, true, false, true, false, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Ground Beef', 'Meat', false, false, true, true, false, true, false, false);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Ground Turkey', 'Meat', false, true, true, true, true, true, false, false);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Lamb Chops', 'Meat', false, true, true, true, true, true, false, false);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Turkey Breast', 'Meat', false, true, true, true, true, true, false, false);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Sirloin Steak', 'Meat', false, false, true, true, false, true, false, false);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Ground Pork', 'Meat', false, false, true, true, false, true, false, false);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Tilapia', 'Seafood', false, true, true, true, true, true, false, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Chicken Thighs', 'Meat', false, false, true, true, true, true, false, false);

-- Vegetables
INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Carrot', 'Vegetable', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Broccoli', 'Vegetable', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Bell Pepper', 'Vegetable', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Zucchini', 'Vegetable', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Spinach', 'Vegetable', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Cucumber', 'Vegetable', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Onion', 'Vegetable', true, true, true, true, true, true, true, true);

-- Fruits
INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Apple', 'Fruit', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Banana', 'Fruit', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Strawberries', 'Fruit', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Mango', 'Fruit', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Grapes', 'Fruit', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Pineapple', 'Fruit', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Avocado', 'Fruit', true, true, true, true, true, true, true, true);

-- Grains
INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Rice', 'Grain', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Quinoa', 'Grain', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Pasta', 'Grain', true, true, false, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Bread', 'Grain', true, true, false, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Oats', 'Grain', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Couscous', 'Grain', true, true, false, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Barley', 'Grain', true, true, false, true, true, true, true, true);

-- Dairy
INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Milk', 'Dairy', false, true, true, false, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Cheese', 'Dairy', false, true, true, false, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Yogurt', 'Dairy', false, true, true, false, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Butter', 'Dairy', false, true, true, false, true, true, true, true);

-- Condiments
INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Olive Oil', 'Condiment', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Soy Sauce', 'Condiment', true, true, false, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Honey', 'Condiment', false, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Ketchup', 'Condiment', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Mustard', 'Condiment', true, true, true, true, true, true, true, true);

-- Herbs and Spices
INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Basil', 'Spice', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Cumin', 'Spice', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Thyme', 'Spice', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Rosemary', 'Spice', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Parsley', 'Spice', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Cilantro', 'Spice', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Oregano', 'Spice', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Dill', 'Spice', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Bay Leaves', 'Spice', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Sage', 'Spice', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Coriander', 'Spice', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Turmeric', 'Spice', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Cardamom', 'Spice', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Cinnamon', 'Spice', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Nutmeg', 'Condiment', true, true, true, true, true, false, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Paprika', 'Spice', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Chili Powder', 'Spice', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Garlic Powder', 'Spice', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Onion Powder', 'Spice', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Cayenne Pepper', 'Spice', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Ground Ginger', 'Spice', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Ground Turmeric', 'Spice', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Crushed Red Pepper', 'Spice', true, true, true, true, true, true, true, true);

-- Nuts and Seeds
INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Almonds', 'Nut', true, true, true, true, true, false, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Chia Seeds', 'Nut', true, true, true, true, true, false, true, true);

-- Canned Goods
INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Tomato Sauce', 'Canned Good', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Canned Chickpeas', 'Canned Good', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Canned Corn', 'Canned Good', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Canned Tomatoes', 'Canned Good', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Canned Beans', 'Canned Good', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Canned Tuna', 'Canned Good', false, false, true, true, true, true, false, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Canned Salmon', 'Canned Good', false, true, true, true, true, true, false, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Canned Black Beans', 'Canned Good', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Canned Green Beans', 'Canned Good', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Canned Peas', 'Canned Good', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Canned Pineapple', 'Canned Good', true, true, true, true, true, true, true, true);

INSERT INTO RESTRICTION
    (
    ingredient_name,
    ingredient_type,
    is_vegan,
    is_kosher,
    is_gluten_free,
    is_dairy_free,
    is_halal,
    is_nut_free,
    is_vegetarian,
    is_pescatarian)
VALUES
    ('Canned Peaches', 'Canned Good', true, true, true, true, true, true, true, true);

-- insert into NUTRITION
-- Meat
INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Chicken Breast', 0, 2.7, 26, 0);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Salmon', 0, 4.3, 23.5, 0);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Pork Chops', 0, 11.7, 52.7, 0);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Shrimp', 0, 1.4, 19.4, 1.3);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Ground Beef', 0, 5.65, 24.19, 0);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Ground Turkey', 0, 16.6, 34.5, 0);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Lamb Chops', 0, 22.89, 24.96, 0);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Turkey Breast', 0, 1.8, 26, 0);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Sirloin Steak', 0, 6.4, 22.8, 0);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Ground Pork', 0, 18, 22, 0);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Tilapia', 0, 4.5, 44, 0);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Chicken Thighs', 0, 9, 20, 0);

-- Vegetables
INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Carrot', 4.7, 0.2, 0.9, 9.6);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Broccoli', 1.55, 0.34, 2.57, 6.04);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Bell Pepper', 5.0, 0.36, 1.2, 7.2);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Zucchini', 3.1, 0.4, 1.5, 3.9);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Spinach', 0.13, 0.12, 0.86, 1.1);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Cucumber', 1.7, 0.11, 0.68, 3.8);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Onion', 4.4, 0.2, 1.3, 9.5);

-- Fruits
INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Apple', 13, 0.21, 0.33, 17.3);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Banana', 14, 0.4, 1.3, 27);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Strawberries', 4.9, 0.3, 0.7, 7.7);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Mango', 45, 1, 3, 50);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Grapes', 15, 0.3, 0.6, 16);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Pineapple', 16, 0.2, 0.89, 21.65);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Avocado', 1.3, 29, 4, 17);

-- Grains
INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Rice', 0.08, 0.44, 4.3, 44.5);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Quinoa', 0.8, 1.8, 4.1, 20);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Pasta', 0.7, 1.2, 7.2, 38);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Bread', 1.6, 0.97, 2.6, 14.3);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Oats', 0.4, 2.6, 5.3, 27);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Couscous', 0.2, 0.3, 6, 36);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Barley', 0.69, 0.44, 3.55, 44.3);

-- Dairy
INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Milk', 24.6, 15.9, 15.4, 23.4);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Cheese', 0.1, 9.3, 6.4, 0.9);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Yogurt', 12, 2.6, 8.9, 12);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Butter', 0.01, 11.52, 0.12, 0.01);

-- Condiments
INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Olive Oil', 0, 14, 0, 0);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Soy Sauce', 0.06, 0.09, 1.3, 0.79);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Honey', 13.2, 0, 0.06, 17.3);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Ketchup', 3.6, 0, 0.2, 4.7);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Mustard', 0.05, 0.17, 0.19, 0.29);

-- Herbs and Spices
INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Basil', 0.01, 0.02, 0.08, 0.07);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Cumin', 0.1, 0.5, 0.4, 0.9);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Thyme', 0, 0.1, 0.1, 0.9);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Rosemary', 0, 0, 0, 0.1);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Parsley', 0, 0, 0.1, 0.2);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Cilantro', 0, 0, 0, 0.1);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Oregano', 0, 0, 0.1, 0.7);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Dill', 0, 0, 0, 0.1);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Bay Leaves', 0, 0, 0, 0.2);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Sage', 0, 0, 0, 0);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Coriander', 0, 0, 0.1, 0.2);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Turmeric', 0.1, 0.1, 0.3, 2);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Cardamom', 0, 0.1, 0.2, 1.4);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Cinnamon', 0.06, 0.03, 0.1, 2.1);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Nutmeg', 0.07, 0.8, 0.13, 1.1);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Paprika', 0.7, 0.88, 0.96, 3.7);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Chili Powder', 0.2, 0.4, 0.4, 1.3);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Garlic Powder', 0.63, 0.02, 0.47, 2.04);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Onion Powder', 0.2, 0, 0.3, 1.9);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Cayenne Pepper', 0.2, 0.3, 0.2, 1);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Ground Ginger', 0.06, 0.08, 0.16, 1.3);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Ground Turmeric', 0.1, 0.1, 0.3, 2);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Crushed Red Pepper', 0.2, 0.3, 0.2, 1);

-- Nuts and Seeds
INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Almonds', 1.2, 14.2, 6, 6.1);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Chia Seeds', 0, 8.7, 4.7, 12);

-- Canned Goods
INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Tomato Sauce', 4.4, 0.4, 1.5, 6.5);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Canned Chickpeas', 10, 7, 18, 57);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Canned Corn', 12, 3.2, 6, 38);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Canned Tomatoes', 4.8, 0.5, 1.5, 6.6);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Canned Beans', 5.4, 2.8, 16, 47);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Canned Tuna', 0, 5.1, 41, 0);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Canned Salmon', 0, 16, 73, 0);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Canned Black Beans', 0.9, 1.6, 25, 68);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Canned Green Beans', 1.1, 0.6, 1.5, 5.8);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Canned Peas', 4, 0.6, 3.7, 13);

INSERT INTO NUTRITION
    (
    ingredient_name,
    sugar_amt,
    fat_amt,
    protein_amt,
    carb_amt)
VALUES
    ('Canned Pineapple', 36, 0.2, 1, 39);


INSERT INTO FLAVORPROFILE
    (ingredient_name, is_bitter, is_sweet, is_salty, is_sour, is_umami)
VALUES
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
    ('Zucchini', TRUE, TRUE, FALSE, FALSE, FALSE),
    ('Mushrooms', TRUE, FALSE, FALSE, FALSE, TRUE),
    ('Water', FALSE, FALSE, FALSE, FALSE, TRUE);

INSERT INTO INGREDIENT (ingredient_name, ingredient_type, ingredient_cost) VALUES 
('Mushrooms', 'Vegetable', 3.25),
('Water', 'Broth', 0.0);

INSERT INTO NUTRITION (ingredient_name, sugar_amt, fat_amt, protein_amt, carb_amt)
VALUES ('Mushrooms', 0.3, 0.1, 0.3, 0.6);

INSERT INTO RESTRICTION (ingredient_name, ingredient_type, is_vegan, is_kosher, is_gluten_free, is_dairy_free, is_halal, is_nut_free, is_vegetarian, is_pescatarian)
VALUES ('Mushrooms', 'Vegetable', true, true, true, true, true, true, true, true);

INSERT INTO NUTRITION (ingredient_name, sugar_amt, fat_amt, protein_amt, carb_amt)
VALUES ('Water', 0, 0, 0, 0);

INSERT INTO RESTRICTION (ingredient_name, ingredient_type, is_vegan, is_kosher, is_gluten_free, is_dairy_free, is_halal, is_nut_free, is_vegetarian, is_pescatarian)
VALUES ('Water', 'Broth', true, true, true, true, true, true, true, true);

INSERT INTO RECIPE
    (recipe_id, difficulty, recipe_name, origin)
VALUES
    (44, 'Easy', 'Mac n Cheese', 'USA'),
    (45, 'Medium', 'Mac n Cheese', 'USA'),
    (46, 'Hard', 'Mac n Cheese', 'USA');
INSERT INTO RECIPE (recipe_id, difficulty, recipe_name, origin) VALUES
(1, 'Easy', 'Spaghetti Bolognese', 'Italian'),
(2, 'Medium', 'Chicken Alfredo', 'Italian');

INSERT INTO INGREDIENTLIST (recipe_id, ingredient_name, ingredient_amt) VALUES
(1, 'Spaghetti', 250.0),
(1, 'Ground Beef', 500.0),
(1, 'Tomato Sauce', 700.0),
(1, 'Salt', 5.0),
(2, 'Chicken Breast', 400.0),
(2, 'Fettuccine', 300.0),
(2, 'Alfredo Sauce', 500.0);
INSERT INTO INGREDIENTLIST (recipe_id, ingredient_name, ingredient_amt)
VALUES (44, 'Cheese', 44),
(44, 'Pasta', 80),
(44, 'Water', 800);

INSERT INTO RECIPESTEP (step_number, recipe_id, ingredient_name, step_descript, prep_time, cook_time) VALUES
(1, 1, 'Spaghetti', 'Boil spaghetti according to package instructions, until just before al dente.', 1, 10),
(2, 1, 'Ground Beef', 'Cook ground beef until browned.', 1, 10),
(3, 1, 'Salt', 'Season ground beef with choice of seasonings, usually salt and pepper.', 1, 0),
(4, 1, 'Tomato Sauce', 'Add tomato sauce and simmer.', 1, 5),
(1, 2, 'Salt', 'Season raw chicken with seasonings, usually salt and pepper. Optionally let sit overnight.', 5, 0),
(2, 2, 'Chicken Breast', 'Grill or pan-fry chicken breast until fully cooked, 150-160 degrees farenheit. Let cool.', 5, 15),
(3, 2, 'Fettuccine', 'Cook fettuccine according to package instructions.', 1, 10),
(3, 2, 'Alfredo Sauce', 'Add fetticcine to pan or pot with alfredo and mix thoroughly. Add cookied and cut chicken. Season to taste.', 1, 10);

INSERT INTO RECIPESTEP (step_number, recipe_id, ingredient_name, step_descript, prep_time, cook_time)
VALUES (1, 44, 'Water', 'Begin to boil water.', 0, 7.5),
(2, 44, 'Pasta', 'Place pasta into the boiling water.', 0, 15),
(3, 44, 'Cheese', 'Melt cheese and pour it over the pasta when it is finished', 2, 0);

