## `IGovernorCompatibilityBravo`



Interface extension that adds missing functions to the {Governor} core to provide `GovernorBravo` compatibility.

_Available since v4.3._


### `quorumVotes() → uint256` (public)



Part of the Governor Bravo's interface.

### `proposals(uint256) → uint256 id, address proposer, uint256 eta, uint256 startBlock, uint256 endBlock, uint256 forVotes, uint256 againstVotes, uint256 abstainVotes, bool canceled, bool executed` (public)



Part of the Governor Bravo's interface: _"The official record of all proposals ever proposed"_.

### `propose(address[] targets, uint256[] values, string[] signatures, bytes[] calldatas, string description) → uint256` (public)



Part of the Governor Bravo's interface: _"Function used to propose a new proposal"_.

### `queue(uint256 proposalId)` (public)



Part of the Governor Bravo's interface: _"Queues a proposal of state succeeded"_.

### `execute(uint256 proposalId)` (public)



Part of the Governor Bravo's interface: _"Executes a queued proposal if eta has passed"_.

### `cancel(uint256 proposalId)` (public)



Cancels a proposal only if sender is the proposer, or proposer delegates dropped below proposal threshold.

### `getActions(uint256 proposalId) → address[] targets, uint256[] values, string[] signatures, bytes[] calldatas` (public)



Part of the Governor Bravo's interface: _"Gets actions of a proposal"_.

### `getReceipt(uint256 proposalId, address voter) → struct IGovernorCompatibilityBravo.Receipt` (public)



Part of the Governor Bravo's interface: _"Gets the receipt for a voter on a given proposal"_.

### `proposalThreshold() → uint256` (public)



Part of the Governor Bravo's interface: _"The number of votes required in order for a voter to become a proposer"_.



### `Proposal`


uint256 id


address proposer


uint256 eta


address[] targets


uint256[] values


string[] signatures


bytes[] calldatas


uint256 startBlock


uint256 endBlock


uint256 forVotes


uint256 againstVotes


uint256 abstainVotes


bool canceled


bool executed


mapping(address => struct IGovernorCompatibilityBravo.Receipt) receipts


### `Receipt`


bool hasVoted


uint8 support


uint96 votes



