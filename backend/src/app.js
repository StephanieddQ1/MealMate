const fs = require('fs');

// Read the recipes from the JSON file
const recipesData = fs.readFileSync('/workspaces/MealMate/backend/dataset/low-budget/Africa.json', 'utf-8');

// Parse the JSON data
const recipes = JSON.parse(recipesData);

// Check if any recipes exist
if (recipes.length === 0) {
  console.log('No recipes found.');
} else {
  // Get the first recipe in the array
  const recipe = recipes[0];

  // Access the recipe details
  const name = recipe.name;
  const about = recipe.about;
  const ingredients = recipe.ingredients;
  const instructions = recipe.instructions;

  // Print the recipe details
  console.log(`Recipe: ${name} \n${about}`);
  console.log('\nIngredients:');
  ingredients.forEach(ingredient => console.log(ingredient));
  console.log('\nInstructions:');
  instructions.forEach(step => console.log(step));
}
