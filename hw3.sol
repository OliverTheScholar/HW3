// SPDX-License-Identifier: UNLICENSED 
pragma solidity >= 0.8.0;

contract hw3 {

    function doMath(int256 numberOne, int256 numberTwo) external pure returns (int256) {
        return numberOne * numberTwo;
    }
    // finally, it works. thanks Jack.
    function hashStringArray(string[] memory words) external pure returns (bytes32[] memory) {
        bytes32[] memory bytesArray = new bytes32[](words.length);
        for (uint i = 0; i < words.length; i++) {
            bytesArray[i] = keccak256(abi.encode(words[i]));
        }
        return bytesArray;
    }

    // contact book
    mapping(address => address[]) public addressToContacts;
    
    function getContacts(address caller) external view returns (address[] memory) {
        return addressToContacts[caller];
    }
    function addContact(address contact) external {
        addressToContacts[msg.sender].push(contact);
    }
    function setContacts(address[] calldata contacts) external {
        addressToContacts[msg.sender] = contacts;
    }

    // extra credit
    mapping(address => mapping (address => string)) public addressToNickname;

    function getNickname(address caller, address contact) external view returns (string memory) {
        return addressToNickname[caller][contact];
    }
    function setNickname(address contact, string calldata nickname) external {
        addressToNickname[msg.sender][contact] = nickname;
    }


}