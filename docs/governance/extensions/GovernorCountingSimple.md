## `GovernorCountingSimple`



Extension of {Governor} for simple, 3 options, vote counting.

_Available since v4.3._


### `COUNTING_MODE() → string` (public)



See {IGovernor-COUNTING_MODE}.

### `hasVoted(uint256 proposalId, address account) → bool` (public)



See {IGovernor-hasVoted}.

### `proposalVotes(uint256 proposalId) → uint256 againstVotes, uint256 forVotes, uint256 abstainVotes` (public)



Accessor to the internal vote counts.

### `_quorumReached(uint256 proposalId) → bool` (internal)



See {Governor-_quorumReached}.

### `_voteSucceeded(uint256 proposalId) → bool` (internal)



See {Governor-_voteSucceeded}. In this module, the forVotes must be scritly over the againstVotes.

### `_countVote(uint256 proposalId, address account, uint8 support, uint256 weight)` (internal)



See {Governor-_countVote}. In this module, the support follows the `VoteType` enum (from Governor Bravo).



### `ProposalVote`


uint256 againstVotes


uint256 forVotes


uint256 abstainVotes


mapping(address => bool) hasVoted



### `VoteType`











