## `Governor`



Core of the governance system, designed to be extended though various modules.

This contract is abstract and requires several function to be implemented in various modules:

- A counting module must implement {quorum}, {_quorumReached}, {_voteSucceeded} and {_countVote}
- A voting module must implement {getVotes}
- Additionanly, the {votingPeriod} must also be implemented

_Available since v4.3._

### `onlyGovernance()`



Restrict access to governor executing address. Some module might override the _executor function to make
sure this modifier is consistant with the execution model.


### `constructor(string name_)` (internal)



Sets the value for {name} and {version}

### `supportsInterface(bytes4 interfaceId) → bool` (public)



See {IERC165-supportsInterface}.

### `name() → string` (public)



See {IGovernor-name}.

### `version() → string` (public)



See {IGovernor-version}.

### `hashProposal(address[] targets, uint256[] values, bytes[] calldatas, bytes32 descriptionHash) → uint256` (public)



See {IGovernor-hashProposal}.

The proposal id is produced by hashing the RLC encoded `targets` array, the `values` array, the `calldatas` array
and the descriptionHash (bytes32 which itself is the keccak256 hash of the description string). This proposal id
can be produced from the proposal data which is part of the {ProposalCreated} event. It can even be computed in
advance, before the proposal is submitted.

Note that the chainId and the governor address are not part of the proposal id computation. Consequently, the
same proposal (with same operation and same description) will have the same id if submitted on multiple governors
accross multiple networks. This also means that in order to execute the same operation twice (on the same
governor) the proposer will have to change the description in order to avoid proposal id conflicts.

### `state(uint256 proposalId) → enum IGovernor.ProposalState` (public)



See {IGovernor-state}.

### `proposalSnapshot(uint256 proposalId) → uint256` (public)



See {IGovernor-proposalSnapshot}.

### `proposalDeadline(uint256 proposalId) → uint256` (public)



See {IGovernor-proposalDeadline}.

### `_quorumReached(uint256 proposalId) → bool` (internal)



Amount of votes already cast passes the threshold limit.

### `_voteSucceeded(uint256 proposalId) → bool` (internal)



Is the proposal successful or not.

### `_countVote(uint256 proposalId, address account, uint8 support, uint256 weight)` (internal)



Register a vote with a given support and voting weight.

Note: Support is generic and can represent various things depending on the voting system used.

### `propose(address[] targets, uint256[] values, bytes[] calldatas, string description) → uint256` (public)



See {IGovernor-propose}.

### `execute(address[] targets, uint256[] values, bytes[] calldatas, bytes32 descriptionHash) → uint256` (public)



See {IGovernor-execute}.

### `_execute(uint256, address[] targets, uint256[] values, bytes[] calldatas, bytes32)` (internal)



Internal execution mechanism. Can be overriden to implement different execution mechanism

### `_cancel(address[] targets, uint256[] values, bytes[] calldatas, bytes32 descriptionHash) → uint256` (internal)



Internal cancel mechanism: locks up the proposal timer, preventing it from being re-submitted. Marks it as
canceled to allow distinguishing it from executed proposals.

Emits a {IGovernor-ProposalCanceled} event.

### `castVote(uint256 proposalId, uint8 support) → uint256` (public)



See {IGovernor-castVote}.

### `castVoteWithReason(uint256 proposalId, uint8 support, string reason) → uint256` (public)



See {IGovernor-castVoteWithReason}.

### `castVoteBySig(uint256 proposalId, uint8 support, uint8 v, bytes32 r, bytes32 s) → uint256` (public)



See {IGovernor-castVoteBySig}.

### `_castVote(uint256 proposalId, address account, uint8 support, string reason) → uint256` (internal)



Internal vote casting mechanism: Check that the vote is pending, that it has not been cast yet, retrieve
voting weight using {IGovernor-getVotes} and call the {_countVote} internal function.

Emits a {IGovernor-VoteCast} event.

### `_executor() → address` (internal)



Address through which the governor executes action. Will be overloaded by module that execute actions
through another contract such as a timelock.



### `ProposalCore`


struct Timers.BlockNumber voteStart


struct Timers.BlockNumber voteEnd


bool executed


bool canceled



