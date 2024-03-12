
import React, { useState, ChangeEvent, FormEvent, useEffect } from 'react';
import axios from 'axios';
import { Ingredient, IngredientFull } from '../models/ingredient';
import { Button, Paper, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, TextField } from '@mui/material';
import { DataGrid, GridColDef, GridRowSelectionModel } from '@mui/x-data-grid';
import './search.css'
import { Recipe } from '../models/recipe';
import ViewRecipe from './viewRecipe';

const nutritionWidth = 140;
const tableWidth = 1100;

const ingredientColumns: GridColDef[] = [
  { field: 'ingredient_name', headerName: 'Name', width: 200 },
  { field: 'ingredient_type', headerName: 'Type', width: 120 },
  { field: 'ingredient_cost', headerName: 'Cost', width: nutritionWidth, type: 'number' },
  { field: 'sugar_amt', headerName: 'Sugar (g)', width: nutritionWidth, type: 'number'},
  { field: 'fat_amt', headerName: 'Fat (g)', width: nutritionWidth, type: 'number' },
  { field: 'protein_amt', headerName: 'Protein (g)', width: nutritionWidth, type: 'number' },
  { field: 'carb_amt', headerName: 'Carbs (g)', width: nutritionWidth, type: 'number' },
];

const recipeColumns: GridColDef[] = [
  { field: 'recipe_name', headerName: 'Name', width: tableWidth / 4 },
  { field: 'difficulty', headerName: 'Difficulty', width: tableWidth / 4 },
  { field: 'origin', headerName: 'Origin', width: tableWidth / 4 },
  { field: 'cost', headerName: 'Cost', width: tableWidth / 4 }
];

const IngredientsSearch: React.FC = () => {
  const [searchTerm, setSearchTerm] = useState<string>('');
  const [ingredients, setIngredients] = useState<IngredientFull[]>([]);
  const [recipes, setRecipes] = useState<Recipe[]>([]);
  const [error, setError] = useState<string | null>(null);
  const [selectionModel, setSelectionModel] = useState<GridRowSelectionModel>([]);
  const [recipe, setRecipe] = useState<Recipe | null>(null);

  useEffect(() => {
    const uri = `http://localhost:8800/ingredients/full`;
    axios.get<IngredientFull[]>(uri)
      .then((response) => {
        setIngredients(response.data);
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
      const response = await axios.get<IngredientFull[]>(uri);
      setIngredients(response.data);
      setError(null);
    } catch (err) {
      console.error(err);
      setIngredients([]);
      setError('Ingredient not found');
    }
  };

  const handleSelectionChange = (rowSelectionModel: GridRowSelectionModel) => {
    setSelectionModel(rowSelectionModel);
  }

  const findRecipes = () => {
    if (selectionModel.length == 0) return;
    const ingredients = selectionModel.join(',');
    const uri = `http://localhost:8800/recipes?ingredients=${ingredients}`;
    axios.get<Recipe[]>(uri)
      .then((response) => {
        setRecipes(response.data);
        console.warn(response.data);
        setError(null);
      })
      .catch((err) => {
        console.error(err);
        setRecipes([]);
        setError('Ingredients not found');
      });
  };

  const viewRecipe = (event) => {
    setRecipe(event.row);
  }

  return (
    <div style={{maxWidth: `${tableWidth}px`, margin: '50px auto'}}>
      <TextField id="standard-basic"
        placeholder='Search'
        hiddenLabel
        variant="outlined"
        onChange={handleSearch}
        sx={{minWidth: '100%', height: '100%', marginBottom: '30px'}} />

      {ingredients && (
        <DataGrid
          rows={ingredients}
          columns={ingredientColumns}
          initialState={{
            pagination: {
              paginationModel: { page: 0, pageSize: 10 },
            },
          }}
          getRowId={(row) => row.ingredient_name}
          checkboxSelection
          onRowSelectionModelChange={handleSelectionChange}
          rowSelectionModel={selectionModel}
        />
      )}

      {error && <p style={{ color: 'red' }}>{error}</p>}

      {selectionModel.length > 0 && 
        <Button 
          variant='contained'
          sx={{marginTop: '0'}}
          color='primary'
          onClick={findRecipes}>
            FIND RECIPE
        </Button>
      }

      {recipes.length > 0 && (
        <DataGrid
          sx={{margin: '40px 0'}}
          rows={recipes}
          columns={recipeColumns}
          initialState={{
            pagination: {
              paginationModel: { page: 0, pageSize: 10 },
            },
          }}
          getRowId={(row) => row.recipe_id}
          onRowClick={viewRecipe}
        />
      )}

      {recipe && (
        <ViewRecipe recipe={recipe} />
      )}
    </div>
  );
};

export default IngredientsSearch;
