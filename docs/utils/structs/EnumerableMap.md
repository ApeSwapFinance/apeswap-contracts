## `EnumerableMap`



Library for managing an enumerable variant of Solidity's
https://solidity.readthedocs.io/en/latest/types.html#mapping-types[`mapping`]
type.

Maps have the following properties:

- Entries are added, removed, and checked for existence in constant time
(O(1)).
- Entries are enumerated in O(n). No guarantees are made on the ordering.

```
contract Example {
    // Add the library methods
    using EnumerableMap for EnumerableMap.UintToAddressMap;

    // Declare a set state variable
    EnumerableMap.UintToAddressMap private myMap;
}
```

As of v3.0.0, only maps of type `uint256 -> address` (`UintToAddressMap`) are
supported.


### `set(struct EnumerableMap.UintToAddressMap map, uint256 key, address value) → bool` (internal)



Adds a key-value pair to a map, or updates the value for an existing
key. O(1).

Returns true if the key was added to the map, that is if it was not
already present.

### `remove(struct EnumerableMap.UintToAddressMap map, uint256 key) → bool` (internal)



Removes a value from a set. O(1).

Returns true if the key was removed from the map, that is if it was present.

### `contains(struct EnumerableMap.UintToAddressMap map, uint256 key) → bool` (internal)



Returns true if the key is in the map. O(1).

### `length(struct EnumerableMap.UintToAddressMap map) → uint256` (internal)



Returns the number of elements in the map. O(1).

### `at(struct EnumerableMap.UintToAddressMap map, uint256 index) → uint256, address` (internal)



Returns the element stored at position `index` in the set. O(1).
Note that there are no guarantees on the ordering of values inside the
array, and it may change when more values are added or removed.

Requirements:

- `index` must be strictly less than {length}.

### `tryGet(struct EnumerableMap.UintToAddressMap map, uint256 key) → bool, address` (internal)



Tries to returns the value associated with `key`.  O(1).
Does not revert if `key` is not in the map.

_Available since v3.4._

### `get(struct EnumerableMap.UintToAddressMap map, uint256 key) → address` (internal)



Returns the value associated with `key`.  O(1).

Requirements:

- `key` must be in the map.

### `get(struct EnumerableMap.UintToAddressMap map, uint256 key, string errorMessage) → address` (internal)



Same as {get}, with a custom error message when `key` is not in the map.

CAUTION: This function is deprecated because it requires allocating memory for the error
message unnecessarily. For custom revert reasons use {tryGet}.



### `Map`


struct EnumerableSet.Bytes32Set _keys


mapping(bytes32 => bytes32) _values


### `UintToAddressMap`


struct EnumerableMap.Map _inner



