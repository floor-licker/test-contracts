pragma solidity ^0.8.0;

contract ExampleContract {
    address[] public addresses;

    function processAddress(uint256 index) public {
        // This storage declaration is unnecessary and should be converted to memory
        address addr storage;
        addr = addresses[index];

        // Do something with addr
        require(addr != address(0), "Address cannot be zero");
    }

    function addAddress(address newAddress) public {
        // This function does not need modification
        addresses.push(newAddress);
    }
}
