## `IApeSwapPool`

LP Staking Pool interface


see implementation at https://github.com/ApeSwapFinance/apeswap-pool-factory/blob/main/contracts/BEP20RewardApeV3.sol


### `setBonusEndBlock(uint256 _bonusEndBlock)` (external)





### `pendingReward(address _user) → uint256` (external)

View function to see pending Reward on frontend




### `depositRewards(uint256 _amount)` (external)





### `setRewardPerBlock(uint256 _rewardPerBlock)` (external)





### `skimStakeTokenFees()` (external)



Remove excess stake tokens earned by reflect fees

### `emergencyWithdraw()` (external)





### `emergencyRewardWithdraw(uint256 _amount)` (external)





### `sweepToken(contract IERC20 token)` (external)

A public function to sweep accidental BEP20 transfers to this contract.
  Tokens are sent to owner






### `PoolInfo`


contract IERC20 lpToken


uint256 allocPoint


uint256 lastRewardBlock


uint256 accRewardTokenPerShare


### `UserInfo`


uint256 amount


uint256 rewardDebt



