const express = require('express');
const router = express.Router();
const db = require('../mysql');
const http = require('http').Server(router);
const socketio = require('socket.io')(http);


const io = socketio.listen(router);
io.socket.on('connection', function (socket) {
    window.onload = function () {
        const socket = io.connect();
    };
});

router.get('/:category/:pid', function (req, res) {
    const pInfo = 'SELECT * FROM product WHERE pid=' + req.params.pid;
    db.query(pInfo, function (error, data) {
        if (error) console.error(error);

        res.render('product', {
            title: 'market',
            user: req.session,
            product: data
        });
    });
});

module.exports = router;