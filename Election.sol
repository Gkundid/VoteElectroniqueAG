// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.4.12;

import "./Ownable.sol";
import "./SafeMath.sol";
import "./Whitelist.sol";

contract Election is Ownable, Whitelist {

using SafeMath for uint256;

// struct a Candidate
struct Candidate {
    uint256 id;
    string name;
    uint voteCount;
    uint forVotes;
    uint againstVotes;
    uint neutralVotes;
}

// Set a mapping to save accounts that have voted with bool.
mapping(address => bool) public voters;

// Set a mapping to save candidates with their id, name and voteCount.
mapping(uint => Candidate) public candidates;

// Set candidates count.
uint public candidatesCount;

// Initialize employee adress.
address public president;
address public scrutateur;
address public secretaire;

// Create an event that will be called when a person votes.
// (set the candidate id that for who the person voted in parameters)
event votedEvent ( uint indexed _candidateId);

// Create a function only usable by the owner.
function addCandidate (string memory _name) public onlyOwner {
    // Increment variable candidatesCount.
    candidatesCount ++;

    /* Create new object Candidate with the candidate id (candidatesCount), 
    *  the candidate's name and the number of votes for this candidates 
    *  which is initialized to 0 because a new candidate doesn't have vote.
    */
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0, 0, 0, 0);
}

// Create a function to vote for a candidate.
function vote (uint _candidateId, uint _voteType) public {
    
    // TODO : condition one vote per candidate 
    // require(!voters[msg.sender] , "Already voted for this candidate!!");


    // Add condition to check the candidate's id. This id must be between 1 and
    // the candidatesCount number.
    require(_candidateId > 0 && _candidateId <= candidatesCount, "Error on candidate id.");

    // Check if the voter has already voted for this candidate.
    

    // Check if the voter is on whitelist.
    //TODO :
    require(isWhitelisted(msg.sender), "This person is not on whitelist.");

    // Set that the voter has voted
    voters[msg.sender] = true;

    // Increment the voteCount for the candidate.
    candidates[_candidateId].voteCount ++;

    // Increment the vote type
    if (_voteType == 1) {
            candidates[_candidateId].forVotes ++; 
    } else if (_voteType == 2) {
            candidates[_candidateId].againstVotes ++;
    } else if (_voteType == 3) {
            candidates[_candidateId].neutralVotes ++; 
    }
}

    // Set the president, scrutateur and secretaire of the AG.
    function setEmployes(address _president, address _scrutateur,
     address _secretaire) public onlyOwner {
        president = _president;
        scrutateur = _scrutateur;
        secretaire = _secretaire;
    }
}
