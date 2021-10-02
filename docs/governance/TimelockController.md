## `TimelockController`



Contract module which acts as a timelocked controller. When set as the
owner of an `Ownable` smart contract, it enforces a timelock on all
`onlyOwner` maintenance operations. This gives time for users of the
controlled contract to exit before a potentially dangerous maintenance
operation is applied.

By default, this contract is self administered, meaning administration tasks
have to go through the timelock process. The proposer (resp executor) role
is in charge of proposing (resp executing) operations. A common use case is
to position this {TimelockController} as the owner of a smart contract, with
a multisig or a DAO as the sole proposer.

_Available since v3.3._

### `onlyRoleOrOpenRole(bytes32 role)`



Modifier to make a function callable only by a certain role. In
addition to checking the sender's role, `address(0)` 's role is also
considered. Granting a role to `address(0)` is equivalent to enabling
this role for everyone.


### `constructor(uint256 minDelay, address[] proposers, address[] executors)` (public)



Initializes the contract with a given `minDelay`.

### `receive()` (external)



Contract might receive/hold ETH as part of the maintenance process.

### `isOperation(bytes32 id) → bool pending` (public)



Returns whether an id correspond to a registered operation. This
includes both Pending, Ready and Done operations.

### `isOperationPending(bytes32 id) → bool pending` (public)



Returns whether an operation is pending or not.

### `isOperationReady(bytes32 id) → bool ready` (public)



Returns whether an operation is ready or not.

### `isOperationDone(bytes32 id) → bool done` (public)



Returns whether an operation is done or not.

### `getTimestamp(bytes32 id) → uint256 timestamp` (public)



Returns the timestamp at with an operation becomes ready (0 for
unset operations, 1 for done operations).

### `getMinDelay() → uint256 duration` (public)



Returns the minimum delay for an operation to become valid.

This value can be changed by executing an operation that calls `updateDelay`.

### `hashOperation(address target, uint256 value, bytes data, bytes32 predecessor, bytes32 salt) → bytes32 hash` (public)



Returns the identifier of an operation containing a single
transaction.

### `hashOperationBatch(address[] targets, uint256[] values, bytes[] datas, bytes32 predecessor, bytes32 salt) → bytes32 hash` (public)



Returns the identifier of an operation containing a batch of
transactions.

### `schedule(address target, uint256 value, bytes data, bytes32 predecessor, bytes32 salt, uint256 delay)` (public)



Schedule an operation containing a single transaction.

Emits a {CallScheduled} event.

Requirements:

- the caller must have the 'proposer' role.

### `scheduleBatch(address[] targets, uint256[] values, bytes[] datas, bytes32 predecessor, bytes32 salt, uint256 delay)` (public)



Schedule an operation containing a batch of transactions.

Emits one {CallScheduled} event per transaction in the batch.

Requirements:

- the caller must have the 'proposer' role.

### `cancel(bytes32 id)` (public)



Cancel an operation.

Requirements:

- the caller must have the 'proposer' role.

### `execute(address target, uint256 value, bytes data, bytes32 predecessor, bytes32 salt)` (public)



Execute an (ready) operation containing a single transaction.

Emits a {CallExecuted} event.

Requirements:

- the caller must have the 'executor' role.

### `executeBatch(address[] targets, uint256[] values, bytes[] datas, bytes32 predecessor, bytes32 salt)` (public)



Execute an (ready) operation containing a batch of transactions.

Emits one {CallExecuted} event per transaction in the batch.

Requirements:

- the caller must have the 'executor' role.

### `updateDelay(uint256 newDelay)` (external)



Changes the minimum timelock duration for future operations.

Emits a {MinDelayChange} event.

Requirements:

- the caller must be the timelock itself. This can only be achieved by scheduling and later executing
an operation where the timelock is the target and the data is the ABI-encoded call to this function.


### `CallScheduled(bytes32 id, uint256 index, address target, uint256 value, bytes data, bytes32 predecessor, uint256 delay)`



Emitted when a call is scheduled as part of operation `id`.

### `CallExecuted(bytes32 id, uint256 index, address target, uint256 value, bytes data)`



Emitted when a call is performed as part of operation `id`.

### `Cancelled(bytes32 id)`



Emitted when operation `id` is cancelled.

### `MinDelayChange(uint256 oldDuration, uint256 newDuration)`



Emitted when the minimum delay for future operations is modified.



