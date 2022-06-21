const express = require('express')
const router = express.Router();
const fs = require('fs');
const path = require('path')
const multer = require('multer');
const sharp = require('sharp');
const bcrypt = require('bcrypt');

const images = []
images.push({anis: true})
images.push({anis: "cool"})
console.log(images)

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, relativePath('uploads'))
  },
  filename: function (req, file, cb) {
    cb(null, Date.now()+file.originalname)
  }
})
const upload = multer({ storage: storage,  fileFilter: (req, file, callback) => {
  if (file.mimetype == "image/png" || file.mimetype == "image/jpg" || file.mimetype == "image/jpeg") {
    callback(null, true);
  } else {
    callback(null, false);
    return cb(new Error('Only .png, .jpg and .jpeg format allowed!'));
  }
} })

/* The function relativePath takes the current absolute directory path, and appends to it another path, or 
in this case, a filename.
It is interesting to note that node.js handles filepaths differently than javascript.
I should try to learn more about relative and absolute filepaths. */

const relativePath = (directory) => {
    return (path.join(__dirname, directory))
}

router.get('/:content', (req , res) => {
   const {content} = req.params
    try {

        fs.writeFileSync((relativePath('anis.txt')), content);
        console.log(relativePath('anis')+'anis.txt')
        // file written successfully
      } catch (err) {
        console.error(err);
      }
    res.send(content)
})
router.post('/upload', upload.single('file'),(req, res) => {
  if(req.file){
  // const {userID} = req.query
  const pathName = req.file.path
  // sharp(pathName).rotate(90).toFile(relativePath('uploads/2'+req.file.filename))

  // images.push({anis: req.file.filename, user: userID, timeOfUpload: Date.now()})
  
  
 }
  else{res.send("no file")}
})

router.get('/', async (req, res) => {
  const firsthash = bcrypt.hashSync("anisddd", 10)

const eval = await bcrypt.compare("anisddd", firsthash).valueOf()
  console.log(eval)
  res.json({firsthash: firsthash , eval: eval.toString()})
})






module.exports = router;
