## `ERC1820Implementer`



Implementation of the {IERC1820Implementer} interface.

Contracts may inherit from this and call {_registerInterfaceForAddress} to
declare their willingness to be implementers.
{IERC1820Registry-setInterfaceImplementer} should then be called for the
registration to be complete.


### `canImplementInterfaceForAddress(bytes32 interfaceHash, address account) → bytes32` (public)



See {IERC1820Implementer-canImplementInterfaceForAddress}.

### `_registerInterfaceForAddress(bytes32 interfaceHash, address account)` (internal)



Declares the contract as willing to be an implementer of
`interfaceHash` for `account`.

See {IERC1820Registry-setInterfaceImplementer} and
{IERC1820Registry-interfaceHash}.




