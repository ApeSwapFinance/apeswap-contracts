// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title IMultiChainBridge
/// @notice Represents an adapter contract we use as glue code between Apeswap codebase and a third party contract
/// @dev See a possible implementation at https://github.com/ApeSwapFinance/anyswap-banana/blob/9c09dd4157441a59e0a33dc494b5e0a5d41c25d6/contracts/adapters/AnyswapV4ERC20Adapter.sol
interface IMultiChainBridge {
    /**
     * Bridge funds to given address at _chainId
     */
    function withdraw(
        address _bridgeContract,
        address _bridgeMinter,
        uint256 _amount
    ) external returns (bool);
}
