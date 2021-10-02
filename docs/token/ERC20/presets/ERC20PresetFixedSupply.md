## `ERC20PresetFixedSupply`



{ERC20} token, including:

 - Preminted initial supply
 - Ability for holders to burn (destroy) their tokens
 - No access control mechanism (for minting/pausing) and hence no governance

This contract uses {ERC20Burnable} to include burn capabilities - head to
its documentation for details.

_Available since v3.4._


### `constructor(string name, string symbol, uint256 initialSupply, address owner)` (public)



Mints `initialSupply` amount of token and transfers them to `owner`.

See {ERC20-constructor}.




