## `SupportsInterfaceWithLookupMock`

https://eips.ethereum.org/EIPS/eip-214#specification
From the specification:
> Any attempts to make state-changing operations inside an execution instance with STATIC set to true will instead
throw an exception.
> These operations include [...], LOG0, LOG1, LOG2, [...]

therefore, because this contract is staticcall'd we need to not emit events (which is how solidity-coverage works)
solidity-coverage ignores the /mocks folder, so we duplicate its implementation here to avoid instrumenting it




### `constructor()` (public)



A contract implementing SupportsInterfaceWithLookup
implement ERC165 itself.

### `supportsInterface(bytes4 interfaceId) → bool` (public)



Implement supportsInterface(bytes4) using a lookup table.

### `_registerInterface(bytes4 interfaceId)` (internal)



Private method for registering an interface.




