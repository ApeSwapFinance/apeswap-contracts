## `ERC20Capped`



Extension of {ERC20} that adds a cap to the supply of tokens.


### `constructor(uint256 cap_)` (internal)



Sets the value of the `cap`. This value is immutable, it can only be
set once during construction.

### `cap() → uint256` (public)



Returns the cap on the token's total supply.

### `_mint(address account, uint256 amount)` (internal)



See {ERC20-_mint}.




