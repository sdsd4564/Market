const express = require('express');
const router = express.Router();
const db = require('../mysql');

router.get('/:category/:pid', function (req, res) {
    const pInfo = 'SELECT * FROM product WHERE pid=' + req.params.pid;

    db.query(pInfo, function (error, data) {
        if (error) console.error(error);

        res.render('product', {
            title: '[' + req.params.category +']' + data[0].title,
            user: req.session,
            params: req.params,
            product: data
        });
    });
});

router.get('/:category/:pid/trading', function (req, res) {
    // 디비에 거래내역 추가할 예정
    // 그전까진 소켓ㅇ을 쓸 필요는 없을 듯 하다...
    res.send('rga');
});

module.exports = router;