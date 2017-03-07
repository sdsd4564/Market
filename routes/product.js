const express = require('express');
const router = express.Router();
const db = require('../mysql');

router.get('/trading/:userId', function (req, res) {
    const tInfo = 'SELECT ' +
        'nickname, id, title, price, pid, nickname, state, tradedate FROM user_tradelog ' +
        'LEFT OUTER JOIN user on user_tradelog.sellerid = user.uid ' +
        'LEFT OUTER JOIN product on user_tradelog.product = product.pid ' +
        'WHERE user=' + req.session.uid;
    db.query(tInfo, function (err, data) {
        if (err) console.error(err);
        else {
            res.render('inTrading', {
                title: 'market',
                user: req.session,
                product: data
            });
        }
    })
});

router.post('/trading/:userId/:pid/cancel', function (req, res) {
   const tDelete = 'DELETE FROM user_tradelog WHERE product=?';
   db.query(tDelete, req.params.pid, function (err) {
       if (err) console.error(err);
       db.query('UPDATE product SET state=0 WHERE pid=?', req.params.pid,
       function (err0r) {
           if (err0r) console.log(err0r);
           res.redirect('/trading/:userId');
       });
   });
});

router.get('/:category/:pid', function (req, res) {
    const pInfo = 'SELECT ' +
        'pid, seller, id, regdate, title, nickname, price, description, image, product.region, category, state ' +
        'FROM product ' +
        'LEFT OUTER JOIN user ON product.seller = user.uid ' +
        'WHERE pid=' + req.params.pid;
    db.query(pInfo, function (error, data) {
        if (error) console.error(error);

        res.cookie('seller', data[0].seller);
        res.render('product', {
            title: 'market',
            user: req.session,
            params: req.params,
            product: data
        });
    });
});

router.get('/:category/:pid/trading', function (req, res) {
    // product 의 상태값을 1로 바꿈 -> 거래중 (default = 0)
    const pState = 'UPDATE product SET state = 1 WHERE pid = ' + req.params.pid;
    const pTransaction = 'INSERT INTO user_tradelog (user, product, sellerid) VALUES (?, ?, ?)';

    if (!req.session.uid) {
        res.send(
            '<script>' +
            'alert("로그인이 필요합니다. 로그인 페이지로 이동합니다");' +
            'location.href = "/signin";' +
            '</script>');
    } else if (req.session.uid == req.cookies.seller) {
        res.send(
            '<script>' +
            'alert("직접 등록한 상품입니다. *_*");' +
            'location.href = "/";' +
            '</script>');
    } else {
        db.query(pState, function (errState) {
            if (errState) console.error(errState);

            db.query(pTransaction,
                [req.session.uid, req.params.pid, req.cookies.seller],
                function (errTrans) {
                    if (errTrans) console.error(errTrans);

                    res.redirect('/')
                });
        })
    }
});

module.exports = router;