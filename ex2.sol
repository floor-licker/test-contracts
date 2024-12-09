// Sample Solidity Contract after Refactoring
pragma solidity ^0.8.0;

contract Example {
    address public  owner;  // Marked as immutable
    uint256 public  totalSupply;  // Marked as immutable
    uint256 public creationTime;  // Left as is because it's not immutable

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
