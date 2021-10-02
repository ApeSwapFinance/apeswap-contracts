## `GovernorVotesQuorumFraction`



Extension of {Governor} for voting weight extraction from an {ERC20Votes} token and a quorum expressed as a
fraction of the total supply.

_Available since v4.3._


### `constructor(uint256 quorumNumeratorValue)` (internal)





### `quorumNumerator() → uint256` (public)





### `quorumDenominator() → uint256` (public)





### `quorum(uint256 blockNumber) → uint256` (public)





### `updateQuorumNumerator(uint256 newQuorumNumerator)` (external)





### `_updateQuorumNumerator(uint256 newQuorumNumerator)` (internal)






### `QuorumNumeratorUpdated(uint256 oldQuorumNumerator, uint256 newQuorumNumerator)`







