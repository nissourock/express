const express = require('express');
const router = express.Router();
const dotenv = require('dotenv');
const jwt = require('jsonwebtoken');
const { studentLogin } = require('../utils/login/studentLogin');
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

dotenv.config();




// eslint-disable-next-line no-undef
const SECRET = process.env.JWT_SECRET;







router.post('/login', studentLogin, async (req, res) => {

    const token = jwt.sign({ id: res.locals.user.id, role: res.locals.user.role }, SECRET, { expiresIn: '15min' })

    res.json([{ user_info: res.locals.user }, { jwt_token: token, time_of_issue: new Date() }]);

})
const checkToken = function (req, res, next)
/* In this implementation, the token should be sent as a request header : x-access-token
with content: bearer ergelrkgjsdlkfjslcgkjldkjg

 */ {
    console.log(req.headers)
    const header = req.headers['x-access-token'];
    if (typeof header !== 'undefined') {
        const bearer = header.split(' ');
        const token = bearer[1];
        req.token = token;
        
        next();
    }
    else {
        
        throw Error('no token provided')
        ;
    }
}

const verify_token = async function (req, res, next) {
    jwt.verify(req.token, SECRET, function (err, authorizedata) {
        if (err) {
            console.error(err);
            
            res.sendStatus(403);
        }
        else {
            res.locals.token_data = authorizedata
            
            console.log('Success : Connected to protected route');
            next()
        }

    })
}

router.post('/info',checkToken,verify_token, async (req, res) => {
    
    try {
        const students = await prisma.student.findUnique({
            where: {
                id: res.locals.token_data.id
            },
            include: {
                attendance_student: true,
                student_course: true
            }
        })
        
        res.json(students)

    } catch (error) {
        console.error(error)
    }
    // res.json(res.locals.user.id)
})














module.exports = router;
