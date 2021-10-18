## `ERC1967Proxy`



This contract implements an upgradeable proxy. It is upgradeable because calls are delegated to an
implementation address that can be changed. This address is stored in storage in the location specified by
https://eips.ethereum.org/EIPS/eip-1967[EIP1967], so that it doesn't conflict with the storage layout of the
implementation behind the proxy.


### `constructor(address _logic, bytes _data)` (public)



Initializes the upgradeable proxy with an initial implementation specified by `_logic`.

If `_data` is nonempty, it's used as data in a delegate call to `_logic`. This will typically be an encoded
function call, and allows initializating the storage of the proxy like a Solidity constructor.

### `_implementation() → address impl` (internal)



Returns the current implementation address.




