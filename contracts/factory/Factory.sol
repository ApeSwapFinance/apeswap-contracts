//SPDX-License-Identifier: UNLICENSED
//ALL RIGHTS RESERVED
//apeswap.finance

pragma solidity ^0.8.0;

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
* @dev Standardized Apeswap Clone Factory
*/ 
contract Factory is Ownable {
    address[] public contracts;
    address[] public implementations;
    uint256 public contractVersion = 0;

    event ContractDeployed(address contractAddress);
    event PushImplementationContract(
        address indexed newImplementation,
        uint256 versionId
    );
    event UpdateImplementationContract(uint256 previousVersion, uint256 newVersion);

    constructor(address _implementation) {
        pushImplementationContract(_implementation);
    }

    /**
    * @dev deploy new contract of active implementation
    */
    function _deployNewContract() internal virtual returns (address newContract) {
        newContract = Clones.clone(address(implementations[contractVersion]));
        contracts.push(newContract);
        emit ContractDeployed(newContract);
    }

    /**
    * @dev Get amount of deployed contracts
    */ 
    function getLengthContracts() external view returns (uint256) {
        return contracts.length;
    }

    /**
    * @dev Get all deployed contract addresses
    */ 
    function getAllContracts() external view returns (address[] memory) {
        return contracts;
    }

    /**
    * @dev Pagination function for deployed contract addresses. Slicing contracts
    */ 
    function getSomeContracts(uint256 _index, uint256 _amount) external view returns (address[] memory) {
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
    function getContractAtIndex(uint256 _index) external view returns (address) {
        require(
            _index < contracts.length,
            "Out of bounds"
        );
        return contracts[_index];
    }

    /**
    * @dev Returns current active implementation address
    */ 
    function activeImplementationContract() public view returns (address) {
        return implementations[contractVersion];
    }

    /**
    * @dev Add and use new implemetation
    */ 
    function pushImplementationContract(address _newImplementation) public onlyOwner {
        uint32 size;
        assembly{
            size := extcodesize(_newImplementation)
        }
        require(size > 0, "Not a contract");

        implementations.push(_newImplementation);
        contractVersion = implementations.length - 1;
        emit PushImplementationContract(_newImplementation, contractVersion);
    }

    /**
    * @dev Change active implemetation
    */ 
    function setImplementationContract(uint256 _index) external onlyOwner {
        require(
            _index < implementations.length,
            "version out of bounds"
        );
        uint256 previousVersion = contractVersion;
        contractVersion = _index;
        emit UpdateImplementationContract(previousVersion, contractVersion);
    }
}