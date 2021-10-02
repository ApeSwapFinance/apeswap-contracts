## `GovernorVotes`



Extension of {Governor} for voting weight extraction from an {ERC20Votes} token.

_Available since v4.3._


### `constructor(contract ERC20Votes tokenAddress)` (internal)





### `getVotes(address account, uint256 blockNumber) → uint256` (public)

Read the voting weight from the token's built in snapshot mechanism (see {IGovernor-getVotes}).






