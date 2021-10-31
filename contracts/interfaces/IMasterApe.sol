// SPDX-License-Identifier: MIT
pragma experimental ABIEncoderV2;
pragma solidity ^0.8.0;

/// @title IMasterApe
/// @notice Farm factory. Responsible for minting BANANAs and distributing them as rewards to each farm.
/// @dev see implementation at https://github.com/ApeSwapFinance/apeswap-banana-farm/blob/feature/masterape-admin/contracts/MasterApe.sol
/// @dev should be kept in sync with https://github.com/ApeSwapFinance/apeswap-banana-farm/blob/feature/masterape-admin/contracts/interfaces/IMasterApe.sol .
/// @dev what would be best is to explicitly declare the relation between the contract and its interface
interface IMasterApe {
    /// @notice Pool info
    struct PoolInfo {
        address lpToken; // Address of LP token contract.
        uint256 allocPoint; // How many allocation points assigned to this pool. BANANAs to distribute per block.
        uint256 lastRewardBlock; // Last block number that BANANAs distribution occurs.
        uint256 accCakePerShare; // Accumulated BANANAs per share, times 1e12. See below.
    }

    // Info of each user.
    struct UserInfo {
        uint256 amount; // How many LP tokens the user has provided.
        uint256 rewardDebt; // Reward debt. See explanation below.
        //
        // We do some fancy math here. Basically, any point in time, the amount of BANANAs
        // entitled to a user but is pending to be distributed is:
        //
        //   pending reward = (user.amount * pool.accBananaPerShare) - user.rewardDebt
        //
        // Whenever a user deposits or withdraws LP tokens to a pool. Here's what happens:
        //   1. The pool's `accCakePerShare` (and `lastRewardBlock`) gets updated.
        //   2. User receives the pending reward sent to his/her address.
        //   3. User's `amount` gets updated.
        //   4. User's `rewardDebt` gets updated.
    }

    function transferOwnership(address newOwner) external; // from Ownable.sol

    function updateMultiplier(uint256 multiplierNumber) external; // onlyOwner

    /// @notice Add a new lp to the pool. Can only be called by the owner.
    /// @dev DO NOT add the same LP token more than once. Rewards will be messed up if you do.
    function add(
        uint256 _allocPoint,
        address _lpToken,
        bool _withUpdate
    ) external; // onlyOwner

    /// @notice Update the given pool's reward token allocation point. Can only be called by the owner.
    function set(
        uint256 _pid,
        uint256 _allocPoint,
        bool _withUpdate
    ) external; // onlyOwner

    function poolLength() external view returns (uint256);

    function checkPoolDuplicate(address _lpToken) external view;

    /// @notice Return reward multiplier over the given _from to _to block.
    function getMultiplier(uint256 _from, uint256 _to) external view returns (uint256);

    /// @notice return amount of reward tokens from a given pool id at a given user account
    /// @param _pid pool id
    /// @param _user account address
    function pendingCake(uint256 _pid, address _user) external view returns (uint256);

    /// @notice Update reward variables for all pools. Be careful of gas spending!
    function massUpdatePools() external;

    function updatePool(uint256 _pid) external; // validatePool(_pid);

    /// @notice Deposit LP tokens to IMasterApe for BANANA allocation.
    function deposit(uint256 _pid, uint256 _amount) external; // validatePool(_pid);

    /// @notice Withdraw LP tokens from IMasterChef
    function withdraw(uint256 _pid, uint256 _amount) external; // validatePool(_pid);

    /// @notice Stake BANANA tokens to IMasterChef
    function enterStaking(uint256 _amount) external;

    /// @notice Withdraw BANANA tokens from STAKING.
    function leaveStaking(uint256 _amount) external;

    /// @notice Withdraw without caring about rewards. EMERGENCY ONLY.
    function emergencyWithdraw(uint256 _pid) external;

    function getPoolInfo(uint256 _pid)
        external
        view
        returns (
            address lpToken,
            uint256 allocPoint,
            uint256 lastRewardBlock,
            uint256 accCakePerShare
        );

    function dev(address _devaddr) external;

    function userInfo(uint256 _pid, address _user) external view returns (UserInfo memory);
}
