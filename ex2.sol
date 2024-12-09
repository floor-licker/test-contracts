// Sample Solidity Contract after Refactoring
pragma solidity ^0.7.0;

contract Example {
    address public owner;  
    uint256 public totalSupply;  
    uint256 public creationTime;  

    constructor(address _owner, uint256 _totalSupply) {
        owner = _owner;
        totalSupply = _totalSupply;
        creationTime = block.timestamp;  // Cannot be immutable as it depends on runtime values
    }

    function getOwner() public view returns (address) {
        return owner;
    }

    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    function getCreationTime() public view returns (uint256) {
        return creationTime;
    }
}
