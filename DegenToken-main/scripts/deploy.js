// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  const initialOwner = "0xbf4EE65FE67C291DfC34ffe2455ecA9d97DF9148";

  const DegenToken = await hre.ethers.deployContract("DegenToken", [
    initialOwner,
  ]);

  await DegenToken.waitForDeployment();

  console.log(`Successfully deployed to ${DegenToken.target}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});