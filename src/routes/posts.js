const express = require('express');
const router = express.Router();

const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');

router.get('/add', (req, res) => {
    //entonces aca vamos a renderizar esta vista que va ser un hbs handlerBars
    // indicamos que va estar en la carpera posts/ y se llama add
    res.render('posts/add');
});

//Bueno aca indicamos como manejar el post desde el formulario
// con console.log(req.body) puedo ver por consola lo que estoy recibiendo
router.post('/add', async (req, res) => {
    const { 
        url_android, url_ios, 
        tittle_w1,desciption_w1,
        tittle_w2,desciption_w2,
        tittle_w3,desciption_w3,
        tittle_w4,desciption_w4,
        tittle_w5,desciption_w5
     } = req.body;
    const newPost = {
        url_android, url_ios, 
        tittle_w1,desciption_w1,
        tittle_w2,desciption_w2,
        tittle_w3,desciption_w3,
        tittle_w4,desciption_w4,
        tittle_w5,desciption_w5,
        user_id: req.user.id
    };
    await pool.query('INSERT INTO posts set ?', [newPost]);
    req.flash('success', 'Link Saved Successfully');
    res.redirect('/posts');
});

router.get('/addGames', (req, res) => {
    res.render('posts/addGames');
});

router.get('/addGames/:id', async (req, res) => {
    const games = await pool.query('SELECT * FROM games');
    res.render('posts/addGames', { games });
});

router.post('/addGames/:id', async (req, res) => {
    console.log(req.param)
    const { id } = req.params;
    const { game } = req.body; 
    const newLink = {
        game
    };
    await pool.query('UP links set ? WHERE id = ?', [newLink, id]);
    req.flash('success', 'Link Updated Successfully');
    res.redirect('/links');
});

router.get('/post', isLoggedIn, async (req, res) => {
    const posts = await pool.query('SELECT * FROM posts WHERE user_id = ?', [req.user.id]);
    res.render('posts/post', { posts });
});

router.get('/delete/:id', async (req, res) => {
    const { id } = req.params;
    await pool.query('DELETE FROM posts WHERE ID = ?', [id]);
    req.flash('success', 'Link Removed Successfully');
    res.redirect('/posts');
});

router.get('/edit/:id', async (req, res) => {
    const { id } = req.params;
    const posts = await pool.query('SELECT * FROM posts WHERE id = ?', [id]);
    console.log(posts);
    res.render('posts/edit', {link: posts[0]});
});


// VER
router.post('/edit/:id', async (req, res) => {
    const { id } = req.params;
    const { title, description, url} = req.body; 
    const newLink = {
        title,
        description,
        url
    };
    await pool.query('UPDATE links set ? WHERE id = ?', [newLink, id]);
    req.flash('success', 'Link Updated Successfully');
    res.redirect('/links');
});

module.exports = router;