## `ERC20Snapshot`



This contract extends an ERC20 token with a snapshot mechanism. When a snapshot is created, the balances and
total supply at the time are recorded for later access.

This can be used to safely create mechanisms based on token balances such as trustless dividends or weighted voting.
In naive implementations it's possible to perform a "double spend" attack by reusing the same balance from different
accounts. By using snapshots to calculate dividends or voting power, those attacks no longer apply. It can also be
used to create an efficient ERC20 forking mechanism.

Snapshots are created by the internal {_snapshot} function, which will emit the {Snapshot} event and return a
snapshot id. To get the total supply at the time of a snapshot, call the function {totalSupplyAt} with the snapshot
id. To get the balance of an account at the time of a snapshot, call the {balanceOfAt} function with the snapshot id
and the account address.

NOTE: Snapshot policy can be customized by overriding the {_getCurrentSnapshotId} method. For example, having it
return `block.number` will trigger the creation of snapshot at the begining of each new block. When overridding this
function, be careful about the monotonicity of its result. Non-monotonic snapshot ids will break the contract.

Implementing snapshots for every block using this method will incur significant gas costs. For a gas-efficient
alternative consider {ERC20Votes}.

==== Gas Costs

Snapshots are efficient. Snapshot creation is _O(1)_. Retrieval of balances or total supply from a snapshot is _O(log
n)_ in the number of snapshots that have been created, although _n_ for a specific account will generally be much
smaller since identical balances in subsequent snapshots are stored as a single entry.

There is a constant overhead for normal ERC20 transfers due to the additional snapshot bookkeeping. This overhead is
only significant for the first transfer that immediately follows a snapshot for a particular account. Subsequent
transfers will have normal cost until the next snapshot, and so on.


### `_snapshot() → uint256` (internal)



Creates a new snapshot and returns its snapshot id.

Emits a {Snapshot} event that contains the same id.

{_snapshot} is `internal` and you have to decide how to expose it externally. Its usage may be restricted to a
set of accounts, for example using {AccessControl}, or it may be open to the public.

[WARNING]
====
While an open way of calling {_snapshot} is required for certain trust minimization mechanisms such as forking,
you must consider that it can potentially be used by attackers in two ways.

First, it can be used to increase the cost of retrieval of values from snapshots, although it will grow
logarithmically thus rendering this attack ineffective in the long term. Second, it can be used to target
specific accounts and increase the cost of ERC20 transfers for them, in the ways specified in the Gas Costs
section above.

We haven't measured the actual numbers; if this is something you're interested in please reach out to us.
====

### `_getCurrentSnapshotId() → uint256` (internal)



Get the current snapshotId

### `balanceOfAt(address account, uint256 snapshotId) → uint256` (public)



Retrieves the balance of `account` at the time `snapshotId` was created.

### `totalSupplyAt(uint256 snapshotId) → uint256` (public)



Retrieves the total supply at the time `snapshotId` was created.

### `_beforeTokenTransfer(address from, address to, uint256 amount)` (internal)






### `Snapshot(uint256 id)`



Emitted by {_snapshot} when a snapshot identified by `id` is created.


### `Snapshots`


uint256[] ids


uint256[] values



