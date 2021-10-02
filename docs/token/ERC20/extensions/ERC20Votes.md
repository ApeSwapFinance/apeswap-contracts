## `ERC20Votes`



Extension of ERC20 to support Compound-like voting and delegation. This version is more generic than Compound's,
and supports token supply up to 2^224^ - 1, while COMP is limited to 2^96^ - 1.

NOTE: If exact COMP compatibility is required, use the {ERC20VotesComp} variant of this module.

This extension keeps a history (checkpoints) of each account's vote power. Vote power can be delegated either
by calling the {delegate} function directly, or by providing a signature to be used with {delegateBySig}. Voting
power can be queried through the public accessors {getVotes} and {getPastVotes}.

By default, token balance does not account for voting power. This makes transfers cheaper. The downside is that it
requires users to delegate to themselves in order to activate checkpoints and have their voting power tracked.
Enabling self-delegation can easily be done by overriding the {delegates} function. Keep in mind however that this
will significantly increase the base gas cost of transfers.

_Available since v4.2._


### `checkpoints(address account, uint32 pos) → struct ERC20Votes.Checkpoint` (public)



Get the `pos`-th checkpoint for `account`.

### `numCheckpoints(address account) → uint32` (public)



Get number of checkpoints for `account`.

### `delegates(address account) → address` (public)



Get the address `account` is currently delegating to.

### `getVotes(address account) → uint256` (public)



Gets the current votes balance for `account`

### `getPastVotes(address account, uint256 blockNumber) → uint256` (public)



Retrieve the number of votes for `account` at the end of `blockNumber`.

Requirements:

- `blockNumber` must have been already mined

### `getPastTotalSupply(uint256 blockNumber) → uint256` (public)



Retrieve the `totalSupply` at the end of `blockNumber`. Note, this value is the sum of all balances.
It is but NOT the sum of all the delegated votes!

Requirements:

- `blockNumber` must have been already mined

### `delegate(address delegatee)` (public)



Delegate votes from the sender to `delegatee`.

### `delegateBySig(address delegatee, uint256 nonce, uint256 expiry, uint8 v, bytes32 r, bytes32 s)` (public)



Delegates votes from signer to `delegatee`

### `_maxSupply() → uint224` (internal)



Maximum token supply. Defaults to `type(uint224).max` (2^224^ - 1).

### `_mint(address account, uint256 amount)` (internal)



Snapshots the totalSupply after it has been increased.

### `_burn(address account, uint256 amount)` (internal)



Snapshots the totalSupply after it has been decreased.

### `_afterTokenTransfer(address from, address to, uint256 amount)` (internal)



Move voting power when tokens are transferred.

Emits a {DelegateVotesChanged} event.

### `_delegate(address delegator, address delegatee)` (internal)



Change delegation for `delegator` to `delegatee`.

Emits events {DelegateChanged} and {DelegateVotesChanged}.


### `DelegateChanged(address delegator, address fromDelegate, address toDelegate)`



Emitted when an account changes their delegate.

### `DelegateVotesChanged(address delegate, uint256 previousBalance, uint256 newBalance)`



Emitted when a token transfer or delegate change results in changes to an account's voting power.


### `Checkpoint`


uint32 fromBlock


uint224 votes



