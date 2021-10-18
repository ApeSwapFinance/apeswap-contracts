## `IERC777`



Interface of the ERC777Token standard as defined in the EIP.

This contract uses the
https://eips.ethereum.org/EIPS/eip-1820[ERC1820 registry standard] to let
token holders and recipients react to token movements by using setting implementers
for the associated interfaces in said registry. See {IERC1820Registry} and
{ERC1820Implementer}.


### `name() → string` (external)



Returns the name of the token.

### `symbol() → string` (external)



Returns the symbol of the token, usually a shorter version of the
name.

### `granularity() → uint256` (external)



Returns the smallest part of the token that is not divisible. This
means all token operations (creation, movement and destruction) must have
amounts that are a multiple of this number.

For most token contracts, this value will equal 1.

### `totalSupply() → uint256` (external)



Returns the amount of tokens in existence.

### `balanceOf(address owner) → uint256` (external)



Returns the amount of tokens owned by an account (`owner`).

### `send(address recipient, uint256 amount, bytes data)` (external)



Moves `amount` tokens from the caller's account to `recipient`.

If send or receive hooks are registered for the caller and `recipient`,
the corresponding functions will be called with `data` and empty
`operatorData`. See {IERC777Sender} and {IERC777Recipient}.

Emits a {Sent} event.

Requirements

- the caller must have at least `amount` tokens.
- `recipient` cannot be the zero address.
- if `recipient` is a contract, it must implement the {IERC777Recipient}
interface.

### `burn(uint256 amount, bytes data)` (external)



Destroys `amount` tokens from the caller's account, reducing the
total supply.

If a send hook is registered for the caller, the corresponding function
will be called with `data` and empty `operatorData`. See {IERC777Sender}.

Emits a {Burned} event.

Requirements

- the caller must have at least `amount` tokens.

### `isOperatorFor(address operator, address tokenHolder) → bool` (external)



Returns true if an account is an operator of `tokenHolder`.
Operators can send and burn tokens on behalf of their owners. All
accounts are their own operator.

See {operatorSend} and {operatorBurn}.

### `authorizeOperator(address operator)` (external)



Make an account an operator of the caller.

See {isOperatorFor}.

Emits an {AuthorizedOperator} event.

Requirements

- `operator` cannot be calling address.

### `revokeOperator(address operator)` (external)



Revoke an account's operator status for the caller.

See {isOperatorFor} and {defaultOperators}.

Emits a {RevokedOperator} event.

Requirements

- `operator` cannot be calling address.

### `defaultOperators() → address[]` (external)



Returns the list of default operators. These accounts are operators
for all token holders, even if {authorizeOperator} was never called on
them.

This list is immutable, but individual holders may revoke these via
{revokeOperator}, in which case {isOperatorFor} will return false.

### `operatorSend(address sender, address recipient, uint256 amount, bytes data, bytes operatorData)` (external)



Moves `amount` tokens from `sender` to `recipient`. The caller must
be an operator of `sender`.

If send or receive hooks are registered for `sender` and `recipient`,
the corresponding functions will be called with `data` and
`operatorData`. See {IERC777Sender} and {IERC777Recipient}.

Emits a {Sent} event.

Requirements

- `sender` cannot be the zero address.
- `sender` must have at least `amount` tokens.
- the caller must be an operator for `sender`.
- `recipient` cannot be the zero address.
- if `recipient` is a contract, it must implement the {IERC777Recipient}
interface.

### `operatorBurn(address account, uint256 amount, bytes data, bytes operatorData)` (external)



Destroys `amount` tokens from `account`, reducing the total supply.
The caller must be an operator of `account`.

If a send hook is registered for `account`, the corresponding function
will be called with `data` and `operatorData`. See {IERC777Sender}.

Emits a {Burned} event.

Requirements

- `account` cannot be the zero address.
- `account` must have at least `amount` tokens.
- the caller must be an operator for `account`.


### `Sent(address operator, address from, address to, uint256 amount, bytes data, bytes operatorData)`





### `Minted(address operator, address to, uint256 amount, bytes data, bytes operatorData)`





### `Burned(address operator, address from, uint256 amount, bytes data, bytes operatorData)`





### `AuthorizedOperator(address operator, address tokenHolder)`





### `RevokedOperator(address operator, address tokenHolder)`







