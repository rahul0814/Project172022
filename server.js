const express = require("express");
// const bodyParser = require("body-parser"); /* deprecated */
const cors = require("cors");
const multer  = require('multer')
// const upload = multer({ dest: 'videos/' })
const app = express();

var corsOptions = {
  origin: "http://localhost:8081",
};

// app.use(cors(corsOptions));
app.use(
  cors({
    origin: "*",
  })
);

// parse requests of content-type - application/json
app.use(express.json()); /* bodyParser.json() is deprecated */

// parse requests of content-type - application/x-www-form-urlencoded
app.use(
  express.urlencoded({ extended: true })
); /* bodyParser.urlencoded() is deprecated */

const mysql = require("mysql");
const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "ads",
});

connection.connect((err) => {
  if (err) throw err;
  console.log("Connected to MySQL Server!");
});

app.get("/", (req, res) => {
  connection.query("SELECT * from ads", (err, rows) => {
    res.send(rows);
    // connection.end();
  });
});

app.post('/login', (req, res) => {
  // Insert Login Code Here
  let username = req.body.username;
  let password = req.body.password;
  // res.send(`Username: ${username} Password: ${password}`);
  connection.query("SELECT * from clients where username = '" +username+ "' and password ='" + password + "'", (err, rows) => {
   if(err) res.send(err);
   else
   res.send(rows);
    // connection.end();
  });
});

app.post('/signup', (req, res) => {

  // res.send(`Username: ${username} Password: ${password}`);
  connection.query("INSERT INTO `clients`( `name`, `email`, `username`, `password`,dob) VALUES ('"+req.body.name+"','"+req.body.email+"','"+req.body.username+"','"+req.body.password+"','"+req.body.dob+"')", (err, rows) => {
   if(err) res.send(err);
   else
   res.send(rows);
    // connection.end();
  });
});

app.post("/clients", (req, res) => {
  connection.query("SELECT * from clients", (err, rows) => {
    res.send(rows);
    // connection.end();
  });
});

app.get("/products", (req, res) => {
  connection.query("SELECT * from product", (err, rows) => {
    res.send(rows);
    // connection.end();
  });
});


app.get("/client/video/:id", (req, res) => {
  // res.send('user' + req.params.id);/
  connection.query(
    "SELECT *,clients.name as clientname,product.name as prodname FROM `client_based_videos` inner join ads on ads.id = video_id inner join product on product.id = product_id inner join clients on clients.id = client_id WHERE client_id = " +
      req.params.id,
    (err, rows) => {
      res.send(rows);
    }
  );
});

app.get("/client-based-video", (req, res) => {
  // res.send('user' + req.params.id);/
  connection.query(
    "SELECT *,clients.name as clientname,product.name as prodname FROM `client_based_videos`  inner join product on product.id = product_id inner join clients on clients.id = client_id" +
      "",
    (err, rows) => {
      res.send(rows);
    }
  );
});

 //Configuration for Multer
const multerStorage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "videos");
  },
  filename: (req, file, cb) => {
    const ext = file.mimetype.split("/")[1];
    cb(null, `${Date.now()}.${ext}`);
  connection.query(`insert into ads(image) values('${Date.now()}.${ext}')`)
    
  },
});



const multerFilter = (req, file, cb) => {
  if (file.mimetype.split("/")[1] !== "pdf") {
    cb(null, true);
  } else {
    cb(new Error("Not a PDF File!!"), false);
  }
};

const upload = multer({storage: multerStorage}).single('myFile');
// const upload = multer({
//   storage: multerStorage,
//   fileFilter: multerFilter,
// });

app.post("/upload", upload, async (req, res) => {
  try {
    const newFile = await File.create({
      name: req.file.filename,
    });
    res.status(200).json({
      status: "success",
      message: "File created successfully!!",
    });
  } catch (error) {
    res.json({
      error,
      filemname : req.file.filename
    });
  }
});

app.post("/addCamp", function (req, res) {
  let user = req.body.user;
  if (!req.body) {
    return res
      .status(400)
      .send({ error: true, message: "Please provide user" });
  }

 

  connection.query(
    "INSERT INTO  client_based_videos SET ? ",
    {
      client_id: req.body.client_id,
      video_id: req.body.video_id,
      product_id: req.body.product_id,
      business: req.body.business,
      Imp: req.body.Imp,
      name: req.body.name,
      url: req.body.url,
      startDate: req.body.startDate,
      endDate: req.body.endDate,
      click: req.body.click,
    },
    function (error, results, fields) {
      if (error) throw error;
      return res.send({
        error: false,
        data: results,
        message: "New ad has been created successfully.",
      });
    }
  );
});


require("./app/routes/ads.routes.js")(app);

// set port, listen for requests
const PORT = process.env.PORT || 8081;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});
