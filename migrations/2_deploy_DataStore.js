const Migrations = artifacts.require("DataStore");

module.exports = function(deployer) {
    deployer.deploy(Migrations);
};
