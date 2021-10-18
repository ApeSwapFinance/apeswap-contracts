## `PaymentSplitter`



This contract allows to split Ether payments among a group of accounts. The sender does not need to be aware
that the Ether will be split in this way, since it is handled transparently by the contract.

The split can be in equal parts or in any other arbitrary proportion. The way this is specified is by assigning each
account to a number of shares. Of all the Ether that this contract receives, each account will then be able to claim
an amount proportional to the percentage of total shares they were assigned.

`PaymentSplitter` follows a _pull payment_ model. This means that payments are not automatically forwarded to the
accounts but kept in this contract, and the actual transfer is triggered as a separate step by calling the {release}
function.


### `constructor(address[] payees, uint256[] shares_)` (public)



Creates an instance of `PaymentSplitter` where each account in `payees` is assigned the number of shares at
the matching position in the `shares` array.

All addresses in `payees` must be non-zero. Both arrays must have the same non-zero length, and there must be no
duplicates in `payees`.

### `receive()` (external)



The Ether received will be logged with {PaymentReceived} events. Note that these events are not fully
reliable: it's possible for a contract to receive Ether without triggering this function. This only affects the
reliability of the events, and not the actual splitting of Ether.

To learn more about this see the Solidity documentation for
https://solidity.readthedocs.io/en/latest/contracts.html#fallback-function[fallback
functions].

### `totalShares() → uint256` (public)



Getter for the total shares held by payees.

### `totalReleased() → uint256` (public)



Getter for the total amount of Ether already released.

### `shares(address account) → uint256` (public)



Getter for the amount of shares held by an account.

### `released(address account) → uint256` (public)



Getter for the amount of Ether already released to a payee.

### `payee(uint256 index) → address` (public)



Getter for the address of the payee number `index`.

### `release(address payable account)` (public)



Triggers a transfer to `account` of the amount of Ether they are owed, according to their percentage of the
total shares and their previous withdrawals.


### `PayeeAdded(address account, uint256 shares)`





### `PaymentReleased(address to, uint256 amount)`





### `PaymentReceived(address from, uint256 amount)`







