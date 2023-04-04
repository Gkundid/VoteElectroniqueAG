pragma solidity ^0.4.12;

// SPDX-License-Identifier: GPL-3.0

import "./Ownable.sol";
import "./SafeMath.sol";
import "./Whitelist.sol";

contract Election is Ownable {

using SafeMath for uint256;

    // Votes enum
    enum vote {POUR, CONTRE, NEUTRE}

    // Vote count to increment for each vote
    struct resolution{
        uint id; // identifiant de resolution
        string titre; 
        uint pour; // nombre de votes "POUR"
        uint contre; // nombre de votes "CONTRE"
        uint neutre; // nombre de votes "NEUTRE"
    }

    // AG's variable
    address public presidentDeSeance;
    address public scrutateur;
    address public secretaire;

    uint public nombreDeResolutions; // total vote

     // Store accounts that have voted
    mapping(uint => resolution) public voteCount;
    mapping(address => bool) public voters;


    // Model a Candidate
    // struct Candidate {
    //     uint256 id;
    //     string name;
    //   //  uint voteCount;
    // }

   
    
    // Store Candidates
    // Fetch Candidate
    // mapping(uint => Candidate) public candidates;
    // Store Candidates Count
    uint public candidatesCount;

    // voted event
    event votedEvent ( uint indexed _candidateId);

    function addCandidate (string memory _name) public {
        // candidatesCount ++;
        // candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

//    function vote (uint _candidateId) public {
        // require that they haven't voted before
//        require(!voters[msg.sender]);

        // require a valid candidate
//        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
//        voters[msg.sender] = true;

        // update candidate vote Count
//        candidates[_candidateId].voteCount ++;

        // trigger voted event
//        emit votedEvent (_candidateId);
//    }
}
