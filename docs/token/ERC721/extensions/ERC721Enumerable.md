## `ERC721Enumerable`



This implements an optional extension of {ERC721} defined in the EIP that adds
enumerability of all the token ids in the contract as well as all token ids owned by each
account.


### `supportsInterface(bytes4 interfaceId) → bool` (public)



See {IERC165-supportsInterface}.

### `tokenOfOwnerByIndex(address owner, uint256 index) → uint256` (public)



See {IERC721Enumerable-tokenOfOwnerByIndex}.

### `totalSupply() → uint256` (public)



See {IERC721Enumerable-totalSupply}.

### `tokenByIndex(uint256 index) → uint256` (public)



See {IERC721Enumerable-tokenByIndex}.

### `_beforeTokenTransfer(address from, address to, uint256 tokenId)` (internal)



Hook that is called before any token transfer. This includes minting
and burning.

Calling conditions:

- When `from` and `to` are both non-zero, ``from``'s `tokenId` will be
transferred to `to`.
- When `from` is zero, `tokenId` will be minted for `to`.
- When `to` is zero, ``from``'s `tokenId` will be burned.
- `from` cannot be the zero address.
- `to` cannot be the zero address.

To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].




