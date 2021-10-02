## `GovernorCompatibilityBravoMock`






### `constructor(string name_, contract ERC20VotesComp token_, uint256 votingDelay_, uint256 votingPeriod_, uint256 proposalThreshold_, contract ICompoundTimelock timelock_)` (public)





### `supportsInterface(bytes4 interfaceId) → bool` (public)





### `votingDelay() → uint256` (public)





### `votingPeriod() → uint256` (public)





### `proposalThreshold() → uint256` (public)





### `quorum(uint256) → uint256` (public)





### `state(uint256 proposalId) → enum IGovernor.ProposalState` (public)





### `proposalEta(uint256 proposalId) → uint256` (public)





### `propose(address[] targets, uint256[] values, bytes[] calldatas, string description) → uint256` (public)





### `queue(address[] targets, uint256[] values, bytes[] calldatas, bytes32 salt) → uint256` (public)





### `execute(address[] targets, uint256[] values, bytes[] calldatas, bytes32 salt) → uint256` (public)





### `_execute(uint256 proposalId, address[] targets, uint256[] values, bytes[] calldatas, bytes32 descriptionHash)` (internal)





### `cancel(address[] targets, uint256[] values, bytes[] calldatas, bytes32 salt) → uint256 proposalId` (public)

WARNING: this is for mock purposes only. Ability to the _cancel function should be restricted for live
deployments.



### `_cancel(address[] targets, uint256[] values, bytes[] calldatas, bytes32 salt) → uint256 proposalId` (internal)





### `getVotes(address account, uint256 blockNumber) → uint256` (public)





### `_executor() → address` (internal)








