## `StorageSlot`



Library for reading and writing primitive types to specific storage slots.

Storage slots are often used to avoid storage conflict when dealing with upgradeable contracts.
This library helps with reading and writing to such slots without the need for inline assembly.

The functions in this library return Slot structs that contain a `value` member that can be used to read or write.

Example usage to set ERC1967 implementation slot:
```
contract ERC1967 {
    bytes32 internal constant _IMPLEMENTATION_SLOT = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;

    function _getImplementation() internal view returns (address) {
        return StorageSlot.getAddressSlot(_IMPLEMENTATION_SLOT).value;
    }

    function _setImplementation(address newImplementation) internal {
        require(Address.isContract(newImplementation), "ERC1967: new implementation is not a contract");
        StorageSlot.getAddressSlot(_IMPLEMENTATION_SLOT).value = newImplementation;
    }
}
```

_Available since v4.1 for `address`, `bool`, `bytes32`, and `uint256`._


### `getAddressSlot(bytes32 slot) → struct StorageSlot.AddressSlot r` (internal)



Returns an `AddressSlot` with member `value` located at `slot`.

### `getBooleanSlot(bytes32 slot) → struct StorageSlot.BooleanSlot r` (internal)



Returns an `BooleanSlot` with member `value` located at `slot`.

### `getBytes32Slot(bytes32 slot) → struct StorageSlot.Bytes32Slot r` (internal)



Returns an `Bytes32Slot` with member `value` located at `slot`.

### `getUint256Slot(bytes32 slot) → struct StorageSlot.Uint256Slot r` (internal)



Returns an `Uint256Slot` with member `value` located at `slot`.



### `AddressSlot`


address value


### `BooleanSlot`


bool value


### `Bytes32Slot`


bytes32 value


### `Uint256Slot`


uint256 value



