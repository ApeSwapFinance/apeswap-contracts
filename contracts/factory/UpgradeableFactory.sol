//SPDX-License-Identifier: UNLICENSED
//ALL RIGHTS RESERVED
//apeswap.finance

pragma solidity ^0.8.0;

import "./Factory.sol";
import "../proxy/Clones.sol";
import "../proxy/transparent/TransparentUpgradeableProxy.sol";
import "../access/Ownable.sol";

/*
 * ApeSwapFinance
 * App:             https://apeswap.finance
 * Medium:          https://ape-swap.medium.com
 * Twitter:         https://twitter.com/ape_swap
 * Telegram:        https://t.me/ape_swap
 * Announcements:   https://t.me/ape_swap_news
 * GitHub:          https://github.com/ApeSwapFinance
 */

/**
* @dev Standardized Apeswap Upgrade Factory.
* Extension of Clone Factory
*/ 
contract UpgradeableFactory is Factory {
    address public proxyAdmin;

    constructor(address _implementation, address _admin) Factory(_implementation) {
        proxyAdmin = _admin;
    }

    /**
    * @dev deploy new contract of active implementation
    */
    function deployNewContract() external override onlyOwner returns (address newContract) {
        TransparentUpgradeableProxy newProxy = new TransparentUpgradeableProxy(address(implementations[contractVersion]), proxyAdmin, '');
        newContract = address(newProxy);
        contracts.push(newContract);
        emit ContractDeployed(newContract);
    }
}