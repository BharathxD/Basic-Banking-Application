const router = require("express").Router();
const { Router } = require("express");
const DB = require("../config/getConnection");

router.get("/transaction/:id", function (req, res) {
  res.render("transaction", {
    sender: req.params.id,
  });
});

router.post("/transaction/add", (req, res) => {
  const { sender, reciever, amount } = req.body;
  payment_status = true;
  DB.query(
    "SELECT account_number, account_balance FROM accounts WHERE account_number = ?",
    sender,
    (rows, err) => {
      if (amount > rows[0].account_balance) {
        req.flash("error", "Insufficient Balance");
        res.render("transaction", {
          sender: sender
        });
        console.log('Insufficient Money')
      } else {
        DB.query(
          "UPDATE accounts SET account_balance = account_balance + ? WHERE account_number = ?",
          [amount, reciever],
          (rows, err) => {
            !err
              ? console.log("successfully credited amount from sender")
              : console.log(err);
          }
        );
        DB.query(
          "UPDATE accounts SET account_balance = account_balance - ? WHERE account_number = ?",
          [amount, sender],
          (rows, err) => {
            !err ? console.log("Success") : console.log(err);
          }
        );
        DB.query(
          "INSERT INTO transaction(sender_name, sender_id, reciever_name, reciever_id, transaction_amount) VALUES((SELECT account_name FROM accounts WHERE account_number = ?), ?, (SELECT account_name FROM accounts WHERE account_number = ?), ?, ?)",
          [sender, sender, reciever, reciever, amount],
          (rows, err) => {
            !err ? res.redirect("/accounts") : console.log(err);
          }
        );
      }
    }
  );
});

router.get("/logs", (req, res) => {
  DB.query("SELECT * FROM transaction", null, (rows, err) => {
    if (!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });
});

module.exports = router;
