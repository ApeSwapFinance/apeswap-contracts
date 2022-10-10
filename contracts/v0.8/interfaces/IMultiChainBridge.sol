// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.0;

/// @title IMultiChainBridge
/// @notice Represents an adapter contract we use as glue code between Apeswap codebase and a third party contract
/// @dev See a possible implementation at https://github.com/ApeSwapFinance/anyswap-banana/blob/9c09dd4157441a59e0a33dc494b5e0a5d41c25d6/contracts/adapters/AnyswapV4ERC20Adapter.sol
interface IMultiChainBridge {
    /// @notice Send funds to other side of bridge
    function bridge(
        address _bridgeAddress,
        address _tokenAddress,
        uint256 _amount
    ) external;
}
