// SPDX-License-Identifier: MIT

// Pragma Declaration
pragma solidity ^0.8.0;

// Imports
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

// Contract: FamCash
contract FamCashDuo is ERC20, AccessControl {

    // Role Identifiers - Creates roles for limiting specific functionality
    bytes32 public constant PARENT_ROLE = keccak256("PARENT_ROLE");
    bytes32 public constant MEMBER_ROLE = keccak256("MEMBER_ROLE");

    // Parent addresses
    address private _parent1;
    address private _parent2;

    // Parent Signatures Mapping
    mapping(address => bool) private _parentSignatures;

    constructor(address contractOwner, string memory tokenName, string memory tokenTicker)
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

    // Add Second Parent Function
    function addSecondParent(address parent) public onlyRole(PARENT_ROLE) {
        require(_parent2 == address(0), "Second parent already exists.");
        require(parent != _parent1, "You're already added as the first parent.");

        _parent2 = parent;
        _parentSignatures[_parent2] = false;
        _grantRole(PARENT_ROLE, parent);
        _grantRole(MEMBER_ROLE, parent);
    }

    // BothParentsSigned Modifier - Requires both parents' signatures to execute
    modifier bothParentsSigned() {
        require(_parentSignatures[_parent1] && _parentSignatures[_parent2],
        "Both parents must sign off.");
        _;
    }

    // OnlyParent Modifier - Requires the PARENT_ROLE to execute
    modifier onlyParent() { require(hasRole(PARENT_ROLE, msg.sender),
        "Only a parent can do this.");
        _;
    }

    // Mint Function - Mints new tokens
    function mint(address recipient, uint256 amount) public onlyRole(PARENT_ROLE) {

        // _mint - Sends specified token amount to specified recipient
        _mint(recipient, amount);
    }

    // AddMember Function - Adds new family member
    function addMember(address member) public onlyRole(PARENT_ROLE) {

        // Grant member role to address
        _grantRole(MEMBER_ROLE, member);
    }

    // Set an allowance amount
    function setAllowance(uint256 allowanceAmount) public onlyParent {
        allowance = allowanceAmount;
    }

    // Pay Allowance Function - Transfers allowance to a child
    function payAllowance(address to, uint256 allowance) external onlyParent bothParentsSigned {

        // Reset parent signatures for the next transfer
        _parentSignatures[_parent1] = false;
        _parentSignatures[_parent2] = false;

        // Transfer the allowance to the address (child or member)
        _transfer(msg.sender, to, amount);
    }

    // Set Parent Signature Function - Sets the parent's signature status
    function setParentSignature(bool hasSigned) external onlyParent {
        _parentSignatures[msg.sender] = hasSigned;
    }
}