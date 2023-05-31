# FamCash
We begin with the family contract. This contract is owned by a parent and allows them to mint a private family token. They provide a name, symbol, amount, and number of family members. Then, they pay the gas fee to mint their tokens and receive them in their wallet.


Next is the Factory contract, which creates all FamCash contracts. It is the Owner of all the contracts. It sets them up and deploys them for each new family.


## Private Family Contract Properties
- name - Contract's name
- members - List of family members
- token - Token's title
- symbol - Token's ticker symbol
- supply - Number of tokens


## Private Family Contract Functions
- mint - Creates tokens (Restricted to parents)
- send - Begins sending process
- receive - Displays wallet address


## Factory Deployer Contract Properties
- 

## Factory Deployer Contract Functions
- create - Creates a family contract
- deploy - Deploys a family contract
- transfer - Transfers ownership of a deployed contract
- relenquish - Relenquises ownership of a deployed family contract
