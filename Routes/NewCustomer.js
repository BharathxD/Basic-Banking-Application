const router = require("express").Router();
const DB = require("../config/getConnection");

router.get("/accounts/add", (req, res) => {
  res.render("NewAccount");
});

router.post("/accounts/add", (req, res) => {
  const { AccountName, AccountNumber, AccountBalance } = req.body;
  console.log(AccountName, AccountNumber, AccountBalance)
  DB.query(
    `INSERT INTO accounts (account_name, account_number, account_balance) VALUES(?, ?, ?)`,
    [AccountName, AccountNumber, AccountBalance],
    (rows, err) => {
      !err
        ? res.redirect('/accounts')
        : console.log("err");
    }
  );
});

module.exports = router;
