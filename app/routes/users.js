const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

const express = require('express')
const router = express.Router();


// async function main() {
//   const allUsers = await prisma.student.findMany({
//     include: { posts: true },
//   })
//   // use `console.dir` to print nested objects
//   console.dir(allUsers, { depth: null })
// }



const myarray = require('../data/data')
const displayfruit = {};
const other = myarray.map((fruit) => {
  if (fruit === 'banana' || fruit === 'pain') {
    return { ...displayfruit, [fruit]: "delicious" }
  }
  else
    return { ...displayfruit, [fruit]: "This is not a fruit" };
});
console.log(other);
/* GET users listing. */
router.get("/all", async function (req, res, next) {
  const data = await prisma.student.findMany()
  res.json(data);

  next()
});
router.get("/all_paginated", async function (req, res, next) {
  const currentPage = parseInt(req.query.page) || 1;
  const listPerPage = 4;
  const offset = (currentPage - 1) * listPerPage;
  const userscount = await prisma.student.count();
  if ((userscount % listPerPage) === 0) { const totalPages = (userscount / listPerPage) }
  const totalPages = Math.floor((userscount / listPerPage)) + 1
  console.log(totalPages)
  const allUsers = await prisma.student.findMany({
    skip: offset,
    take: listPerPage,
  })
  res.json([{
    data: allUsers,
    meta: {
      page: currentPage,
      all: userscount,
      numOfPages: totalPages
    }
  }]);;

  next()
});

router.get("/view/:userid", async function (req, res, next) {
  const userid = parseInt(req.params.userid)
  const data = await prisma.student.findMany({
    where: {
      id: userid
    }
  })
  res.json(data)


});
router.get("/*", function (req, res, next) {
  res.send(404)
});

router.post("/", async function (req, res, next) {
  const { firstName, lastName, passWord, levelId, isHot } = req.body
  const newUser = await prisma.student.create({
    data:
    {
      first_name: firstName,
      last_name: lastName,
      password: passWord,
      level_id: levelId,
      ishot: isHot
    }
  })
  res.json([firstName, lastName, levelId, isHot])

  next()
});

module.exports = router;
