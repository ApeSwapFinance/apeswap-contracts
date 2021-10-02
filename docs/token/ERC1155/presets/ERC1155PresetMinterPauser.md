## `ERC1155PresetMinterPauser`



{ERC1155} token, including:

 - ability for holders to burn (destroy) their tokens
 - a minter role that allows for token minting (creation)
 - a pauser role that allows to stop all token transfers

This contract uses {AccessControl} to lock permissioned functions using the
different roles - head to its documentation for details.

The account that deploys the contract will be granted the minter and pauser
roles, as well as the default admin role, which will let it grant both minter
and pauser roles to other accounts.


### `constructor(string uri)` (public)



Grants `DEFAULT_ADMIN_ROLE`, `MINTER_ROLE`, and `PAUSER_ROLE` to the account that
deploys the contract.

### `mint(address to, uint256 id, uint256 amount, bytes data)` (public)



Creates `amount` new tokens for `to`, of token type `id`.

See {ERC1155-_mint}.

Requirements:

- the caller must have the `MINTER_ROLE`.

### `mintBatch(address to, uint256[] ids, uint256[] amounts, bytes data)` (public)



xref:ROOT:erc1155.adoc#batch-operations[Batched] variant of {mint}.

### `pause()` (public)



Pauses all token transfers.

See {ERC1155Pausable} and {Pausable-_pause}.

Requirements:

- the caller must have the `PAUSER_ROLE`.

### `unpause()` (public)



Unpauses all token transfers.

See {ERC1155Pausable} and {Pausable-_unpause}.

Requirements:

- the caller must have the `PAUSER_ROLE`.

### `supportsInterface(bytes4 interfaceId) → bool` (public)



See {IERC165-supportsInterface}.

### `_beforeTokenTransfer(address operator, address from, address to, uint256[] ids, uint256[] amounts, bytes data)` (internal)








