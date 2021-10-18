## `GovernorProposalThreshold`



Extension of {Governor} for proposal restriction to token holders with a minimum balance.

_Available since v4.3._


### `propose(address[] targets, uint256[] values, bytes[] calldatas, string description) → uint256` (public)



See {IGovernor-propose}.

### `proposalThreshold() → uint256` (public)



Part of the Governor Bravo's interface: _"The number of votes required in order for a voter to become a proposer"_.




