const dotenv = require("dotenv");
dotenv.config();

module.exports = {
  express: {
    port: process.env.PORT || process.env.express_server_port,
    secret: process.env.express_server_session_secret
  },
  mysql: {
    host: process.env.mysql_host,
    user: process.env.mysql_user,
    pass: process.env.mysql_pass,
    database: process.env.mysql_database
  },
  app: {
    description: "RIHLand website",
    keywords: "RIHLand,RIH Land, rihland, rih land",
    author: "Haitham Alhaji",
    image: "website_img.png"
  }
};
