## `IApeSwapPool`

An LP Staking pool contract that allows users to stake tokens and earn rewards, and can mint BEP20 tokens.


see implementation at https://github.com/ApeSwapFinance/apeswap-pool-factory/blob/main/contracts/BEP20RewardApeV3.sol


### `STAKE_TOKEN() → contract IERC20` (external)





### `REWARD_TOKEN() → contract IERC20` (external)





### `getMultiplier(uint256 _from, uint256 _to) → uint256` (external)

Return reward multiplier over the given _from to _to block.



### `setBonusEndBlock(uint256 _bonusEndBlock)` (external)





### `pendingReward(address _user) → uint256` (external)

View function to see pending Reward on frontend




### `updatePool()` (external)





### `deposit(uint256 _amount)` (external)

Deposit staking token into the contract to earn rewards.


Since this contract needs to be supplied with rewards we are sending the balance of the contract if the pending rewards are higher

### `withdraw(uint256 _amount)` (external)

Withdraw rewards and/or staked tokens. Pass a 0 amount to withdraw only rewards




### `rewardBalance() → uint256` (external)

Obtain the reward balance of this contract




### `depositRewards(uint256 _amount)` (external)

Deposit Rewards into contract



### `totalStakeTokenBalance() → uint256` (external)

Obtain the stake balance of this contract



### `getStakeTokenFeeBalance() → uint256` (external)

Obtain the stake token fees (if any) earned by reflect token



### `setRewardPerBlock(uint256 _rewardPerBlock)` (external)





### `skimStakeTokenFees()` (external)



Remove excess stake tokens earned by reflect fees

### `emergencyWithdraw()` (external)





### `emergencyRewardWithdraw(uint256 _amount)` (external)





### `sweepToken(contract IERC20 token)` (external)

A public function to sweep accidental BEP20 transfers to this contract.
  Tokens are sent to owner






### `UserInfo`


uint256 amount


uint256 rewardDebt


### `PoolInfo`


contract IERC20 lpToken


uint256 allocPoint


uint256 lastRewardBlock


uint256 accRewardTokenPerShare



