## `IMasterApe`

Farm factory. Responsible for minting BANANAs and distributing them as rewards to each farm.


see implementation at https://github.com/ApeSwapFinance/apeswap-banana-farm/blob/feature/masterape-admin/contracts/MasterApe.sol
should be kept in sync with https://github.com/ApeSwapFinance/apeswap-banana-farm/blob/feature/masterape-admin/contracts/interfaces/IMasterApe.sol .
what would be best is to explicitly declare the relation between the contract and its interface


### `transferOwnership(address newOwner)` (external)





### `updateMultiplier(uint256 multiplierNumber)` (external)





### `add(uint256 _allocPoint, address _lpToken, bool _withUpdate)` (external)

Add a new lp to the pool. Can only be called by the owner.


DO NOT add the same LP token more than once. Rewards will be messed up if you do.

### `set(uint256 _pid, uint256 _allocPoint, bool _withUpdate)` (external)

Update the given pool's reward token allocation point. Can only be called by the owner.



### `poolLength() → uint256` (external)





### `checkPoolDuplicate(address _lpToken)` (external)





### `getMultiplier(uint256 _from, uint256 _to) → uint256` (external)

Return reward multiplier over the given _from to _to block.



### `pendingCake(uint256 _pid, address _user) → uint256` (external)

return amount of reward tokens from a given pool id at a given user account




### `massUpdatePools()` (external)

Update reward variables for all pools. Be careful of gas spending!



### `updatePool(uint256 _pid)` (external)





### `deposit(uint256 _pid, uint256 _amount)` (external)

Deposit LP tokens to IMasterApe for BANANA allocation.



### `withdraw(uint256 _pid, uint256 _amount)` (external)

Withdraw LP tokens from IMasterChef



### `enterStaking(uint256 _amount)` (external)

Stake BANANA tokens to IMasterChef



### `leaveStaking(uint256 _amount)` (external)

Withdraw BANANA tokens from STAKING.



### `emergencyWithdraw(uint256 _pid)` (external)

Withdraw without caring about rewards. EMERGENCY ONLY.



### `getPoolInfo(uint256 _pid) → address lpToken, uint256 allocPoint, uint256 lastRewardBlock, uint256 accCakePerShare` (external)





### `dev(address _devaddr)` (external)





### `userInfo(uint256 _pid, address _user) → struct IMasterApe.UserInfo` (external)







### `PoolInfo`


address lpToken


uint256 allocPoint


uint256 lastRewardBlock


uint256 accCakePerShare


### `UserInfo`


uint256 amount


uint256 rewardDebt



