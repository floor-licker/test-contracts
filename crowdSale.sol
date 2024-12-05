pragma solidity >=0.6.0;

import "../Math/SafeMath.sol";

contract Crowdsale {
    using SafeMath for uint256;

    address public owner;
    uint256 public rate; // tokens per ether
    uint256 public raisedAmount;

    mapping(address => uint256) public contributions;

    constructor(uint256 _rate) public {
        owner = msg.sender;
        rate = _rate;
    }

    function buyTokens() public payable {
        uint256 tokens = msg.value.mul(rate);
        raisedAmount = raisedAmount.add(msg.value);
        contributions[msg.sender] = contributions[msg.sender].add(msg.value);

        // Normally, you would transfer tokens here
    }

    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw funds");
        msg.sender.transfer(raisedAmount);
        raisedAmount = 0;
    }
}
