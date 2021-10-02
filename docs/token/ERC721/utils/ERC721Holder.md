## `ERC721Holder`



Implementation of the {IERC721Receiver} interface.

Accepts all token transfers.
Make sure the contract is able to use its token with {IERC721-safeTransferFrom}, {IERC721-approve} or {IERC721-setApprovalForAll}.


### `onERC721Received(address, address, uint256, bytes) → bytes4` (public)



See {IERC721Receiver-onERC721Received}.

Always returns `IERC721Receiver.onERC721Received.selector`.




