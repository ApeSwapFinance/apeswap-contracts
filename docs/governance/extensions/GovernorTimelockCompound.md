## `GovernorTimelockCompound`



Extension of {Governor} that binds the execution process to a Compound Timelock. This adds a delay, enforced by
the external timelock to all successful proposal (in addition to the voting duration). The {Governor} needs to be
the admin of the timelock for any operation to be performed. A public, unrestricted,
{GovernorTimelockCompound-__acceptAdmin} is available to accept ownership of the timelock.

Using this model means the proposal will be operated by the {TimelockController} and not by the {Governor}. Thus,
the assets and permissions must be attached to the {TimelockController}. Any asset sent to the {Governor} will be
inaccessible.

_Available since v4.3._


### `constructor(contract ICompoundTimelock timelockAddress)` (internal)



Set the timelock.

### `supportsInterface(bytes4 interfaceId) → bool` (public)



See {IERC165-supportsInterface}.

### `state(uint256 proposalId) → enum IGovernor.ProposalState` (public)



Overriden version of the {Governor-state} function with added support for the `Queued` and `Expired` status.

### `timelock() → address` (public)



Public accessor to check the address of the timelock

### `proposalEta(uint256 proposalId) → uint256` (public)



Public accessor to check the eta of a queued proposal

### `queue(address[] targets, uint256[] values, bytes[] calldatas, bytes32 descriptionHash) → uint256` (public)



Function to queue a proposal to the timelock.

### `_execute(uint256 proposalId, address[] targets, uint256[] values, bytes[] calldatas, bytes32)` (internal)



Overriden execute function that run the already queued proposal through the timelock.

### `_cancel(address[] targets, uint256[] values, bytes[] calldatas, bytes32 descriptionHash) → uint256` (internal)



Overriden version of the {Governor-_cancel} function to cancel the timelocked proposal if it as already
been queued.

### `_executor() → address` (internal)



Address through which the governor executes action. In this case, the timelock.

### `__acceptAdmin()` (public)



Accept admin right over the timelock.

### `updateTimelock(contract ICompoundTimelock newTimelock)` (external)



Public endpoint to update the underlying timelock instance. Restricted to the timelock itself, so updates
must be proposed, scheduled and executed using the {Governor} workflow.

For security reason, the timelock must be handed over to another admin before setting up a new one. The two
operations (hand over the timelock) and do the update can be batched in a single proposal.

Note that if the timelock admin has been handed over in a previous operation, we refuse updates made through the
timelock if admin of the timelock has already been accepted and the operation is executed outside the scope of
governance.


### `TimelockChange(address oldTimelock, address newTimelock)`



Emitted when the timelock controller used for proposal execution is modified.


### `ProposalTimelock`


struct Timers.Timestamp timer



