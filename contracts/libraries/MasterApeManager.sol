// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "../interfaces/IMasterApe.sol";

/// @title Library responsible for handling IMasterApe farms
/// @author tikithedude@gmail.com
/// @notice use this contract to handle any operational workflow related with IMasterApe contracts
library MasterApeManager {
    using SafeERC20 for IERC20;

    /// @notice Retrieve a farm's pending banana
    /// @param _farm MasterApe farm
    /// @param _pid pool Id
    /// @return pool's pending banana
    function getFarmPendingBanana(IMasterApe _farm, uint256 _pid) public view returns (uint256) {
        return _farm.pendingCake(_pid, address(this));
    }

    /// @notice Move a stake tokens from senders account into a MasterApe farm
    /// @param _farm MasterApe farm
    /// @param _pid pool Id
    function farmDeposit(IMasterApe _farm, uint256 _pid) public returns (uint256) {
        (address lpToken, , , ) = _farm.getPoolInfo(_pid);
        IERC20 stakeToken = IERC20(lpToken);
        uint256 balance = stakeToken.balanceOf(address(this));
        stakeToken.safeIncreaseAllowance(address(_farm), balance);
        _farm.deposit(_pid, balance);
        return balance;
    }

    /// @notice Withdraw farm stakeToken balance
    /// @param farm MasterApe
    /// @param pid a pool id
    function farmWithdraw(IMasterApe farm, uint256 pid) public returns (uint256) {
        //uint256 balance = farm.pendingCake(pid, address(this));
        uint256 amount = farm.userInfo(pid, address(this)).amount;
        // withdraw all tokens
        farm.withdraw(pid, amount);
        return amount;
    }

    /// @notice Harvest farm rewards
    /// @param _farm MasterApe farm
    /// @param _pid pool Id
    function farmHarvest(IMasterApe _farm, uint256 _pid) public {
        // deposit 0 will harvest tokens
        _farm.deposit(_pid, 0);
    }
}
