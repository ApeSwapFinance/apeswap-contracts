## `ERC20Wrapper`



Extension of the ERC20 token contract to support token wrapping.

Users can deposit and withdraw "underlying tokens" and receive a matching number of "wrapped tokens". This is useful
in conjunction with other modules. For example, combining this wrapping mechanism with {ERC20Votes} will allow the
wrapping of an existing "basic" ERC20 into a governance token.

_Available since v4.2._


### `constructor(contract IERC20 underlyingToken)` (internal)





### `depositFor(address account, uint256 amount) → bool` (public)



Allow a user to deposit underlying tokens and mint the corresponding number of wrapped tokens.

### `withdrawTo(address account, uint256 amount) → bool` (public)



Allow a user to burn a number of wrapped tokens and withdraw the corresponding number of underlying tokens.

### `_recover(address account) → uint256` (internal)



Mint wrapped token to cover any underlyingTokens that would have been transfered by mistake. Internal
function that can be exposed with access control if desired.




