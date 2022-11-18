const router = require("express").Router();
const DB = require("../config/getConnection");

router.get("/accounts", (req, res) => {
  DB.query(`SELECT * FROM accounts`, null, (rows, err) => {
    !err
      ? res.render("accounts", {
          rows: rows,
        })
      : console.log("err");
  });
});

module.exports = router;
