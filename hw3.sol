// SPDX-License-Identifier: UNLICENSED 
pragma solidity >= 0.8.0;

contract hw3 {


    function doMath(int256 numberOne, int256 numberTwo) external pure returns (int256) {
        return numberOne * numberTwo;
    }
    function hashStringArray(string[] memory words) external pure returns (bytes32[] memory) {
        uint counter = 0;
        bytes32[] memory bytesArray = new bytes32[](words.length);
        for (uint i = 0; i <= words.length; i++) {
            bytesArray[counter] = keccak256(abi.encode(words[i]));
            counter++;
        }
        return bytesArray;
    }
    
    // testing to make sure the hashing/array construction works -- now just need to figure out the loop
    function testHashing(string[] memory words) external pure returns (bytes32[] memory) {
        bytes32[] memory newArray = new bytes32[](words.length);
        newArray[0] = keccak256(abi.encode(words[0]));
        newArray[1] = keccak256(abi.encode(words[1]));
        return newArray;
    }
    // this also works, wtf
    function testLooping(string[] memory array) external pure returns (uint) {
        uint total = 0;
        for (uint i = 0; i <= array.length; i++) {
            total += i;
        }
        return total;
    }

    mapping(address => address[]) public addressToContacts;
    
    // Returns a list of contacts for a given address
    function getContacts(address caller) external view returns (address[] memory) {
        return addressToContacts[caller];
    }
    // Adds an address to the caller's list of contacts
    function addContact(address contact) external {
        addressToContacts[msg.sender].push(contact);
    }
    // Replaces the caller's existing list of contacts with the input parameter
    function setContacts(address[] calldata contacts) external {
        addressToContacts[msg.sender] = contacts;
    }

    mapping(address => mapping (address => string)) public addressToNickname;

    function getNickname(address caller, address contact) external view returns (string memory) {
        return addressToNickname[caller][contact];
    }
    function setNickname(address contact, string calldata nickname) external {
        addressToNickname[msg.sender][contact] = nickname;
    }


}