# DegenToken Contract
This is a Solidity smart contract for the DegenToken (DGN). DegenToken is an ERC20 token with additional functionalities such as burning tokens, minting tokens, redeeming items, and getting token balances.

## Features
* ERC20 Standard: Implements the ERC20 standard functions for transferring tokens, approving spending, and checking balances.
* ERC20Burnable: Extends the ERC20 contract to include functions for burning tokens.
* Ownable: Inherits from Ownable contract, allowing for access control to certain functions.
* Item Redemption: Users can redeem items by spending tokens, with each item having a unique ID, name, quantity, and price.
* Minting: Allows the contract owner to mint new tokens.
* Burning: Allows token holders to burn their own tokens.

## Getting Started
To deploy and interact with this contract, you'll need a Solidity development environment set up, including tools like Truffle, Ganache, or Remix.

## Installation
To install the required dependencies:

npm install @openzeppelin/contracts

## Deployment
Deploy the contract to your desired Ethereum network, such as Ethereum mainnet or a testnet.

## Usage
* Use the mint function to mint new tokens.
* Use the transfer function to transfer tokens between addresses.
* Use the burn and burnFrom functions to burn tokens.
* Use the redeem function to redeem items by spending tokens.

## Contract Details
Contract Name: DegenToken
Symbol: DGN


## License
This project is licensed under the MIT License 
