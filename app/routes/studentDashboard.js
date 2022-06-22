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





router.get('/login', studentLogin, async (req, res) => {
    
    const token = jwt.sign({ id: res.locals.user.id, role: res.locals.user.role}, SECRET,{expiresIn: '30s'})

    res.json([{user_info: res.locals.user}, {jwt_token: token, time_of_issue: new Date()}]);

})
const checkToken = function (req,res,next)
/* In this implementation, the token should be sent as a request header : x-access-token
with content: bearer ergelrkgjsdlkfjslcgkjldkjg
 */
{
    const header = req.headers['x-access-token'];
    if(typeof header !== 'undefined')
    {
       const bearer = header.split(' ');
       const token = bearer[1];
       req.token=token;
       console.log(header)
       next();
     }
     else
     {
        res.sendStatus(403);
     }
    }

router.get('/verify',checkToken, async (req, res) => 
    {
        jwt.verify(req.token,SECRET ,function (err,authorizedata)
        {
            if(err)
            {
                console.log(err);
                res.sendStatus(403);
            }
            else
            {
                res.json({
                    message : 'Successful log in',
                    authorizedata
                });
                console.log('Success : Connected to protected route');
            }
    
        });
    
    });
// router.get('/verify', async (req, res) => {
//     let token = req.headers["x-access-token"];
    
//     if (!token) {
//     return res.status(403).send({
//       message: "No token provided!"
//     });
//   }
//   jwt.verify(token, SECRET).then(decoded => console.log(decoded)).catch(err => console.error(err))
//     res.sendStatus(200)
// })

 

  






module.exports = router;
