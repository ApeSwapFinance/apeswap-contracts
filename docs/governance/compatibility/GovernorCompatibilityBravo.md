## `GovernorCompatibilityBravo`



Compatibility layer that implements GovernorBravo compatibility on to of {Governor}.

This compatibility layer includes a voting system and requires a {IGovernorTimelock} compatible module to be added
through inheritance. It does not include token bindings, not does it include any variable upgrade patterns.

NOTE: When using this module, you may need to enable the Solidity optimizer to avoid hitting the contract size limit.

_Available since v4.3._


### `COUNTING_MODE() → string` (public)





### `propose(address[] targets, uint256[] values, bytes[] calldatas, string description) → uint256` (public)



See {IGovernor-propose}.

### `propose(address[] targets, uint256[] values, string[] signatures, bytes[] calldatas, string description) → uint256` (public)



See {IGovernorCompatibilityBravo-propose}.

### `queue(uint256 proposalId)` (public)



See {IGovernorCompatibilityBravo-queue}.

### `execute(uint256 proposalId)` (public)



See {IGovernorCompatibilityBravo-execute}.

### `cancel(uint256 proposalId)` (public)





### `proposalThreshold() → uint256` (public)



Part of the Governor Bravo's interface: _"The number of votes required in order for a voter to become a proposer"_.

### `proposals(uint256 proposalId) → uint256 id, address proposer, uint256 eta, uint256 startBlock, uint256 endBlock, uint256 forVotes, uint256 againstVotes, uint256 abstainVotes, bool canceled, bool executed` (public)



See {IGovernorCompatibilityBravo-proposals}.

### `getActions(uint256 proposalId) → address[] targets, uint256[] values, string[] signatures, bytes[] calldatas` (public)



See {IGovernorCompatibilityBravo-getActions}.

### `getReceipt(uint256 proposalId, address voter) → struct IGovernorCompatibilityBravo.Receipt` (public)



See {IGovernorCompatibilityBravo-getReceipt}.

### `quorumVotes() → uint256` (public)



See {IGovernorCompatibilityBravo-quorumVotes}.

### `hasVoted(uint256 proposalId, address account) → bool` (public)



See {IGovernor-hasVoted}.

### `_quorumReached(uint256 proposalId) → bool` (internal)



See {Governor-_quorumReached}. In this module, only forVotes count toward the quorum.

### `_voteSucceeded(uint256 proposalId) → bool` (internal)



See {Governor-_voteSucceeded}. In this module, the forVotes must be scritly over the againstVotes.

### `_countVote(uint256 proposalId, address account, uint8 support, uint256 weight)` (internal)



See {Governor-_countVote}. In this module, the support follows Governor Bravo.



### `ProposalDetails`


address proposer


address[] targets


uint256[] values


string[] signatures


bytes[] calldatas


uint256 forVotes


uint256 againstVotes


uint256 abstainVotes


mapping(address => struct IGovernorCompatibilityBravo.Receipt) receipts


bytes32 descriptionHash



### `VoteType`











