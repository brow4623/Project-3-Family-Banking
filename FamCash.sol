// SPDX-License-Identifier: MIT

// Pragma Declaration
pragma solidity ^0.8.0;

// Imports
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

// Contract: FamCash
contract FamCash is ERC20, AccessControl {

    // Role Identifiers - Creates roles for limiting specific functionality
    bytes32 public constant PARENT = keccak256("PARENT");
    bytes32 public constant MEMBER = keccak256("MEMBER");

    // Constructor Implementation - Sets name & ticker; Assigns roles to msg.sender
    constructor(address contractOwner, string memory tokenName, string memory tokenTicker)
    ERC20(tokenName, tokenTicker) {

        // Role Assignments
        _grantRole(DEFAULT_ADMIN_ROLE, contractOwner);
        _grantRole(PARENT, contractOwner);
        _grantRole(MEMBER, contractOwner);
    }
    
    // Mint Function - Mints new tokens
    function mint(address recipient, uint amount) public onlyRole(PARENT) {
        // _mint - Sends specified token amount to specified recipient
        _mint(recipient, amount);
    }

    // AddParent Function - Adds new parent
    function addParent(address parent) public onlyRole(PARENT) {
        
        // Check if address is already a parent
        require(!hasRole(PARENT, parent), "They're already a parent");
    
        // Assign PARENT & MINTER roles to specified member
        _grantRole(PARENT, parent);
    }

    // AddMember Function - Adds new family member
    function addMember(address member) public onlyRole(PARENT) {
    
        // Check if address is already a member
        require(!hasRole(MEMBER, member), "Address is already a member");
        
        // _grantRole - Assigns MEMBER role to specified member
        _grantRole(MEMBER, member);
    }
}
