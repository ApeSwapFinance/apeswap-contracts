// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../interfaces/IApeSwapPool.sol";

/// @title ApeSwapPoolManager
/// @author tikithedude@gmail.com
/// @notice Library responsible for handling IApeSwapPool pools
library ApeSwapPoolManager {
    /// @notice Deposit reward tokens into a pool
    /// @param _pool IApeSwapPool
    /// @param _rewardToken ERC20 token
    function depositRewards(IApeSwapPool _pool, IERC20 _rewardToken) public {
        // read harvested balance
        uint256 rewardBalance = _rewardToken.balanceOf(address(this));
        // make sure the pool has the proper allowance / approval
        _rewardToken.approve(address(_pool), rewardBalance);
        _pool.depositRewards(rewardBalance);
    }

    function harvest(IApeSwapPool _pool) public {
        // harvest
        _pool.withdraw(0);
    }

    function withdraw(IApeSwapPool _pool) public {
        // withdraw
        _pool.withdraw(0);
    }

    function deposit(IApeSwapPool _pool, uint256 _amount) public {
        // deposit
        _pool.deposit(_amount);
    }
}
