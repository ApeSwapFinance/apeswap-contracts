## `ERC777PresetFixedSupply`



{ERC777} token, including:

 - Preminted initial supply
 - No access control mechanism (for minting/pausing) and hence no governance

_Available since v3.4._


### `constructor(string name, string symbol, address[] defaultOperators, uint256 initialSupply, address owner)` (public)



Mints `initialSupply` amount of token and transfers them to `owner`.

See {ERC777-constructor}.




