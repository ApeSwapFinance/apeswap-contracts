// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../access/Ownable.sol";
import "../token/ERC20/IERC20.sol";

/**
 * @dev Sweep any ERC20 token.
 * Sometimes people accidentally send tokens to a contract without any way to retrieve them.
 * This contract makes sure any erc20 tokens can be removed from the contract.
 */
contract Sweeper is Ownable {

    event SweepWithdraw(
        address indexed receiver,
        IERC20 indexed token,
        uint256 balance
    );

    /**
     * @dev Transfers erc20 tokens to owner
     * Only owner of contract can call this function
     */
    function sweepToken(IERC20 token) external onlyOwner {
        uint256 balance = token.balanceOf(address(this));
        token.transfer(msg.sender, balance);
        emit SweepWithdraw(msg.sender, token, balance);
    }
}
