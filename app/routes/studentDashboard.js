const express = require('express');
const router = express.Router();
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();
const bcrypt = require('bcrypt');
const dotenv = require('dotenv');
const jwt = require('jsonwebtoken');

dotenv.config();




// eslint-disable-next-line no-undef
const SECRET = process.env.JWT_SECRET;

const studentLogin = async (req, res, next) => {
    try {
        const user = await prisma.student.findUnique({ where: { id: req.body.userID } })
        if (user && (await bcrypt.compare(req.body.password, user.password))) { 
            res.locals.user = user ,next()  
        } else {
             res.sendStatus(401) 
            }
        } 
        catch (error) {
        res.json(error)
        }
}





router.get('/login', studentLogin, async (req, res) => {
    
   

    res.json([res.locals.user, jwt.sign({ id: res.locals.user.id }, SECRET)])

})






module.exports = router;
