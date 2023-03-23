// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.0;

/*
  ______                     ______                                 
 /      \                   /      \                                
|  ▓▓▓▓▓▓\ ______   ______ |  ▓▓▓▓▓▓\__   __   __  ______   ______  
| ▓▓__| ▓▓/      \ /      \| ▓▓___\▓▓  \ |  \ |  \|      \ /      \ 
| ▓▓    ▓▓  ▓▓▓▓▓▓\  ▓▓▓▓▓▓\\▓▓    \| ▓▓ | ▓▓ | ▓▓ \▓▓▓▓▓▓\  ▓▓▓▓▓▓\
| ▓▓▓▓▓▓▓▓ ▓▓  | ▓▓ ▓▓    ▓▓_\▓▓▓▓▓▓\ ▓▓ | ▓▓ | ▓▓/      ▓▓ ▓▓  | ▓▓
| ▓▓  | ▓▓ ▓▓__/ ▓▓ ▓▓▓▓▓▓▓▓  \__| ▓▓ ▓▓_/ ▓▓_/ ▓▓  ▓▓▓▓▓▓▓ ▓▓__/ ▓▓
| ▓▓  | ▓▓ ▓▓    ▓▓\▓▓     \\▓▓    ▓▓\▓▓   ▓▓   ▓▓\▓▓    ▓▓ ▓▓    ▓▓
 \▓▓   \▓▓ ▓▓▓▓▓▓▓  \▓▓▓▓▓▓▓ \▓▓▓▓▓▓  \▓▓▓▓▓\▓▓▓▓  \▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓ 
         | ▓▓                                             | ▓▓      
         | ▓▓                                             | ▓▓      
          \▓▓                                              \▓▓         
 * App:             https://ApeSwap.finance
 * Medium:          https://ape-swap.medium.com
 * Twitter:         https://twitter.com/ape_swap
 * Telegram:        https://t.me/ape_swap
 * Announcements:   https://t.me/ape_swap_news
 * Discord:         https://discord.com/ApeSwap
 * Reddit:          https://reddit.com/r/ApeSwap
 * Instagram:       https://instagram.com/ApeSwap.finance
 * GitHub:          https://github.com/ApeSwapFinance
 */

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

    function withdraw(IApeSwapPool _pool, uint256 _amount) public {
        // withdraw
        _pool.withdraw(_amount);
    }

    function deposit(IApeSwapPool _pool, uint256 _amount) public {
        // deposit
        _pool.deposit(_amount);
    }
}
