const express = require('express');
const router = express.Router();
const db = require("../database/connection");


router.get('/:id', async (req, res) => {
    const recipeId = req.params.id;

    // Query to get the recipe details
    const recipeQuery = 'SELECT * FROM recipes WHERE recipe_id = ?';

    // Query to get the ingredients and their quantities
    const ingredientsQuery = `
        SELECT i.*, ri.quantity 
        FROM recipe_ingredients ri
        JOIN ingredients i ON ri.ingredient_id = i.ingredient_id
        WHERE ri.recipe_id = ?`;

    try {
        // Fetch recipe
        db.query(recipeQuery, [recipeId], (err, recipeResults) => {
            if (err) throw err;

            if (recipeResults.length === 0) {
                return res.status(404).send('Recipe not found');
            }

            const recipe = recipeResults[0];

            // Fetch ingredients for the recipe
            db.query(ingredientsQuery, [recipeId], (err, ingredientResults) => {
                if (err) throw err;

                res.render('recipe', { 
                    title: recipe.recipe_name, 
                    recipe, 
                    ingredients: ingredientResults 
                });
            });
        });

    } catch (error) {
        console.error(error);
        res.status(500).send('Server Error');
    }
});

module.exports = router;