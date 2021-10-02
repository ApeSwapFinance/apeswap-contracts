## `SafeCast`



Wrappers over Solidity's uintXX/intXX casting operators with added overflow
checks.

Downcasting from uint256/int256 in Solidity does not revert on overflow. This can
easily result in undesired exploitation or bugs, since developers usually
assume that overflows raise errors. `SafeCast` restores this intuition by
reverting the transaction when such an operation overflows.

Using this library instead of the unchecked operations eliminates an entire
class of bugs, so it's recommended to use it always.

Can be combined with {SafeMath} and {SignedSafeMath} to extend it to smaller types, by performing
all math on `uint256` and `int256` and then downcasting.


### `toUint224(uint256 value) → uint224` (internal)



Returns the downcasted uint224 from uint256, reverting on
overflow (when the input is greater than largest uint224).

Counterpart to Solidity's `uint224` operator.

Requirements:

- input must fit into 224 bits

### `toUint128(uint256 value) → uint128` (internal)



Returns the downcasted uint128 from uint256, reverting on
overflow (when the input is greater than largest uint128).

Counterpart to Solidity's `uint128` operator.

Requirements:

- input must fit into 128 bits

### `toUint96(uint256 value) → uint96` (internal)



Returns the downcasted uint96 from uint256, reverting on
overflow (when the input is greater than largest uint96).

Counterpart to Solidity's `uint96` operator.

Requirements:

- input must fit into 96 bits

### `toUint64(uint256 value) → uint64` (internal)



Returns the downcasted uint64 from uint256, reverting on
overflow (when the input is greater than largest uint64).

Counterpart to Solidity's `uint64` operator.

Requirements:

- input must fit into 64 bits

### `toUint32(uint256 value) → uint32` (internal)



Returns the downcasted uint32 from uint256, reverting on
overflow (when the input is greater than largest uint32).

Counterpart to Solidity's `uint32` operator.

Requirements:

- input must fit into 32 bits

### `toUint16(uint256 value) → uint16` (internal)



Returns the downcasted uint16 from uint256, reverting on
overflow (when the input is greater than largest uint16).

Counterpart to Solidity's `uint16` operator.

Requirements:

- input must fit into 16 bits

### `toUint8(uint256 value) → uint8` (internal)



Returns the downcasted uint8 from uint256, reverting on
overflow (when the input is greater than largest uint8).

Counterpart to Solidity's `uint8` operator.

Requirements:

- input must fit into 8 bits.

### `toUint256(int256 value) → uint256` (internal)



Converts a signed int256 into an unsigned uint256.

Requirements:

- input must be greater than or equal to 0.

### `toInt128(int256 value) → int128` (internal)



Returns the downcasted int128 from int256, reverting on
overflow (when the input is less than smallest int128 or
greater than largest int128).

Counterpart to Solidity's `int128` operator.

Requirements:

- input must fit into 128 bits

_Available since v3.1._

### `toInt64(int256 value) → int64` (internal)



Returns the downcasted int64 from int256, reverting on
overflow (when the input is less than smallest int64 or
greater than largest int64).

Counterpart to Solidity's `int64` operator.

Requirements:

- input must fit into 64 bits

_Available since v3.1._

### `toInt32(int256 value) → int32` (internal)



Returns the downcasted int32 from int256, reverting on
overflow (when the input is less than smallest int32 or
greater than largest int32).

Counterpart to Solidity's `int32` operator.

Requirements:

- input must fit into 32 bits

_Available since v3.1._

### `toInt16(int256 value) → int16` (internal)



Returns the downcasted int16 from int256, reverting on
overflow (when the input is less than smallest int16 or
greater than largest int16).

Counterpart to Solidity's `int16` operator.

Requirements:

- input must fit into 16 bits

_Available since v3.1._

### `toInt8(int256 value) → int8` (internal)



Returns the downcasted int8 from int256, reverting on
overflow (when the input is less than smallest int8 or
greater than largest int8).

Counterpart to Solidity's `int8` operator.

Requirements:

- input must fit into 8 bits.

_Available since v3.1._

### `toInt256(uint256 value) → int256` (internal)



Converts an unsigned uint256 into a signed int256.

Requirements:

- input must be less than or equal to maxInt256.




