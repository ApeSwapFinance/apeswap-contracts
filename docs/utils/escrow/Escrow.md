## `Escrow`



Base escrow contract, holds funds designated for a payee until they
withdraw them.

Intended usage: This contract (and derived escrow contracts) should be a
standalone contract, that only interacts with the contract that instantiated
it. That way, it is guaranteed that all Ether will be handled according to
the `Escrow` rules, and there is no need to check for payable functions or
transfers in the inheritance tree. The contract that uses the escrow as its
payment method should be its owner, and provide public methods redirecting
to the escrow's deposit and withdraw.


### `depositsOf(address payee) → uint256` (public)





### `deposit(address payee)` (public)



Stores the sent amount as credit to be withdrawn.


### `withdraw(address payable payee)` (public)



Withdraw accumulated balance for a payee, forwarding all gas to the
recipient.

WARNING: Forwarding all gas opens the door to reentrancy vulnerabilities.
Make sure you trust the recipient, or are either following the
checks-effects-interactions pattern or using {ReentrancyGuard}.




### `Deposited(address payee, uint256 weiAmount)`





### `Withdrawn(address payee, uint256 weiAmount)`







