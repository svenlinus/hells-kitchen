import { useEffect, useState } from "react";
import { Recipe } from "../models/recipe";
import React from "react";
import axios from "axios";
import { Card, CardContent, Checkbox, Typography } from "@mui/material";
import { Ingredient } from "../models/ingredient";
import { RecipeStep } from "../models/recipeStep";
import './viewRecipe.css';
import TimerOutlinedIcon from '@mui/icons-material/TimerOutlined';

const ViewRecipe = (props: {recipe}) => {
  const { recipe } = props;
  const [ingredients, setIngredients] = useState<Ingredient[]>([]);
  const [instructions, setInstructions] = useState<RecipeStep[]>([]);
  const [currentStep, setCurrentStep] = useState<number>(0);

  useEffect(() => {
    let uri = `http://localhost:8800/ingredients?recipe=${recipe.recipe_id}`;
    axios.get<Ingredient[]>(uri)
      .then((response) => {
        setIngredients(response.data);
        console.log(response.data)
      })
      .catch((err) => {
        console.error(err);
        setIngredients([]);
      });
    uri = `http://localhost:8800/steps?recipe=${recipe.recipe_id}`;
    axios.get<RecipeStep[]>(uri)
      .then((response) => {
        setInstructions(response.data);
        console.log(response.data)
      })
      .catch((err) => {
        console.error(err);
        setInstructions([]);
      });
  }, [recipe])

  const incrementStep = () => {
    setCurrentStep((currentStep + 1) % instructions.length);
  }

  return (
    <div>
      <div className="container-card">
        <CardContent>
          <Typography variant="h6" color="text.secondary" gutterBottom>
            Recipe:
          </Typography>
          <Typography variant="h5" component="div">
            {recipe.recipe_name}
          </Typography>
        </CardContent>
      </div>
      <div className="container-card">
        <CardContent>
          <Typography variant="h6" color="text.secondary" gutterBottom>
            Ingredients:
          </Typography>
          {ingredients.map((ingredient) => (
            <div className="ingredient">
              <Checkbox />
              <Typography variant="h6">{`${ingredient.ingredient_name} - $${ingredient.ingredient_cost}`}</Typography>
            </div>
          ))}
        </CardContent>
      </div>
      <div className="container-card instructions" onClick={incrementStep}>
        <CardContent>
          <Typography variant="h6" color="text.secondary" sx={{mb: '25px'}}>
            Instructions:
          </Typography>
          <div className="columns">
            {instructions.map((step, i) => (
              <div className={"step" + (currentStep == i ? " active" : "")}>
                <div className="step-info">
                  <div className="num">{step.step_number}</div>
                  <div className="time">
                    {step.prep_time + step.cook_time} min
                    <TimerOutlinedIcon />
                  </div>
                </div>
                <Typography variant="h6" sx={{mb: '25px'}}>{step.step_descript}</Typography>
              </div>
            ))}
          </div>
        </CardContent>
      </div>
    </div>
  );
}

export default ViewRecipe;