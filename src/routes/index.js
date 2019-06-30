const express = require('express');
const router = express.Router();

const pool = require('../database');

router.get('/', async (req, res) => {
    const posts = await pool.query('SELECT * FROM posts');
    res.render('index', { posts });
});


module.exports = router;