const router = require('express').Router()
const DB = require("../config/getConnection");

router.get('/accounts/remove/:id', (req, res) => {
    DB.query('DELETE FROM accounts WHERE account_number = ?', [req.params.id], (rows, err) => {
        if (err) {
            console.log(err)
        } else {
            res.redirect('/accounts')
        }
    });
})

router.get('/accounts/remove-all', (req, res) => {
    console.log('err')
    DB.query('TRUNCATE accounts', null, (rows, err) => {
        if (err) console.log(err);
        res.redirect('/accounts')
    });
});

module.exports = router;