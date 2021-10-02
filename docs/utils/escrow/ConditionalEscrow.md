## `ConditionalEscrow`



Base abstract escrow to only allow withdrawal if a condition is met.
Intended usage: See {Escrow}. Same usage guidelines apply here.


### `withdrawalAllowed(address payee) → bool` (public)



Returns whether an address is allowed to withdraw their funds. To be
implemented by derived contracts.


### `withdraw(address payable payee)` (public)








