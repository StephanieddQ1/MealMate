// Import required modules
const express = require('express');
const app = express();

app.get('/', (req, res) => {
  // Get user's budget and food continent from the query parameters
  const { budget, continent } = req.query;

  // Check inputs
  if (!budget || !continent) {
    return res.status(400).json({ error: 'Invalid parameters' });
  }

  // Check user's budget range
  let budgetRange;
  switch (budget) {
    case 'low':
      budgetRange = 'low-budget';
      break;
    case 'medium':
      budgetRange = 'medium-budget';
      break;
    case 'high':
      budgetRange = 'high-budget';
      break;
    default:
      return res.status(400).json({ error: 'Invalid budget range' });
  }

  // Load food data based on the selected continent
  let foodData;
  try {
    foodData = require(`../dataset/${budgetRange}/${continent}.json`);
  } catch (error) {
    // If the continent file is not found, fallback to the 'rest.js' file
    foodData = require(`./data/${budgetRange}/rest.js`);
  }

  // Randomly select a food recommendation from the food data
  const randomIndex = Math.floor(Math.random() * foodData.length);
  const recommendation = foodData[randomIndex];

  // HTML markup for the recommendations
  const html = `
    <h2>${recommendation.name}</h2>
    <p>${recommendation.about}</p>
    <h3>Ingredients:</h3>
    <ul>
      ${recommendation.ingredients.map(ingredient => `<li>${ingredient}</li>`).join('')}
    </ul>
    <h3>Instructions:</h3>
    <ul>
      ${recommendation.instructions.map(instruction => `<li>${instruction}</li>`).join('')}
    </ul>
`;


  // Send HTML markup as the response
  res.send(html);
});

// Start the server
const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
