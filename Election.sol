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
}

// Set a mapping to save accounts that have voted with bool.
mapping(address => bool) public voters;

// Set a mapping to save candidates with their id, name and voteCount.
mapping(uint => Candidate) public candidates;

// Set candidates count.
uint public candidatesCount;

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
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
}

// Create a function to vote for a candidate.
function vote (uint _candidateId) public {
    
    // Add condition to be sure that a person hasn't already voted.
    require(!voters[msg.sender], "Already voted!!");

    // Add condition to check the candidate's id. This id must be between 1 and
    // the candidatesCount number.
    require(_candidateId > 0 && _candidateId <= candidatesCount, "Error on candidate id.");

    // Check if the voter is on whitelist.
    //TODO :
    //require(isWhitelisted(msg.sender), "This person is not on whitelist.");

    // Set that the voter has voted
    voters[msg.sender] = true;

    // Increment the voteCount for the candidate.
    candidates[_candidateId].voteCount ++;

    // emit signal when the voted is end.
    //emit votedEvent(_candidateId);
}
}
