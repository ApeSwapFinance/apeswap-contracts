// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.0;

import "../token/Sweeper.sol";

contract SweeperMock is Sweeper {
    address[] empty;

    constructor() Sweeper(empty, true) {}

    receive() external payable {}
}
