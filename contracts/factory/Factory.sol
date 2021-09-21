//SPDX-License-Identifier: UNLICENSED
//ALL RIGHTS RESERVED
//apeswap.finance

pragma solidity ^0.8.0;

import "../proxy/Clones.sol";
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
* @dev Standardized Apeswap factory
*/ 
contract Factory is Ownable {
    address[] public contracts;
    address[] public implementations;
    uint256 public version = 0;

    event ContractDeployed(address contractAddress);
    event PushImplementation(
        address indexed newImplementation,
        uint256 versionId
    );
    event UpdateImplementation(uint256 previousVersion, uint256 newVersion);

    constructor(address _implementation) {
        pushImplementation(_implementation);
    }

    /**
    * @dev deploy new contract of active implementation
    */
    function deployNew() external onlyOwner returns (address newContract) {
        newContract = Clones.clone(address(implementations[version]));
        contracts.push(newContract);
        emit ContractDeployed(newContract);
    }

    /**
    * @dev Get amount of deployed contracts
    */ 
    function getLength() external view returns (uint256) {
        return contracts.length;
    }

    /**
    * @dev Get all deployed contract addresses
    */ 
    function getAll() external view returns (address[] memory) {
        return contracts;
    }

    /**
    * @dev Pagination function for deployed contract addresses. Slicing contracts
    */ 
    function getSome(uint256 _index, uint256 _amount) external view returns (address[] memory) {
        require(
            _index < contracts.length,
            "Out of bounds"
        );
        require(
            _amount > 0,
            "Should at least get 1"
        );
        _amount = _index + _amount > contracts.length - 1 ? contracts.length - _index : _amount;

        address[] memory slicedContracts = new address[](_amount);
        for(uint256 i; i < _amount; i++){
            slicedContracts[i] = contracts[_index+i];
        }
        return slicedContracts;
    }

    /**
    * @dev Get single deployed contract address based on index
    */ 
    function getAtIndex(uint256 _index) external view returns (address) {
        require(
            _index < contracts.length,
            "Out of bounds"
        );
        return contracts[_index];
    }

    /**
    * @dev Returns current active implementation address
    */ 
    function activeImplementation() public view returns (address) {
        return implementations[version];
    }

    /**
    * @dev Add and use new implemetation
    */ 
    function pushImplementation(address _newImplementation) public onlyOwner {
        implementations.push(_newImplementation);
        version = implementations.length - 1;
        emit PushImplementation(_newImplementation, version);
    }

    /**
    * @dev Change active implemetation
    */ 
    function setImplementation(uint256 _index) external onlyOwner {
        require(
            _index < implementations.length,
            "version out of bounds"
        );
        uint256 previousVersion = version;
        version = _index;
        emit UpdateImplementation(previousVersion, version);
    }
}