// SPDX-License-Identifier: MIT

// Pragma Declaration
pragma solidity ^0.8.0;

// Imports
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

// Contract: FamCash
contract FamCash is ERC20, AccessControl {
    // Role Identifiers
    bytes32 public constant PARENT_ROLE = keccak256("PARENT_ROLE");
    bytes32 public constant MEMBER_ROLE = keccak256("MEMBER_ROLE");
    address private _parent1;
    address private _parent2;

    // Parent Signatures
    mapping(address => bool) private _parentSignatures;

    // Constructor
    constructor( address contractOwner, string memory tokenName, string memory tokenTicker)
        ERC20(tokenName, tokenTicker)
    {
        // Role Assignments
        
        _setupRole(DEFAULT_ADMIN_ROLE, contractOwner);
        _setupRole(PARENT_ROLE, contractOwner);
        _setupRole(MEMBER_ROLE, contractOwner);

        // Set contract owner as parent1
        _parent1 = contractOwner;
        _parentSignatures[_parent1] = false;
    }

    // Modifier: Requires both parents to have signed off
    modifier requireBothParentsSigned() {
        require(_parentSignatures[_parent1] && _parentSignatures[_parent2], "Both parents must sign off.");
        _;
    }

    // Add Second Parent Function
    function addSecondParent(address parent) public onlyRole(PARENT_ROLE) {
        require(_parent2 == address(0), "Second parent already exists.");
        require(parent != _parent1, "Parent already added as the first parent.");

        _parent2 = parent;
        _parentSignatures[_parent2] = false;
        _grantRole(PARENT_ROLE, parent);
        _grantRole(MEMBER_ROLE, parent);
    }

    // Transfer Allowance Function
    function transferAllowance(address recipient, uint256 amount) public requireBothParentsSigned {
        // Perform the transfer here
        transfer(recipient, amount);
    }
}
