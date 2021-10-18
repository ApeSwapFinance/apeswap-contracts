## `IGovernor`



Interface of the {Governor} core.

_Available since v4.3._


### `name() → string` (public)

module:core


Name of the governor instance (used in building the ERC712 domain separator).

### `version() → string` (public)

module:core


Version of the governor instance (used in building the ERC712 domain separator). Default: "1"

### `COUNTING_MODE() → string` (public)

module:voting


A description of the possible `support` values for {castVote} and the way these votes are counted, meant to
be consumed by UIs to show correct vote options and interpret the results. The string is a URL-encoded sequence of
key-value pairs that each describe one aspect, for example `support=bravo&quorum=for,abstain`.

There are 2 standard keys: `support` and `quorum`.

- `support=bravo` refers to the vote options 0 = For, 1 = Against, 2 = Abstain, as in `GovernorBravo`.
- `quorum=bravo` means that only For votes are counted towards quorum.
- `quorum=for,abstain` means that both For and Abstain votes are counted towards quorum.

NOTE: The string can be decoded by the standard
https://developer.mozilla.org/en-US/docs/Web/API/URLSearchParams[`URLSearchParams`]
JavaScript class.

### `hashProposal(address[] targets, uint256[] values, bytes[] calldatas, bytes32 descriptionHash) → uint256` (public)

module:core


Hashing function used to (re)build the proposal id from the proposal details..

### `state(uint256 proposalId) → enum IGovernor.ProposalState` (public)

module:core


Current state of a proposal, following Compound's convention

### `proposalSnapshot(uint256 proposalId) → uint256` (public)

module:core


block number used to retrieve user's votes and quorum.

### `proposalDeadline(uint256 proposalId) → uint256` (public)

module:core


timestamp at which votes close.

### `votingDelay() → uint256` (public)

module:user-config


delay, in number of block, between the proposal is created and the vote starts. This can be increassed to
leave time for users to buy voting power, of delegate it, before the voting of a proposal starts.

### `votingPeriod() → uint256` (public)

module:user-config


delay, in number of blocks, between the vote start and vote ends.

Note: the {votingDelay} can delay the start of the vote. This must be considered when setting the voting
duration compared to the voting delay.

### `quorum(uint256 blockNumber) → uint256` (public)

module:user-config


Minimum number of cast voted required for a proposal to be successful.

Note: The `blockNumber` parameter corresponds to the snaphot used for counting vote. This allows to scale the
quroum depending on values such as the totalSupply of a token at this block (see {ERC20Votes}).

### `getVotes(address account, uint256 blockNumber) → uint256` (public)

module:reputation


Voting power of an `account` at a specific `blockNumber`.

Note: this can be implemented in a number of ways, for example by reading the delegated balance from one (or
multiple), {ERC20Votes} tokens.

### `hasVoted(uint256 proposalId, address account) → bool` (public)

module:voting


Returns weither `account` has cast a vote on `proposalId`.

### `propose(address[] targets, uint256[] values, bytes[] calldatas, string description) → uint256 proposalId` (public)



Create a new proposal. Vote start {IGovernor-votingDelay} blocks after the proposal is created and ends
{IGovernor-votingPeriod} blocks after the voting starts.

Emits a {ProposalCreated} event.

### `execute(address[] targets, uint256[] values, bytes[] calldatas, bytes32 descriptionHash) → uint256 proposalId` (public)



Execute a successful proposal. This requires the quorum to be reached, the vote to be successful, and the
deadline to be reached.

Emits a {ProposalExecuted} event.

Note: some module can modify the requirements for execution, for example by adding an additional timelock.

### `castVote(uint256 proposalId, uint8 support) → uint256 balance` (public)



Cast a vote

Emits a {VoteCast} event.

### `castVoteWithReason(uint256 proposalId, uint8 support, string reason) → uint256 balance` (public)



Cast a with a reason

Emits a {VoteCast} event.

### `castVoteBySig(uint256 proposalId, uint8 support, uint8 v, bytes32 r, bytes32 s) → uint256 balance` (public)



Cast a vote using the user cryptographic signature.

Emits a {VoteCast} event.


### `ProposalCreated(uint256 proposalId, address proposer, address[] targets, uint256[] values, string[] signatures, bytes[] calldatas, uint256 startBlock, uint256 endBlock, string description)`



Emitted when a proposal is created.

### `ProposalCanceled(uint256 proposalId)`



Emitted when a proposal is canceled.

### `ProposalExecuted(uint256 proposalId)`



Emitted when a proposal is executed.

### `VoteCast(address voter, uint256 proposalId, uint8 support, uint256 weight, string reason)`



Emitted when a vote is cast.

Note: `support` values should be seen as buckets. There interpretation depends on the voting module used.



### `ProposalState`


























