require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-ethers");
require("dotenv").config();
const { SEPOLIA_PRIVATE_KEY, INFURA_API_KEY } = process.env;
console.log(SEPOLIA_PRIVATE_KEY,INFURA_API_KEY)
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.27",
  networks: {
    sepolia: {
      url: `https://sepolia.infura.io/v3/${INFURA_API_KEY}`, // 使用Infura提供的Sepolia URL
      accounts: [`0x${SEPOLIA_PRIVATE_KEY}`]
    }
  }
};
