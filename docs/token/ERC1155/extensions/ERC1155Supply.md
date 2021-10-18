## `ERC1155Supply`



Extension of ERC1155 that adds tracking of total supply per id.

Useful for scenarios where Fungible and Non-fungible tokens have to be
clearly identified. Note: While a totalSupply of 1 might mean the
corresponding is an NFT, there is no guarantees that no other token with the
same id are not going to be minted.


### `totalSupply(uint256 id) → uint256` (public)



Total amount of tokens in with a given id.

### `exists(uint256 id) → bool` (public)



Indicates weither any token exist with a given id, or not.

### `_mint(address account, uint256 id, uint256 amount, bytes data)` (internal)



See {ERC1155-_mint}.

### `_mintBatch(address to, uint256[] ids, uint256[] amounts, bytes data)` (internal)



See {ERC1155-_mintBatch}.

### `_burn(address account, uint256 id, uint256 amount)` (internal)



See {ERC1155-_burn}.

### `_burnBatch(address account, uint256[] ids, uint256[] amounts)` (internal)



See {ERC1155-_burnBatch}.




