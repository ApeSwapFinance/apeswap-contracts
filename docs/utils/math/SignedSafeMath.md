## `SignedSafeMath`



Wrappers over Solidity's arithmetic operations.

NOTE: `SignedSafeMath` is no longer needed starting with Solidity 0.8. The compiler
now has built in overflow checking.


### `mul(int256 a, int256 b) → int256` (internal)



Returns the multiplication of two signed integers, reverting on
overflow.

Counterpart to Solidity's `*` operator.

Requirements:

- Multiplication cannot overflow.

### `div(int256 a, int256 b) → int256` (internal)



Returns the integer division of two signed integers. Reverts on
division by zero. The result is rounded towards zero.

Counterpart to Solidity's `/` operator.

Requirements:

- The divisor cannot be zero.

### `sub(int256 a, int256 b) → int256` (internal)



Returns the subtraction of two signed integers, reverting on
overflow.

Counterpart to Solidity's `-` operator.

Requirements:

- Subtraction cannot overflow.

### `add(int256 a, int256 b) → int256` (internal)



Returns the addition of two signed integers, reverting on
overflow.

Counterpart to Solidity's `+` operator.

Requirements:

- Addition cannot overflow.




