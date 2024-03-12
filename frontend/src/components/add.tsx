import { Button, MenuItem, Select, TextField, ToggleButton, ToggleButtonGroup, Typography } from "@mui/material";
import React, { useState } from "react";

const tableWidth = 1100;
enum Type {
  Broth = 'Broth',
  Nuts = 'Nuts',
  Fruit = 'Fruit',
  Oil = 'Oil',
  Grain = 'Grain',
  Spice = 'Spice',
  Vegetable = 'Vegetable',
  Dairy = 'Dairy',
  CannedGood = 'Canned Good',
  Nut = 'Nut',
  Meal = 'Meal',
  Condiment = 'Condiment',
  Seafood = 'Seafood',
  Sauce = 'Sauce'
}

const AddIngredients = () => {
  const [ingredientType, setType] = useState<Type>(Type.Broth);
  const [restrictions, setRestrictions] = useState<String[]>([]);
  const [flavors, setFlavors] = useState<String[]>([]);

  const addIngredient = () => {
    
  };

  return <div style={{maxWidth: `${tableWidth}px`, margin: '30px auto 50px'}}>
    <div className="container-card padded">
      <Typography variant="h5" sx={{mb: '20px'}}>Add Ingredient</Typography>
      <div className="input-row">
        <TextField label="Name" variant="outlined" fullWidth />
        <Select
          value={ingredientType}
          fullWidth
          onChange={(event) => setType(event.target.value as Type)}
        >
          {Object.keys(Type).map((key) => (
            <MenuItem value={key}>{Type[key]}</MenuItem>
          ))}
        </Select>
        <TextField label="Cost ($)" variant="outlined" type="number" fullWidth />
      </div>
      <div className="input-row">
        <TextField label="Sugar (g)" variant="outlined" type="number" fullWidth />
        <TextField label="Fat (g)" variant="outlined" type="number" fullWidth />
        <TextField label="Protein (g)" variant="outlined" type="number" fullWidth />
        <TextField label="Carbs (g)" variant="outlined" type="number" fullWidth />
      </div>
      {/* <div className="input-row">
        <ToggleButtonGroup
          color="primary"
          value={restrictions}
          onChange={(_, newR) => setRestrictions(newR)}
          fullWidth
        >
          <ToggleButton value="vegan">Vegan</ToggleButton>
          <ToggleButton value="kosher">Kosher</ToggleButton>
          <ToggleButton value="gluten">Gluten Free</ToggleButton>
          <ToggleButton value="dairy">Dairy</ToggleButton>
          <ToggleButton value="halal">Halal</ToggleButton>
          <ToggleButton value="nut">Nut free</ToggleButton>
          <ToggleButton value="vegetarian">Vegetarian</ToggleButton>
          <ToggleButton value="pescatarian">Pescatarian</ToggleButton>
        </ToggleButtonGroup>
      </div> */}
      <div className="input-row">
        <ToggleButtonGroup
          color="primary"
          value={flavors}
          onChange={(_, newF) => setFlavors(newF)}
          fullWidth
        >
          <ToggleButton value="bitter">bitter</ToggleButton>
          <ToggleButton value="sweet">sweet</ToggleButton>
          <ToggleButton value="salty">salty</ToggleButton>
          <ToggleButton value="sour">sour</ToggleButton>
          <ToggleButton value="umami">umami</ToggleButton>
        </ToggleButtonGroup>
      </div>
      <Button 
        variant='contained'
        color='primary'
        onClick={addIngredient}
      >
        Add Ingredient
      </Button>
    </div>
  </div>
};

export default AddIngredients;