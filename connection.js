const Sequelize = require("sequelize");

const connection = new Sequelize("store", "root", "", {
  host: "localhost",
  dialect: "mysql",
});

connection
  .authenticate()
  .then(() => {
    console.log("Db Connected Successfully...");
  })
  .catch((error) => {
    console.error("Unable to connect to the database:", error);
  });

module.exports = connection;
