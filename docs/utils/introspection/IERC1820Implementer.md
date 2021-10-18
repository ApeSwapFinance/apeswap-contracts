## `IERC1820Implementer`



Interface for an ERC1820 implementer, as defined in the
https://eips.ethereum.org/EIPS/eip-1820#interface-implementation-erc1820implementerinterface[EIP].
Used by contracts that will be registered as implementers in the
{IERC1820Registry}.


### `canImplementInterfaceForAddress(bytes32 interfaceHash, address account) → bytes32` (external)



Returns a special value (`ERC1820_ACCEPT_MAGIC`) if this contract
implements `interfaceHash` for `account`.

See {IERC1820Registry-setInterfaceImplementer}.




