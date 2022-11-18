const pool = require('./sqlConnection');

var DB = (function () {

    function _query(query, params, callback) {
        pool.getConnection((err, connection) => {
          connection.release();
          
            if (err) {
                callback(null, err);
                throw err;
            }

            connection.query(query, params, function (err, rows) {
                if (!err) {
                    callback(rows);
                }
                else {
                    callback(null, err);
                }

            });

            connection.on('error', function (err) {
                callback(null, err);
                throw err;
            });
        });
    };

    return {
        query: _query
    };
})();

module.exports = DB;