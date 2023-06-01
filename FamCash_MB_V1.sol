// SPDX-License-Identifier: MIT
// Set pragma
pragma solidity ^0.5.0;

// Imports
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Mintable.sol";


// Create contract: FamCash
//
contract FamCash is ERC20, ERC20Detailed, ERC20Mintable {

    // Properties 
    string private _name;
    string private _symbol;
    uint256 private _supply;

    // Role identifiers - What do we do here? 
    // bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    

    // Constructor implementation
    constructor( string memory name, string memory symbol, uint256 initial_supply) ERC20Detailed(name,symbol,18) public {
        _mint(msg.sender, initial_supply);
     }
}



//     // add the rest of it 
//     ERC20(_name, _ticker) {

//         // Roles granted:
//         // Admin role
//         _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        
//         // Minter role
//         _grantRole(MINTER_ROLE, minter);

//         // Property values
//         _name = name;
//         _symbol = symbol;
//         _supply = supply;
//     }


//     // Functions:
//     // Mint
//     function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
//         _mint(to, amount);
//     }
// }


// pragma solidity ^0.5.0;

// //  Import the following contracts from the OpenZeppelin library:
// //    * `ERC20`
// //    * `ERC20Detailed`
// //    * `ERC20Mintable`
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Mintable.sol";

// // Create a constructor for the KaseiCoin contract and have the contract inherit the libraries that you imported from OpenZeppelin.

// contract KaseiCoin is ERC20, ERC20Detailed, ERC20Mintable {
//     address payable owner;

//     constructor(string memory name, string memory symbol, uint256 initial_supply) ERC20Detailed(name, symbol, 18) public {
//         _mint(owner, initial_supply);


//     }

// }
