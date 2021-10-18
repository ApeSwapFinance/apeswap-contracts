## `IERC1363Spender`






### `onApprovalReceived(address owner, uint256 value, bytes data) → bytes4` (external)

Handle the approval of ERC1363 tokens


Any ERC1363 smart contract calls this function on the recipient
after an `approve`. This function MAY throw to revert and reject the
approval. Return of other than the magic value MUST result in the
transaction being reverted.
Note: the token contract address is always the message sender.





