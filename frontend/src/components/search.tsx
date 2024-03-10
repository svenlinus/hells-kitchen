
import React, { useState, ChangeEvent, FormEvent, useEffect } from 'react';
import axios from 'axios';
import { Ingredient, IngredientFull } from '../models/ingredient';
import { Button, Paper, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, TextField } from '@mui/material';


const IngredientsSearch: React.FC = () => {
  const [searchTerm, setSearchTerm] = useState<string>('');
  const [ingredients, setIngredients] = useState<IngredientFull[]>([]);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const uri = `http://localhost:8800/ingredients/full`;
    console.warn(uri);
    axios.get<IngredientFull[]>(uri)
      .then((response) => {
        setIngredients(response.data);
        console.warn(response.data);
        setError(null);
      })
      .catch((err) => {
        console.error(err);
        setIngredients([]);
        setError('Ingredients not found');
      });
  }, []);

  const handleSearch = async (e: FormEvent) => {
    e.preventDefault();
    try {
      const uri = `http://localhost:8800/ingredients/full?name=${encodeURIComponent(searchTerm)}`;
      console.warn(uri);
      const response = await axios.get<IngredientFull[]>(uri);

      setIngredients(response.data);
      console.warn(response.data);
      setError(null);
    } catch (err) {
      console.error(err);
      setIngredients([]);
      setError('Ingredient not found');
    }
  };

  return (
    <div style={{maxWidth: "1000px"}}>
      <TextField id="standard-basic" placeholder='Search' hiddenLabel variant="outlined" onChange={(event) => setSearchTerm(event.target.value)} />
      <Button variant="contained" onClick={handleSearch}>Search</Button>

      {ingredients && (
        <TableContainer component={Paper}>
          <Table aria-label="simple table">
            <TableHead>
              <TableRow>
                <TableCell>Name</TableCell>
                <TableCell align="right">Type</TableCell>
                <TableCell align="right">Cost</TableCell>
                <TableCell align="right">Sugar&nbsp;(g)</TableCell>
                <TableCell align="right">Fat&nbsp;(g)</TableCell>
                <TableCell align="right">Protein&nbsp;(g)</TableCell>
                <TableCell align="right">Carbs&nbsp;(g)</TableCell>
                {/* <TableCell align="right">Vegan</TableCell>
                <TableCell align="right">Kosher</TableCell>
                <TableCell align="right">Gluten free</TableCell>
                <TableCell align="right">Dairy free</TableCell>
                <TableCell align="right">Halal</TableCell>
                <TableCell align="right">Nut free</TableCell>
                <TableCell align="right">Vegetarian</TableCell>
                <TableCell align="right">Pescatarian</TableCell>
                <TableCell align="right">Bitter</TableCell>
                <TableCell align="right">Sweet</TableCell>
                <TableCell align="right">Salty</TableCell>
                <TableCell align="right">Sour</TableCell>
                <TableCell align="right">Umami</TableCell> */}
              </TableRow>
            </TableHead>
            <TableBody>
              {ingredients.map((row) => (
                <TableRow>
                  <TableCell component="th" scope="row">{row.ingredient_name}</TableCell>
                  <TableCell align="right">{row.ingredient_type}</TableCell>
                  <TableCell align="right">${row.ingredient_cost}</TableCell>
                  <TableCell align="right">{row.sugar_amt}g</TableCell>
                  <TableCell align="right">{row.fat_amt}g</TableCell>
                  <TableCell align="right">{row.protein_amt}g</TableCell>
                  <TableCell align="right">{row.carb_amt}g</TableCell>
                  {/* <TableCell align="right">{row.is_vegan == 1 ? "true" : "false"}</TableCell>
                  <TableCell align="right">{row.is_kosher == 1 ? "true" : "false"}</TableCell>
                  <TableCell align="right">{row.is_gluten_free == 1 ? "true" : "false"}</TableCell>
                  <TableCell align="right">{row.is_dairy_free == 1 ? "true" : "false"}</TableCell>
                  <TableCell align="right">{row.is_halal == 1 ? "true" : "false"}</TableCell>
                  <TableCell align="right">{row.is_nut_free == 1 ? "true" : "false"}</TableCell>
                  <TableCell align="right">{row.is_vegetarian == 1 ? "true" : "false"}</TableCell>
                  <TableCell align="right">{row.is_pescatarian == 1 ? "true" : "false"}</TableCell>
                  <TableCell align="right">{row.is_bitter == 1 ? "true" : "false"}</TableCell>
                  <TableCell align="right">{row.is_sweet == 1 ? "true" : "false"}</TableCell>
                  <TableCell align="right">{row.is_salty == 1 ? "true" : "false"}</TableCell>
                  <TableCell align="right">{row.is_sour == 1 ? "true" : "false"}</TableCell>
                  <TableCell align="right">{row.is_umami == 1 ? "true" : "false"}</TableCell> */}
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </TableContainer>
      )}

      {error && <p style={{ color: 'red' }}>{error}</p>}
    </div>
  );
};

export default IngredientsSearch;
