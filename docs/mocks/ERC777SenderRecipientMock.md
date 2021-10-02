## `ERC777SenderRecipientMock`






### `tokensToSend(address operator, address from, address to, uint256 amount, bytes userData, bytes operatorData)` (external)





### `tokensReceived(address operator, address from, address to, uint256 amount, bytes userData, bytes operatorData)` (external)





### `senderFor(address account)` (public)





### `registerSender(address sender)` (public)





### `recipientFor(address account)` (public)





### `registerRecipient(address recipient)` (public)





### `setShouldRevertSend(bool shouldRevert)` (public)





### `setShouldRevertReceive(bool shouldRevert)` (public)





### `send(contract IERC777 token, address to, uint256 amount, bytes data)` (public)





### `burn(contract IERC777 token, uint256 amount, bytes data)` (public)






### `TokensToSendCalled(address operator, address from, address to, uint256 amount, bytes data, bytes operatorData, address token, uint256 fromBalance, uint256 toBalance)`





### `TokensReceivedCalled(address operator, address from, address to, uint256 amount, bytes data, bytes operatorData, address token, uint256 fromBalance, uint256 toBalance)`





### `BeforeTokenTransfer()`







