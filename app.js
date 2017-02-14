const express = require('express');
const helmet = require('helmet');
const path = require('path');
const favicon = require('serve-favicon');
const logger = require('morgan');
const cookieParser = require('cookie-parser');
const bodyParser = require('body-parser');
const session = require('express-session');
const MySQLStore = require('express-mysql-session')(session);

const index = require('./routes/index');
const users = require('./routes/users');
const signUp = require('./routes/signup');
const signIn = require('./routes/signin');
const product = require('./routes/product');

let app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(helmet());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use(cookieParser('1mhphos!'));
app.use(express.static(path.join(__dirname, 'public'))); // <- 정적 파일 사용
app.use(session({
    secret: 'vacation project in Syslet lab',
    resave: 'false',
    cookie: {maxAge: 1000 * 60 * 60},
    saveUninitialized: true,
    store: new MySQLStore({
        host: 'localhost',
        port: 3306,
        user: 'root',
        password: 'gkswogus15',
        database: 'market'
    })
}));

app.use('/', index);
app.use('/users', users);
app.use(signUp);
app.use(signIn);
app.use(product);

// catch 404 and forward to error handler
app.use(function (req, res, next) {
    let err = new Error('Not Found');
    err.status = 404;
    next(err);
});

// error handler
app.use(function (err, req, res, next) {
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};

    // render the error page
    res.status(err.status || 500);
    res.render('error');
});

module.exports = app;
