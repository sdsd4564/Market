const express = require('express');
const router = express.Router();
const db = require('../mysql');



router.get('/:category/:pid', function (req, res) {
    const pInfo = 'SELECT * FROM product WHERE pid=' + req.params.pid;
    db.query(pInfo, function (error, data) {
        if (error) console.error(error);

        res.render('product', {
            title: 'market',
            user: req.session,
            product: data
        });
    })
});

module.exports = router;