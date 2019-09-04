`use strict`;

const pkProvider = require(`truffle-privatekey-provider`);
const fs = require(`fs`);

// Make sure those files containing ropsten private key and infura key actually exists.
const privateKey = fs.readFileSync(`secret/private.key`).toString().trim();
const infuraKey = fs.readFileSync(`secret/infura.key`);

module.exports = {
  networks: {

    development: {
     host: `127.0.0.1`,
     port: 7545,
     network_id: `*`,
    },

    rinkeby: {
      provider: () => new pkProvider(privateKey, `https://rinkeby.infura.io/v3/${infuraKey}`),
      network_id: 4,
      gas: 5500000,
      confirmations: 2,
      timeoutBlocks: 200,
      skipDryRun: true
    },
  },
};
