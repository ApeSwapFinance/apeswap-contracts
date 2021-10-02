## `MinimalForwarder`



Simple minimal forwarder to be used together with an ERC2771 compatible contract. See {ERC2771Context}.


### `getNonce(address from) → uint256` (public)





### `verify(struct MinimalForwarder.ForwardRequest req, bytes signature) → bool` (public)





### `execute(struct MinimalForwarder.ForwardRequest req, bytes signature) → bool, bytes` (public)







### `ForwardRequest`


address from


address to


uint256 value


uint256 gas


uint256 nonce


bytes data



