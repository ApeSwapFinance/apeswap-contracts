// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.0;

import "../token/SweeperUpgradeable.sol";

contract SweeperUpgradeableMock is SweeperUpgradeable {
    constructor() {}

    function initializeSweeper() public initializer {
        address[] memory empty;
        initializeSweeper(empty, true);
    }

    receive() external payable {}
}
