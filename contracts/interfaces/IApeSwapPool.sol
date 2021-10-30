// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/// @title IApeSwapPool
/// @notice LP Staking Pool interface
/// @dev see implementation at https://github.com/ApeSwapFinance/apeswap-pool-factory/blob/main/contracts/BEP20RewardApeV3.sol
interface IApeSwapPool {
    /// @notice Pool info
    struct PoolInfo {
        IERC20 lpToken; // Address of LP token contract.
        uint256 allocPoint; // How many allocation points assigned to this pool. Rewards to distribute per block.
        uint256 lastRewardBlock; // Last block number that Rewards distribution occurs.
        uint256 accRewardTokenPerShare; // Accumulated Rewards per share, times 1e30. See below.
    }

    /// @notice User info
    struct UserInfo {
        uint256 amount; // How many LP tokens the user has provided.
        uint256 rewardDebt; // Reward debt. See explanation below.
    }

    /// @param  _bonusEndBlock The block when rewards will end
    function setBonusEndBlock(uint256 _bonusEndBlock) external;

    /// @notice View function to see pending Reward on frontend
    /// @param _user account address
    function pendingReward(address _user) external view returns (uint256);

    // Deposit Rewards into contract
    function depositRewards(uint256 _amount) external;

    /* Admin Functions */

    /// @param _rewardPerBlock The amount of reward tokens to be given per block
    function setRewardPerBlock(uint256 _rewardPerBlock) external;

    /// @dev Remove excess stake tokens earned by reflect fees
    function skimStakeTokenFees() external;

    // Withdraw without caring about rewards. EMERGENCY ONLY.
    function emergencyWithdraw() external;

    // Withdraw reward. EMERGENCY ONLY.
    function emergencyRewardWithdraw(uint256 _amount) external;

    /// @notice A public function to sweep accidental BEP20 transfers to this contract.
    ///   Tokens are sent to owner
    /// @param token The address of the BEP20 token to sweep
    function sweepToken(IERC20 token) external;
}
