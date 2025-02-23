var express = require('express');
var router = express.Router();
const db = require("../database/connection");

router.get('/', (req, res) => {
    const query = 'SELECT * FROM recipes ORDER BY protein_type';
    db.query(query, (err, recipes) => {
      if (err) throw err;
      res.render('recipes', { title: 'Recipes', recipes });
    });
  });
  
module.exports = router;