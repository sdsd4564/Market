const express = require('express');
const router = express.Router();
const db = require('../mysql');
const fs = require('fs');

router.get('/writeProduct', function (req, res) {
    res.render('writeProduct', {
        title: '상품등록',
        user: req.session
    });
});

router.post('/writeProduct', function (req, res) {
    res.send(req.body);
});

module.exports = router;