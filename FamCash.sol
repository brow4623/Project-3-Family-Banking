// SPDX-License-Identifier: MIT
// Set pragma
pragma solidity ^0.8.0;

// Imports
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.0/contracts/access/AccessControl.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.0/contracts/access/Ownable.sol";


// Create contract: FamCash
contract FamCash is ERC20, AccessControl {

    // Properties
    string private _name;
    string private _symbol;
    uint256 private _supply;

    // Role identifiers
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    
    // Constructor implementation
    constructor(
        address minter,
        string memory _name,
        string memory _symbol,
        uint256 _supply;
    )
    ERC20(_name, _ticker) {

        // Roles granted:
        // Admin role
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        
        // Minter role
        _grantRole(MINTER_ROLE, minter);

        // Property values
        _name = name;
        _symbol = symbol;
        _supply = supply;
    }


    // Functions:
    // Mint
    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }
}

