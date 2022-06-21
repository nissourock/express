const express = require('express');
const router = express.Router();
const { PrismaClient } = require('@prisma/client');
const { join } = require('@prisma/client/runtime');
const prisma = new PrismaClient();
const bcrypt = require('bcrypt');



const studentLogin = async (req, res, next) => {
    try {
        const user = await prisma.student.findUnique({ where: { id: req.body.userID } })
        if (user && (await bcrypt.compare(req.body.password, user.password))) { next() } else { res.sendStatus(401) }
    } catch (error) {
        res.json(error)
    }

    



}
    
 

 

router.get('/login',studentLogin, async (req, res) => {
    
    const user = await prisma.student.findUnique({where: {id: req.body.userID}})

res.json(user)

})






module.exports = router;
