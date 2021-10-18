## `IERC1363Receiver`






### `onTransferReceived(address operator, address from, uint256 value, bytes data) → bytes4` (external)

Handle the receipt of ERC1363 tokens


Any ERC1363 smart contract calls this function on the recipient
after a `transfer` or a `transferFrom`. This function MAY throw to revert and reject the
transfer. Return of other than the magic value MUST result in the
transaction being reverted.
Note: the token contract address is always the message sender.





