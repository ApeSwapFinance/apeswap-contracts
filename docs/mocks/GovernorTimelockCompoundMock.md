## `GovernorTimelockCompoundMock`






### `constructor(string name_, contract ERC20Votes token_, uint256 votingDelay_, uint256 votingPeriod_, contract ICompoundTimelock timelock_, uint256 quorumNumerator_)` (public)





### `supportsInterface(bytes4 interfaceId) → bool` (public)





### `votingDelay() → uint256` (public)





### `votingPeriod() → uint256` (public)





### `quorum(uint256 blockNumber) → uint256` (public)





### `cancel(address[] targets, uint256[] values, bytes[] calldatas, bytes32 salt) → uint256 proposalId` (public)





### `state(uint256 proposalId) → enum IGovernor.ProposalState` (public)

Overriding nightmare



### `_execute(uint256 proposalId, address[] targets, uint256[] values, bytes[] calldatas, bytes32 descriptionHash)` (internal)





### `_cancel(address[] targets, uint256[] values, bytes[] calldatas, bytes32 salt) → uint256 proposalId` (internal)





### `getVotes(address account, uint256 blockNumber) → uint256` (public)





### `_executor() → address` (internal)








