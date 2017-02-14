const express = require('express');
const router = express.Router();
const db = require('../mysql');

/* GET home page. */
router.get('/', function (req, res, next) {

    const query1 = 'SELECT pid, id, nickname, regdate, title, price, ' +
        'description, image, product.region, category.name ' +
        'FROM product ' +
        'LEFT OUTER JOIN user ' +
        'ON product.seller = user.uid ' +
        'LEFT OUTER JOIN category ' +
        'ON category.cid = product.category';

    db.query(query1, function (error, data) {
        if (error) console.error(error);

        res.render('index', {
            title: 'Syslet',
            user: req.session,
            products: data
        });
    });
});


module.exports = router;
