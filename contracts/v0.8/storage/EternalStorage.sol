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

import "@openzeppelin/contracts/access/Ownable.sol";

contract EternalStorage is Ownable {
    mapping(bytes32 => uint256) internal uintStorage;
    mapping(bytes32 => address) internal addressStorage;
    mapping(bytes32 => bool) internal booleanStorage;
    mapping(bytes32 => int256) internal intStorage;

    event SetUint(bytes32 key, uint256 _newValue);
    event SetInt(bytes32 key, int256 _newValue);
    event SetAddress(bytes32 key, address _newValue);
    event SetBoolean(bytes32 key, bool _newValue);

    function getUIntValue(bytes32 _storageKey) public view returns (uint256) {
        return uintStorage[_storageKey];
    }

    function setUIntValue(bytes32 _storageKey, uint256 value) public onlyOwner {
        uintStorage[_storageKey] = value;
        emit SetUint(_storageKey, value);
    }

    function getAddressValue(bytes32 _storageKey) public view returns (address) {
        return addressStorage[_storageKey];
    }

    function setAddressValue(bytes32 _storageKey, address value) public onlyOwner {
        addressStorage[_storageKey] = value;
        emit SetAddress(_storageKey, value);
    }

    function getBooleanValue(bytes32 _storageKey) public view returns (bool) {
        return booleanStorage[_storageKey];
    }

    function setBooleanValue(bytes32 _storageKey, bool value) public onlyOwner {
        booleanStorage[_storageKey] = value;
        emit SetBoolean(_storageKey, value);
    }

    function getIntValue(bytes32 _storageKey) public view returns (int256) {
        return intStorage[_storageKey];
    }

    function setIntValue(bytes32 _storageKey, int256 value) public onlyOwner {
        intStorage[_storageKey] = value;
        emit SetInt(_storageKey, value);
    }
}
