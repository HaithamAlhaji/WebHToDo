const constants = require("./config/constants"),
  express = require("express"),
  expressHandlebars = require("express-handlebars"),
  expressSession = require("express-session"),
  cookieParser = require("cookie-parser"),
  mysql = require("mysql"),
  bodyParser = require("body-parser"),
  i18n = require("i18n"),
  favicon = require("serve-favicon"),
  home = require("./routes/home/index"),
  path = require("path");

// Definiations
var isConfigReady = false;
const mysqlConnection = mysql.createPool({
  host: constants.mysql.host,
  user: constants.mysql.user,
  password: constants.mysql.pass,
  database: constants.mysql.database
});

global.mysqlConnection = mysqlConnection;
global.defaultConfig = {};
// checking connection
mysqlConnection.getConnection((err, connection) => {
  connection.query(`select * from tbl_config;`, (errors, reults, fields) => {
    if (errors) {
      console.error("database connection problem");
    } else {
      for (let index = 0; index < reults.length; index++) {
        global.defaultConfig[reults[index]["name"]] = reults[index]["value"];
      }
      connection.release();

      global.defaultConfig.app_description = constants.app.description;
      global.defaultConfig.app_keywords = constants.app.keywords;
      global.defaultConfig.app_author = constants.app.author;
      global.defaultConfig.app_image = constants.app.image;

      app.emit("ready");
    }
  });
});
const app = express();
app.set("view engine", "handlebars");
app.engine(
  "handlebars",
  expressHandlebars({
    defaultLayout: "home/index",
    helpers: {
      default: function(name) {
        return global.defaultConfig[name];
      },
      ifEquals: function(arg1, arg2, options) {
        return arg1 == arg2 ? options.fn(this) : options.inverse(this);
      },
      texts: function(name) {
        return __(name);
      }
    }
  })
);

// Middlewares

// Express Uses
app.use(
  expressSession({
    secret: constants.express.secret,
    resave: true,
    saveUninitialized: true
  })
);
app.use(express.static(path.join(__dirname, "public")));
app.use(favicon(path.join(__dirname, "/favicon.ico")));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cookieParser());
app.use("/", home);
// Starting Server
app.on("ready", () => {
  // Multilingual
  i18n.configure({
    locales: ["en", "ar", "tr", "ku"],
    directory: path.join(__dirname, "public", "/locales"),
    register: global,
    defaultLocale: global.defaultConfig.websiteLanguage || "en"
  });

  app.listen(constants.express.port, () => {
    console.info("Server is started");
  });
});
