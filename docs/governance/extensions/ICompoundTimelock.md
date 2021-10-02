## `ICompoundTimelock`

https://github.com/compound-finance/compound-protocol/blob/master/contracts/Timelock.sol[Compound's timelock] interface




### `receive()` (external)





### `GRACE_PERIOD() → uint256` (external)





### `MINIMUM_DELAY() → uint256` (external)





### `MAXIMUM_DELAY() → uint256` (external)





### `admin() → address` (external)





### `pendingAdmin() → address` (external)





### `delay() → uint256` (external)





### `queuedTransactions(bytes32) → bool` (external)





### `setDelay(uint256)` (external)





### `acceptAdmin()` (external)





### `setPendingAdmin(address)` (external)





### `queueTransaction(address target, uint256 value, string signature, bytes data, uint256 eta) → bytes32` (external)





### `cancelTransaction(address target, uint256 value, string signature, bytes data, uint256 eta)` (external)





### `executeTransaction(address target, uint256 value, string signature, bytes data, uint256 eta) → bytes` (external)








