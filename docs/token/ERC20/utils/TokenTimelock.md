## `TokenTimelock`



A token holder contract that will allow a beneficiary to extract the
tokens after a given release time.

Useful for simple vesting schedules like "advisors get all of their tokens
after 1 year".


### `constructor(contract IERC20 token_, address beneficiary_, uint256 releaseTime_)` (public)





### `token() → contract IERC20` (public)





### `beneficiary() → address` (public)





### `releaseTime() → uint256` (public)





### `release()` (public)

Transfers tokens held by timelock to beneficiary.






