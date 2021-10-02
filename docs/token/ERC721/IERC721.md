## `IERC721`



Required interface of an ERC721 compliant contract.


### `balanceOf(address owner) → uint256 balance` (external)



Returns the number of tokens in ``owner``'s account.

### `ownerOf(uint256 tokenId) → address owner` (external)



Returns the owner of the `tokenId` token.

Requirements:

- `tokenId` must exist.

### `safeTransferFrom(address from, address to, uint256 tokenId)` (external)



Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
are aware of the ERC721 protocol to prevent tokens from being forever locked.

Requirements:

- `from` cannot be the zero address.
- `to` cannot be the zero address.
- `tokenId` token must exist and be owned by `from`.
- If the caller is not `from`, it must be have been allowed to move this token by either {approve} or {setApprovalForAll}.
- If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.

Emits a {Transfer} event.

### `transferFrom(address from, address to, uint256 tokenId)` (external)



Transfers `tokenId` token from `from` to `to`.

WARNING: Usage of this method is discouraged, use {safeTransferFrom} whenever possible.

Requirements:

- `from` cannot be the zero address.
- `to` cannot be the zero address.
- `tokenId` token must be owned by `from`.
- If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.

Emits a {Transfer} event.

### `approve(address to, uint256 tokenId)` (external)



Gives permission to `to` to transfer `tokenId` token to another account.
The approval is cleared when the token is transferred.

Only a single account can be approved at a time, so approving the zero address clears previous approvals.

Requirements:

- The caller must own the token or be an approved operator.
- `tokenId` must exist.

Emits an {Approval} event.

### `getApproved(uint256 tokenId) → address operator` (external)



Returns the account approved for `tokenId` token.

Requirements:

- `tokenId` must exist.

### `setApprovalForAll(address operator, bool _approved)` (external)



Approve or remove `operator` as an operator for the caller.
Operators can call {transferFrom} or {safeTransferFrom} for any token owned by the caller.

Requirements:

- The `operator` cannot be the caller.

Emits an {ApprovalForAll} event.

### `isApprovedForAll(address owner, address operator) → bool` (external)



Returns if the `operator` is allowed to manage all of the assets of `owner`.

See {setApprovalForAll}

### `safeTransferFrom(address from, address to, uint256 tokenId, bytes data)` (external)



Safely transfers `tokenId` token from `from` to `to`.

Requirements:

- `from` cannot be the zero address.
- `to` cannot be the zero address.
- `tokenId` token must exist and be owned by `from`.
- If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
- If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.

Emits a {Transfer} event.


### `Transfer(address from, address to, uint256 tokenId)`



Emitted when `tokenId` token is transferred from `from` to `to`.

### `Approval(address owner, address approved, uint256 tokenId)`



Emitted when `owner` enables `approved` to manage the `tokenId` token.

### `ApprovalForAll(address owner, address operator, bool approved)`



Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.



