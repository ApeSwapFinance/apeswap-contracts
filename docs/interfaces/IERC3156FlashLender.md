## `IERC3156FlashLender`



Interface of the ERC3156 FlashLender, as defined in
https://eips.ethereum.org/EIPS/eip-3156[ERC-3156].

_Available since v4.1._


### `maxFlashLoan(address token) → uint256` (external)



The amount of currency available to be lended.


### `flashFee(address token, uint256 amount) → uint256` (external)



The fee to be charged for a given loan.


### `flashLoan(contract IERC3156FlashBorrower receiver, address token, uint256 amount, bytes data) → bool` (external)



Initiate a flash loan.





