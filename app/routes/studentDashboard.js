const express = require('express');
const router = express.Router;
const dotenv = require('dotenv');
const jwt = require('jsonwebtoken');
const {studentLogin} = require('../utils/login/studentLogin')

dotenv.config();




// eslint-disable-next-line no-undef
const SECRET = process.env.JWT_SECRET;

/* Routes needed: 
Login, verify
1- GET
- get courses enrolled in (profs, level should be included too)
- get schedule (sessions to come and sessions past)
- get attendance 
- get payment situation
- get course materials
- get notifications
2- POST/UPDATE 
- sign-up with name, email, course_wish_list
- credentials, profile picture (UPDATE)
 */





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



 

  






module.exports = router;
