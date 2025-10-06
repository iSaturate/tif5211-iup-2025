// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProofOfExistence {
    address public owner;

    mapping(bytes32 => uint256) public proofs;

    event DocumentNotarized(address indexed who, bytes32 indexed documentHash, uint256 timestamp);

    constructor() {
        owner = msg.sender;
    }

    function notarizeDocument(bytes32 documentHash) public {
       
        require(proofs[documentHash] == 0, "Document's already notarized!!");

        
        proofs[documentHash] = block.timestamp;

        
        emit DocumentNotarized(msg.sender, documentHash, block.timestamp);
    }

  
    function verifyDocument(bytes32 documentHash) public view returns (bool) {
        return proofs[documentHash] != 0;
    }

    
    function getTimestamp(bytes32 documentHash) public view returns (uint256) {
        return proofs[documentHash];
    }
}
