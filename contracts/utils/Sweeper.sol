// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../access/Ownable.sol";
import "../token/ERC20/IERC20.sol";
import "../token/ERC721/IERC721.sol";

/**
 * @dev Sweep any ERC20 token.
 * Sometimes people accidentally send tokens to a contract without any way to retrieve them.
 * This contract makes sure any erc20 tokens can be removed from the contract.
 */
contract Sweeper is Ownable {
    
    struct NFT {
        IERC721 nftaddress;
        uint256[] ids;
    }
    mapping (address => bool) public lockedTokens;

    event SweepWithdrawToken(
        address indexed receiver,
        IERC20 indexed token,
        uint256 balance
    );

     event SweepWithdrawNFTs(
        address indexed receiver,
        NFT[] indexed nfts
    );

    constructor(address[] memory _lockedTokens) {
        for (uint256 i = 0; i < _lockedTokens.length; i++) {
            address token = _lockedTokens[i];
            lockedTokens[token] = true;
        }
    }

    /**
     * @dev Transfers erc20 tokens to owner
     * Only owner of contract can call this function
     */
    function sweepTokens(IERC20[] memory tokens) external onlyOwner {
        NFT[] memory empty;
        sweepTokensAndNFTs(tokens, empty);
    }

     /**
     * @dev Transfers erc20 tokens to owner
     * Only owner of contract can call this function
     */
    function sweepNFTs(NFT[] memory nfts) external onlyOwner {
        IERC20[] memory empty;
        sweepTokensAndNFTs(empty, nfts);
    }

    /**
     * @dev Transfers erc20 tokens to owner
     * Only owner of contract can call this function
     */
    function sweepTokensAndNFTs(IERC20[] memory tokens, NFT[] memory nfts) public onlyOwner {
        for (uint i = 0; i < tokens.length; i++) {
            IERC20 token = tokens[i];
            require(!lockedTokens[address(token)], "Tokens can't be sweeped");
            uint256 balance = token.balanceOf(address(this));
            token.transfer(msg.sender, balance);
            emit SweepWithdrawToken(msg.sender, token, balance);
        }

        for (uint i = 0; i < nfts.length; i++) {
            IERC721 nftaddress = nfts[i].nftaddress;
            require(!lockedTokens[address(nftaddress)], "Tokens can't be sweeped");
            uint256[] memory ids = nfts[i].ids;
            for (uint j = 0; j < ids.length; j++) {
                nftaddress.safeTransferFrom(address(this), msg.sender, ids[j]);
            }
        }
        emit SweepWithdrawNFTs(msg.sender, nfts);
    }

    function lockToken(address token) external onlyOwner {
        lockedTokens[token] = true;
    }
}
