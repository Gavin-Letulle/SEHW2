const express = require('express');
const router = express.Router();
const db = require("../database/connection");

router.get('/', (req, res) => {
    const ingredientsQuery = 'SELECT ingredient_id, ingredient_name FROM ingredients';
  
    db.query(ingredientsQuery, (err, ingredients) => {
      if (err) throw err;
      res.render('addRecipe', { title: 'Add New Recipe', ingredients });
    });
  });
  
  router.post('/', (req, res) => {
    const { recipe_name, protein_type, instructions, cooking_time, img_url, ingredient_ids, quantities } = req.body;
  
    const insertRecipeQuery = `
      INSERT INTO recipes (recipe_name, protein_type, instructions, cooking_time, img_url) 
      VALUES (?, ?, ?, ?, ?)`;
  
    db.query(insertRecipeQuery, [recipe_name, protein_type, instructions, cooking_time, img_url || null], (err, result) => {
      if (err) throw err;
  
      const newRecipeId = result.insertId;
  
      const recipeIngredientsData = ingredient_ids.map((ingredient_id, index) => [
        newRecipeId,
        ingredient_id,
        quantities[index]
      ]);
  
      const insertRecipeIngredientsQuery = `
        INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity) VALUES ?`;
  
      db.query(insertRecipeIngredientsQuery, [recipeIngredientsData], (err) => {
        if (err) throw err;
  
        res.redirect(`/recipe/${newRecipeId}`);
      });
    });
  });
  
  module.exports = router;