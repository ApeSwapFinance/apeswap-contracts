// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.0;

/*
 * ApeSwapFinance
 * App:             https://apeswap.finance
 * Medium:          https://ape-swap.medium.com
 * Twitter:         https://twitter.com/ape_swap
 * Telegram:        https://t.me/ape_swap
 * Announcements:   https://t.me/ape_swap_news
 * GitHub:          https://github.com/ApeSwapFinance
 */

import "../utils/SweeperUpgradeable.sol";

contract SweeperUpgradeableMock is SweeperUpgradeable {
    constructor() {}

    function initializeSweeper() public initializer {
        address[] memory empty;
        initializeSweeper(empty, true);
    }

    receive() external payable {}
}
