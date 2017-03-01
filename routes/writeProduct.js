const express = require('express');
const router = express.Router();
const db = require('../mysql');
const fs = require('fs');
const multipart = require('connect-multiparty');
const multipartMiddleware = multipart();
const mkdirp = require('mkdirp');

let newUrl = null;
let newProduct = null;

router.get('/writeProduct', function (req, res) {
    if (req.session.userId) {
        res.render('writeProduct', {
            title: '상품등록',
            user: req.session
        });
    } else {
        res.send('' +
            '<script>' +
            'alert("로그인이 되지 않았습니다. 먼저 로그인부터 해주세요");' +
            'location.href="/signin";' +
            '</script>');
    }
});

router.post('/writeProduct', function (req, res) {
    const body = req.body;
    const query = 'INSERT INTO product (seller, regdate, title, price, description, image, region, category) VALUES (?, ?, ?, ?, ?, ?, ?, ?)';
    let category = '';

    db.query('SELECT name FROM category WHERE cid=' + body.category,
        function (err, data) {
            if (err) console.error(err);

            category = data[0].name;

            db.query(query, [req.session.uid, new Date(), body.title, body.price, body.description, 'http://localhost:5874' + newUrl, body.region, body.category],
                function (err, rows) {
                    if (err) console.error(err);
                    else {
                        const pLocation = '/' + category + '/' + newProduct;
                        console.log(pLocation);
                        res.send('' +
                        '<script>' +
                            '   alert("물품 등록을 완료했습니다");' +
                            '   history.pushState(null, null, location.href);' +
                            '   window.onpopstate = function (event) {' +
                            '       history.go(1);' +
                            '   };' +
                            '   location.href = "/";' +
                            '</script>'
                        );
                    }
                })
        });

});

// 이미지 업로드 미드뤠어
router.post('/uploader', multipartMiddleware, function (req, res) {
    const fs = require('fs');

    fs.readFile(req.files.upload.path, function (err, data) {
        db.query('SELECT pid FROM product ORDER BY pid DESC LIMIT 1', function (dbErr, rows) { // db 쿼리
            if (dbErr) console.error(dbErr);
            else {
                newProduct = ++rows[0].pid; // db에 존재하는 가장 마지막 pid

                db.query('ALTER TABLE product AUTO_INCREMENT=' + newProduct, function (pidErr) {
                    if (pidErr) console.error(pidErr);
                    else {
                        mkdirp('./public/uploads/' + req.session.userId, function (fsUsermkdirErr) { // 유저아이디로 된 폴더 생성
                            if (fsUsermkdirErr) console.error(fsUsermkdirErr);
                            else {
                                mkdirp('./public/uploads/' + req.session.userId + '/' + newProduct, function (fsProductmkdirErr) { // pid로 된 폴더 생성(public/유저아이디/pid)
                                    if (fsProductmkdirErr) console.error(fsProductmkdirErr);
                                    else {
                                        newUrl = "/uploads/" + req.session.userId + '/' + newProduct + '/' + req.files.upload.name;
                                        const newPath = __dirname + '/../public' + newUrl;

                                        fs.writeFile(newPath, data, function (fsWriteErr) {
                                            if (fsWriteErr) console.log({err: fsWriteErr});
                                            else {
                                                html = "";
                                                html += "<script type='text/javascript'>";
                                                html += "    var funcNum = " + req.query.CKEditorFuncNum + ";";
                                                html += "    var url     = \"" + newUrl + "\";";
                                                html += "    var message = \"이미지를 성공적으로 업로드했습니다\";";
                                                html += "";
                                                html += "    window.parent.CKEDITOR.tools.callFunction(funcNum, url, message);";
                                                html += "</script>";

                                                res.send(html);
                                            }
                                        });
                                    }
                                })
                            }
                        });
                    }
                });


            }
        });
    });
});

module.exports = router;