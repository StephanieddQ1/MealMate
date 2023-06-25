const fs = require('fs');

// Read the JSON file
fs.readFile('/workspaces/MealMate/backend/dataset/low-budget/Asia.json', 'utf8', (err, data) => {
  if (err) {
    console.error('Error reading file:', err);
    return;
  }

  try {
    // Parse the JSON data
    const jsonData = JSON.parse(data);

    // Check the length of the array
    const numberOfLists = jsonData.length;

    console.log('Number of lists:', numberOfLists);
  } catch (error) {
    console.error('Error parsing JSON:', error);
  }
});
