// SPDX-License-Identifier: MIT
// Set pragma
pragma solidity ^0.8.0;

// Imports
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.0/contracts/access/AccessControl.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.0/contracts/access/Ownable.sol";


// Create contract: Factory
contract Factory is ERC20 public Ownable {

    // Roles
    bytes32 public constant DEPLOYER_ROLE = keccak256("DEPLOYER_ROLE");

    // Constructor
    constructor() {

        // Grant contract deployer the default admin role
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    // Functions
    // Deploy
    function deploy() {}
}

