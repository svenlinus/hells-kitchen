
import React, { useState, ChangeEvent, FormEvent, useEffect } from 'react';
import axios from 'axios';
import { Ingredient, IngredientFull, IngredientRow } from '../models/ingredient';
import { Button, Paper, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, TextField } from '@mui/material';
import { DataGrid, GridColDef, GridValueGetterParams } from '@mui/x-data-grid';
import './search.css'

const nutritionWidth = 140;

const columns: GridColDef[] = [
  { field: 'ingredient_name', headerName: 'Name', width: 200 },
  { field: 'ingredient_type', headerName: 'Type', width: 120 },
  { field: 'ingredient_cost', headerName: 'Cost', width: nutritionWidth, type: 'number' },
  { field: 'sugar_amt', headerName: 'Sugar (g)', width: nutritionWidth, type: 'number'},
  { field: 'fat_amt', headerName: 'Fat (g)', width: nutritionWidth, type: 'number' },
  { field: 'protein_amt', headerName: 'Protein (g)', width: nutritionWidth, type: 'number' },
  { field: 'carb_amt', headerName: 'Carbs (g)', width: nutritionWidth, type: 'number' },
];

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

  const handleSearch = async (event: any) => {
    if (event.target?.value) setSearchTerm(event.target.value)
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
    <div style={{maxWidth: "1100px", margin: '50px auto'}}>
      <TextField id="standard-basic"
        placeholder='Search'
        hiddenLabel
        variant="outlined"
        onChange={handleSearch}
        sx={{minWidth: '100%', height: '100%', marginBottom: '30px'}} />

      {ingredients && (
        <DataGrid
          rows={ingredients}
          columns={columns}
          initialState={{
            pagination: {
              paginationModel: { page: 0, pageSize: 10 },
            },
          }}
          getRowId={(row) => row.ingredient_name}
          checkboxSelection
        />
      )}

      {error && <p style={{ color: 'red' }}>{error}</p>}
    </div>
  );
};

export default IngredientsSearch;
