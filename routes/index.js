const express = require('express');
const router = express.Router();
const db = require('../mysql');

/* GET home page. */
router.get('/', function (req, res, next) {

    const query1 = 'SELECT pid, id, nickname, regdate, title, price, description, image, product.region ' +
        'FROM product ' +
        'LEFT JOIN user ' +
        'ON product.seller = user.uid';

    db.query(query1, function (error, data) {
        if (error) console.error(error);

        res.render('index', {
            title: 'Syslet',
            user: req.session,
            products: data
        });
    });
});

router.get('/category/:pid', function (req, res) {
    res.send('pid : ' + req.params.pid);
});

module.exports = router;
