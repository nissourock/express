const express = require('express');
const cors = require('cors')
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan')
const indexRouter = require('./routes/index');
const usersRouter = require('./routes/users')
const adminDashboardRouter = require('./routes/adminDashboard')
const studentDashboardRouter = require('./routes/studentDashboard')
const imagesRouter = require('./routes/images')
const app = express();

app.use(cors())
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
// eslint-disable-next-line no-undef
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/admin', adminDashboardRouter);
app.use('/student', studentDashboardRouter);
app.use('/images', imagesRouter);

// function relativePath(directory) {
//     return (path.join(__dirname, directory))
// }
// console.log(relativePath("anis"))


module.exports = app;
