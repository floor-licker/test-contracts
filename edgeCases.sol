// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TestContract {

    uint256 public value;
    address public owner;

    mapping(address => uint256) public balances;

    // A simple getter function (should be marked 'view')
    function getValue() public view returns (uint256) {
        return value;
    }

    // Function that modifies state (should not be 'view')
    function setValue(uint256 newValue) public {
        value = newValue;
    }

    // Function that checks a condition and modifies state (should not be 'view')
    function deposit(uint256 amount) public {
        require(amount > 0, "Amount must be greater than 0");
        balances[msg.sender] += amount;
    }

    // A function that performs calculations but does not modify state (should be 'pure')
    function calculateSum(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    // A function that reads state but does not modify it (should be 'view')
    function isOwner() public view returns (bool) {
        return msg.sender == owner;
    }

    // A function that uses msg.sender (should not be 'view')
    function transferOwnership(address newOwner) public {
        require(msg.sender == owner, "Only the current owner can transfer ownership");
        owner = newOwner;
    }

    // A function with a state-modifying operation but also reads state (should not be 'view')
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    // A pure function with no state interaction (should be 'pure')
    function multiply(uint256 x, uint256 y) public pure returns (uint256) {
        return x * y;
    }

    // A function that uses a modifier with no state interaction (should be 'pure')
    function isEven(uint256 number) public pure returns (bool) {
        return number % 2 == 0;
    }

    // A function that modifies state and does not return anything (should not be 'view')
    function setOwner(address newOwner) public {
        require(owner == address(0), "Owner already set");
        owner = newOwner;
    }

    // A function that conditionally modifies state based on external input (should not be 'view')
    function conditionalTransfer(address to, uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        if (amount > 1000) {
            balances[msg.sender] -= amount;
            balances[to] += amount;
        }
    }

    // A function that calls other functions and does not modify state (should be 'view')
    function complexCheck() public view returns (bool) {
        if (getValue() > 100) {
            return isOwner();
        }
        return false;
    }
}
