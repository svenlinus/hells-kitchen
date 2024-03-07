
import React, { useState, ChangeEvent, FormEvent } from 'react';
import axios from 'axios';
import { Ingredient } from '../models/ingredient';

const IngredientsSearch: React.FC = () => {
  const [searchTerm, setSearchTerm] = useState<string>('');
  const [ingredient, setIngredient] = useState<Ingredient | null>(null);
  const [error, setError] = useState<string | null>(null);

  const handleInputChange = (e: ChangeEvent<HTMLInputElement>) => {
    setSearchTerm(e.target.value);
  };

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault();
    console.warn(searchTerm);
    try {
      const uri = `http://localhost:8800/ingredients?name=${encodeURIComponent(searchTerm)}`;
      console.warn(uri);
      const response = await axios.get<Ingredient>(uri);

      setIngredient(response.data[0]);
      console.warn(response.data[0]);
      setError(null);
    } catch (err) {
      console.error(err);
      setIngredient(null);
      setError('Ingredient not found');
    }
  };

  return (
    <div>
      <form onSubmit={handleSubmit}>
        <label>
          Search for Ingredient:
          <input type="text" value={searchTerm} onChange={handleInputChange} />
        </label>
        <button type="submit">Search</button>
      </form>

      {ingredient && (
        <div>
          <h2>Ingredient Details</h2>
          <p>Name: {ingredient.ingredient_name}</p>
          <p>Type: {ingredient.ingredient_type}</p>
          <p>Cost: ${ingredient.ingredient_cost}</p>
          
        </div>
      )}

      {error && <p style={{ color: 'red' }}>{error}</p>}
    </div>
  );
};

export default IngredientsSearch;
