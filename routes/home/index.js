const express = require("express"),
  router = express.Router();

router.all("*", (req, res, next) => {
  res.app.locals.layout = "home/index";
  next();
});
router.get("/", (req, res) => {
  res.render("home/index", {
    title: global.__("home")
  });
});
module.exports = router;
