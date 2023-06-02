![readme](readme.png)

# FamCash – Safe crypto for families.

## Overview
The objective of this project is to use Ethereum smart contracts to onboard family units into the crypto space by allowing them to easily create their own private tokens for use only amongst themselves.


## How It Works

![Flow Chart](FlowChart.png)

We begin with the family contract. This contract is owned by a parent and allows them to mint a private  token. They provide a name, symbol, and amount. Then, they pay the gas fee to mint their tokens and receive them in their wallet. From there, they can be dispersed to others at their leisure.


Next is the Factory contract, which creates all FamCash contracts. It sets up and deploys them for each new family and is the initial Owner of all the contracts, but transfers ownership to the parent's wallet address upon creation of each contract.


## FamCash Contract Properties
- contractOwner - The wallet address of the parent creating the contract.
- tokenName - The name of the token set by the contract owner.
- tokenTicker - The ticker symbol of the token set by the contract owner.


## FamCash Contract Functions
- mint - Creates tokens (Restricted to parents)
- send - Begins sending process
- addParent - Adds a wallet address and grants it Minter & Member roles.
- addMember - Adds a wallet address and grants it Member role.


## Factory Contract Functions
- NewFamCash - Creates an empty array to store all contracts. Creates a new FamCash contract by taking in user-specified values to set as contractOwner, tokenName, and tokenTicker. Then, adds each new contract to the empty array.

---

Built with 💜 using [RemixIDE](https://remix.ethereum.org/#lang=en&optimize=false&runs=200&evmVersion=null&version=soljson-v0.8.18+commit.87f61d96.js)

---
