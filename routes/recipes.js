var express = require('express');
var router = express.Router();
const db = require("../database/connection");

// Home route
router.get("/", (req, res) => {
    console.log("Home route");
    let sql = `SELECT * FROM recipes;`; // Assuming your table is named 'recipes'
    db.query(sql, (err, result) => {
        if (err) throw err;
        console.log(result);
        res.render('index', { title: 'Me & Food', currentPage: 'home', recipes: result }); // Pass 'recipes' to the view
    });
});

// Enter Recipe route
router.get("/enter-recipe", (req, res) => {
    res.render('enterrecipe', { title: 'Enter A Recipe', currentPage: 'enterrecipe' });
});

// Recipes route
router.get("/recipes", (req, res) => {
    let sql = `SELECT * FROM recipes;`; // Fetch recipes from the database
    db.query(sql, (err, result) => {
        if (err) throw err;
        res.render('recipes', { title: 'Recipe List', currentPage: 'recipes', recipes: result }); // Pass 'recipes' to the view
    });
});

// Add Recipe route (POST)
router.post("/add-recipe", (req, res) => {
    console.log(req.body);

    let sql = `INSERT INTO recipes (name, ingredients, instructions) VALUES (?, ?, ?)`; // Adjust columns as per your table
    db.query(sql, [req.body.name, req.body.ingredients, req.body.instructions], (err, result) => {
        if (err) throw err;
        res.redirect('/recipes'); // Redirect to the recipes page after adding
    });
});

module.exports = router;