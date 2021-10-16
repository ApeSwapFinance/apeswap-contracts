//SPDX-License-Identifier: UNLICENSED
//ALL RIGHTS RESERVED
//apeswap.finance

pragma solidity ^0.8.0;

import "../../factory/Factory.sol";

contract FactoryMock is Factory {
    constructor(address _implementation) Factory(_implementation) {}

    function deployNewContract() external returns (address newContract) {
        return _deployNewContract();
    }
}