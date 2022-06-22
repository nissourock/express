const express = require('express');
const router = express.Router();
const { PrismaClient } = require('@prisma/client');
// eslint-disable-next-line no-unused-vars
const { join } = require('@prisma/client/runtime');
const prisma = new PrismaClient();
/* GET home page. */

const auth = async (req, res, next) => {
   const user = await prisma.admin.findMany({where: {id: req.body.adminId}})
   if(user.length===0 || !req.body.adminId){ return res.sendStatus(403)}
   
   next()
   
    

}

// const verifyRole = (role) => {
//     return (req, res, next) =>  
  
// }


router.get('/', async function(req, res) {
    const admin = await prisma.admin.findMany()
  res.json(admin)
});

router.get('/students/all', auth, async function (req, res) {
    try {
        const students = await prisma.student.findMany({orderBy: [{updatedAt : 'desc'}]},{ include: { 
            attendance_student: true,
            student_course:true 
        } })
        
        res.json(students)
        
    } catch (error) {
        res.json(error)
    }
    
});
router.get('/students/:studentid',auth,  async function(req, res) {
    const {studentid} = req.params

    try {
        // const student_course = await prisma.student.findUnique({where: {id: parseInt(studentid)}}).course()
        const student = await prisma.student.findUnique({where: {id: parseInt(studentid)}})
        const student_level = await prisma.student.findUnique({where: {id: parseInt(studentid)}}).level()
        
        if(!student) return res.sendStatus(404)
        console.table(student)
      return res.json([{student_details: student},
         {level: student_level},{role: student.role}]);
        
    } catch (error) {
        console.log(error)
        res.json(error)
    }

});

router.post('/students/update/:studentid',auth,  async function(req, res) {
    const {studentid} = req.params
    const {newname, newsurname} = req.body
    prisma.student.update({where: {id: parseInt(studentid)}, data: {first_name: newname, last_name: newsurname}})
    .then(response => res.json(response))
    .catch(err => res.json(err))
});


router.get('/profs/all',auth,  async function(req, res) {
    const profs = await prisma.prof.findMany()
  return res.send(profs);
  
});
router.get('/profs/:profid',auth,  async function(req, res) {
    const {profid} = req.params
    try {
        const prof_course = await prisma.prof.findUnique({where: {id: parseInt(profid)}}).course()
        const prof = await prisma.prof.findUnique({where: {id: parseInt(profid)}})
        const prof_level = await prisma.prof.findUnique({where: {id: parseInt(profid)}}).level()
        if(!prof) return res.sendStatus(404)
      return res.json([{prof_details: prof},{prof_course: prof_course}, {level: prof_level},{role: prof.role}]);
    } catch (error) {
        console.log(error)
        res.json(error)
    }
}) 

router.get('/level/all',auth,  async function(req, res) {
        const profs = await prisma.level.findMany()
      return res.send(profs);  
});



module.exports = router;

