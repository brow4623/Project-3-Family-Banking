# FamCash Concept
We begin with the family contract. This contract is owned by a parent and allows them to mint a private  token. They provide a name, symbol, and amount. Then, they pay the gas fee to mint their tokens and receive them in their wallet. From there, they can be dispersed to others at their leisure.


Next is the Factory contract, which creates all FamCash contracts. It sets up and deploys them for each new family and is the initial Owner of all the contracts, but transfers ownership to the parent's wallet address upon creation of each contract.


## Private Family Contract Properties
- name - token's name
- symbol - Token's ticker symbol
- supply - Number of tokens
- members - List of family member wallet addresses


## Private Family Contract Functions
- mint - Creates tokens (Restricted to parents)
- send - Begins sending process
- receive - Displays wallet address


## Factory Contract Properties
- onlyOwner - limits function execution to this cont

## Factory Contract Functions
- create - Creates a family contract
- deploy - Deploys a family contract
- transfer - Transfers ownership of a deployed contract
