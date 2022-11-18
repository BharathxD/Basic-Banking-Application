const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const flash = require('connect-flash');
const session = require("express-session");
require('dotenv').config();

app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));
app.use(flash());

app.get("/", function (req, res) {
    res.render("home");
});

app.use(
    session({
      secret: "Secret",
      resave: false,
      saveUninitialized: false,
      maxAge: 1000 * 60 * 60 * 2, // 2 hours
    })
);

app.use((req, res, next) => {
    res.locals.error = req.flash("error");
    res.locals.success = req.flash("success");
    next();
});

app.use(require('./Routes/accounts'));

app.use(require('./Routes/transaction'));

app.use(require('./Routes/NewCustomer'));

app.use(require('./Routes/DeleteCustomer'));

app.listen(3000, function(){
    console.log("Express server listening on port %d in %s mode", this.address().port, app.settings.env);
});
  