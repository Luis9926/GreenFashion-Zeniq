var process_info = artifacts.require('process_info');

module.exports = function(deployer) {
    deployer.deploy(process_info);
};