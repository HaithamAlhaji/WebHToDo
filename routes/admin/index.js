const express = require("express"),
  router = express.Router();

router.all("*", (req, res, next) => {
  res.app.locals.layout = "admin/index";
  next();
});
router.get("/", (req, res) => {
  const sqlGetTasks =
    "SELECT tbl_users.email,tbl_users.first_name,tbl_users.last_name,tbl_todo_list.content,DATE_FORMAT(tbl_todo_list.creation,'%Y-%m-%d %H:%i') AS creation FROM tbl_users LEFT JOIN tbl_todo_list ON tbl_todo_list.user_id = tbl_users.id";
  mysqlConnection.getConnection((err, connection) => {
    connection.query(sqlGetTasks, (errors, results, fields) => {
      res.render("admin/index", {
        title: global.__("home"),
        list: results
      });
    });
  });
});

module.exports = router;
