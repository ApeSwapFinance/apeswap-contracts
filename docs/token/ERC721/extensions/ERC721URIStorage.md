## `ERC721URIStorage`



ERC721 token with storage based token URI management.


### `tokenURI(uint256 tokenId) → string` (public)



See {IERC721Metadata-tokenURI}.

### `_setTokenURI(uint256 tokenId, string _tokenURI)` (internal)



Sets `_tokenURI` as the tokenURI of `tokenId`.

Requirements:

- `tokenId` must exist.

### `_burn(uint256 tokenId)` (internal)



Destroys `tokenId`.
The approval is cleared when the token is burned.

Requirements:

- `tokenId` must exist.

Emits a {Transfer} event.




