const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();
const bcrypt = require('bcrypt')
const studentLogin = async (req, res, next) => {
    // console.log(req.body)
    try {
        const user = await prisma.student.findUnique({ where: { id: parseInt(req.body.userID )} })
        if (user && req.body.password && (await bcrypt.compare(req.body.password, user.password))) { 
            res.locals.user = user ;    next()  
        } else {
             res.sendStatus(401) 
            }
        } 
        catch (error) {
            throw Error("No login info provided") 
        
        
        }
}
const adminLogin = async (req, res, next) => {
    try {
        const user = await prisma.student.findUnique({ where: { id: req.body.userID } })
        if (user && req.body.password && (await bcrypt.compare(req.body.password, user.password))) { 
            res.locals.user = user ;    next()  
        } else {
             res.sendStatus(401) 
            }
        } 
        catch (error) {
        res.json(error)
        }
}

module.exports = {studentLogin, adminLogin}