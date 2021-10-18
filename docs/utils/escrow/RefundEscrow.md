## `RefundEscrow`



Escrow that holds funds for a beneficiary, deposited from multiple
parties.
Intended usage: See {Escrow}. Same usage guidelines apply here.
The owner account (that is, the contract that instantiates this
contract) may deposit, close the deposit period, and allow for either
withdrawal by the beneficiary, or refunds to the depositors. All interactions
with `RefundEscrow` will be made through the owner contract.


### `constructor(address payable beneficiary_)` (public)



Constructor.


### `state() → enum RefundEscrow.State` (public)





### `beneficiary() → address payable` (public)





### `deposit(address refundee)` (public)



Stores funds that may later be refunded.


### `close()` (public)



Allows for the beneficiary to withdraw their funds, rejecting
further deposits.

### `enableRefunds()` (public)



Allows for refunds to take place, rejecting further deposits.

### `beneficiaryWithdraw()` (public)



Withdraws the beneficiary's funds.

### `withdrawalAllowed(address) → bool` (public)



Returns whether refundees can withdraw their deposits (be refunded). The overridden function receives a
'payee' argument, but we ignore it here since the condition is global, not per-payee.


### `RefundsClosed()`





### `RefundsEnabled()`







### `State`











