export interface Ingredient {
  ingredient_name: string;
  ingredient_type: string;
  ingredient_cost: string;
}

export interface IngredientFull {
  ingredient_name: string;
  ingredient_type: string;
  ingredient_cost: string;
  is_vegan: number;
  is_kosher: number;
  is_gluten_free: number;
  is_dairy_free: number;
  is_halal: number;
  is_nut_free: number;
  is_vegetarian: number;
  is_pescatarian: number;
  sugar_amt: number;
  fat_amt: number;
  protein_amt: number;
  carb_amt: number;
  is_bitter: number;
  is_sweet: number;
  is_salty: number;
  is_sour: number;
  is_umami: number;
}