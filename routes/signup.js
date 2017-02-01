const express = require('express');
const router = express.Router();
const db = require('../MySQLm');
const uuid = require('uuid');
const sha = require('sha256');


/* 회원가입 */
router.get('/signup', function (req, res, next) {
    res.render('signup', {title: 'Wolf'});
});

router.post('/signup', function (req, res) {
    let body = req.body;
    const salt = uuid();

    db.query('INSERT INTO user (id, pwd, salt, nickname, email, region, phone, created) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
        [body.id, sha(body.pwd + salt), salt, body.nickname, body.email, body.region, body.phone, new Date()],
        function (error, rows) {
            if (error) console.log(error);

            res.redirect('/');
        });
});

router.post('/signup/check_id', function (req, res) {
    let id = req.body.id;
    let isOverlapped = true;

    db.query('SELECT id FROM user', function (error, data) {
        if (error) console.error(error);

        for (let i in data) {
            if (id === data[i].id) {
                isOverlapped = false;
                break;
            }
        }
        res.send(isOverlapped);
    });
});

router.post('/signup/check_nickname', function (req, res) {
    let nickname = req.body.nickname;
    let isOverlapped = true;

    db.query('SELECT nickname FROM user', function (error, data) {
        if (error) console.error(error);

        for (let i in data) {
            if (nickname === data[i].nickname) {
                isOverlapped = false;
                break;
            }
        }
        res.send(isOverlapped);
    });
});


module.exports = router;
