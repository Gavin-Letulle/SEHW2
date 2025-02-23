const express = require('express');
const router = express.Router();
const db = require("../database/connection");

router.get('/', (req, res) => {
    db.query('SELECT * FROM ingredients', (err, ingredients) => {
      if (err) throw err;
      res.render('addRecipe', { title: 'Add New Recipe', ingredients });
    });
  });
  
  router.post('/addRecipe', (req, res) => {
    const { name, protein_type, ingredient_id, instructions } = req.body;
    const query = `
      INSERT INTO recipes (name, protein_type, ingredient_id, instructions)
      VALUES (?, ?, ?, ?)
    `;
    db.query(query, [name, protein_type, ingredient_id, instructions], (err, result) => {
      if (err) throw err;
      res.redirect('/recipes');
    });
  });
  
module.exports = router;