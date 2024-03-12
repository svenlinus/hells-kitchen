import { Button, MenuItem, Select, TextField, ToggleButton, ToggleButtonGroup, Typography } from "@mui/material";
import axios from "axios";
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

let ingredientName = '';
let ingredientCost = 0;
let sugar = 0,
    fat = 0,
    protein = 0,
    carb = 0;

const AddIngredients = () => {
  const [ingredientType, setType] = useState<Type>(Type.Broth);
  // const [restrictions, setRestrictions] = useState<String[]>([]);
  const [flavors, setFlavors] = useState<String[]>([]);
  const [error, setError] = useState<String>('');
  const [success, setSuccess] = useState<String>('');

  const addIngredient = () => {
    const flavorProfile = [
      flavors.includes('bitter'),
      flavors.includes('sweet'),
      flavors.includes('salty'),
      flavors.includes('sour'),
      flavors.includes('umami'),
    ];
    const data = {
      name: ingredientName,
      type: ingredientType,
      cost: ingredientCost,
      flavorProfile: flavorProfile,
      sugar,
      fat,
      protein,
      carb
    }
    console.warn(data);
    axios.post(`http://localhost:8800/ingredient`, data)
      .then(() => axios.post(`http://localhost:8800/flavor`, data))
      .then(() => axios.post('http://localhost:8800/nutrition', data))
      .then((value) => {
        if (value.data?.code && value.data?.sqlMessage) {
          setError(value.data.sqlMessage);
          setSuccess('');
        }
        else {
          setSuccess(`Successfully inserted ${data.name}`);
          setError('');
        }
      })
      .catch((err) => console.error(err));
  };  

  return <div style={{maxWidth: `${tableWidth}px`, margin: '30px auto 50px'}}>
    <div className="container-card padded">
      <Typography variant="h5" sx={{mb: '20px'}}>Add Ingredient</Typography>
      <div className="input-row">
        <TextField 
          label="Name" 
          variant="outlined" 
          fullWidth
          onChange={(event) => ingredientName = event.target.value} />
        <Select
          value={ingredientType}
          fullWidth
          onChange={(event) => setType(event.target.value as Type)}
        >
          {Object.keys(Type).map((key) => (
            <MenuItem value={key}>{Type[key]}</MenuItem>
          ))}
        </Select>
        <TextField 
          label="Cost ($)" 
          variant="outlined" 
          type="number" 
          fullWidth
          onChange={(event) => ingredientCost = Number(event.target.value)} />
      </div>
      <div className="input-row">
        <TextField label="Sugar (g)" variant="outlined" type="number" fullWidth onChange={(event) => sugar = Number(event.target.value)} />
        <TextField label="Fat (g)" variant="outlined" type="number" fullWidth onChange={(event) => fat = Number(event.target.value)} />
        <TextField label="Protein (g)" variant="outlined" type="number" fullWidth onChange={(event) => protein = Number(event.target.value)} />
        <TextField label="Carbs (g)" variant="outlined" type="number" fullWidth onChange={(event) => carb = Number(event.target.value)} />
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
      {error && <p style={{ color: 'var(--error)' }}>{error}</p>}
      {success && <p style={{ color: 'white' }}>{success}</p>}
    </div>
  </div>
};

export default AddIngredients;