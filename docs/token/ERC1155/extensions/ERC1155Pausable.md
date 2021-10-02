## `ERC1155Pausable`



ERC1155 token with pausable token transfers, minting and burning.

Useful for scenarios such as preventing trades until the end of an evaluation
period, or having an emergency switch for freezing all token transfers in the
event of a large bug.

_Available since v3.1._


### `_beforeTokenTransfer(address operator, address from, address to, uint256[] ids, uint256[] amounts, bytes data)` (internal)



See {ERC1155-_beforeTokenTransfer}.

Requirements:

- the contract must not be paused.




