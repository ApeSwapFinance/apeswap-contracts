## `ERC20Permit`



Implementation of the ERC20 Permit extension allowing approvals to be made via signatures, as defined in
https://eips.ethereum.org/EIPS/eip-2612[EIP-2612].

Adds the {permit} method, which can be used to change an account's ERC20 allowance (see {IERC20-allowance}) by
presenting a message signed by the account. By not relying on `{IERC20-approve}`, the token holder account doesn't
need to send a transaction, and thus is not required to hold Ether at all.

_Available since v3.4._


### `constructor(string name)` (internal)



Initializes the {EIP712} domain separator using the `name` parameter, and setting `version` to `"1"`.

It's a good idea to use the same `name` that is defined as the ERC20 token name.

### `permit(address owner, address spender, uint256 value, uint256 deadline, uint8 v, bytes32 r, bytes32 s)` (public)



See {IERC20Permit-permit}.

### `nonces(address owner) → uint256` (public)



See {IERC20Permit-nonces}.

### `DOMAIN_SEPARATOR() → bytes32` (external)



See {IERC20Permit-DOMAIN_SEPARATOR}.

### `_useNonce(address owner) → uint256 current` (internal)



"Consume a nonce": return the current value and increment.

_Available since v4.1._




