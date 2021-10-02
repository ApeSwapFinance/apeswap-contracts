## `ERC20FlashMint`



Implementation of the ERC3156 Flash loans extension, as defined in
https://eips.ethereum.org/EIPS/eip-3156[ERC-3156].

Adds the {flashLoan} method, which provides flash loan support at the token
level. By default there is no fee, but this can be changed by overriding {flashFee}.

_Available since v4.1._


### `maxFlashLoan(address token) → uint256` (public)



Returns the maximum amount of tokens available for loan.


### `flashFee(address token, uint256 amount) → uint256` (public)



Returns the fee applied when doing flash loans. By default this
implementation has 0 fees. This function can be overloaded to make
the flash loan mechanism deflationary.


### `flashLoan(contract IERC3156FlashBorrower receiver, address token, uint256 amount, bytes data) → bool` (public)



Performs a flash loan. New tokens are minted and sent to the
`receiver`, who is required to implement the {IERC3156FlashBorrower}
interface. By the end of the flash loan, the receiver is expected to own
amount + fee tokens and have them approved back to the token contract itself so
they can be burned.





