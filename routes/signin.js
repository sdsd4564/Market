const express = require('express');
const router = express.Router();
const db = require('../mysql');
const sha = require('sha256');
const session = require('express-session');

router.get('/signin', function (req, res) {
    req.session.userId
        ? res.send(
            '<script>' +
            'alert("이미 로그인이 되어있습니다. 로그아웃 후 시도하십시오.");' +
            'location.href=("/");</script>'
        )
        : res.render('signin', {
            title: 'Syslet',
            user: req.session
        });
});

router.post('/signin', function (req, res) {
    const body = req.body;

    db.query('SELECT id, pwd, salt, nickname FROM user', function (error, rows) {
        if (error) console.error(error);


        for (let i in rows) {
            if (body.id === rows[i].id && sha(body.pwd + rows[i].salt) === rows[i].pwd) {
                req.uid = rows[i].uid;
                req.session.userId = rows[i].id;
                req.session.nickname = rows[i].nickname;
                res.redirect('/');
                return;
            }
        }
        res.redirect('/signin');
    });
});

router.get('/signout', function (req, res) {
    req.session.destroy(function (error) {
        if (error) console.error(error);

        res.redirect('/');
    });
});


module.exports = router;
