const RentalManagement = artifacts.require("RentalManagement");

module.exports = function (deployer) {
    deployer.deploy(RentalManagement);
};
