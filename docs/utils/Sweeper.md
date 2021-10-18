## `Sweeper`



Sweep any ERC20 token.
Sometimes people accidentally send tokens to a contract without any way to retrieve them.
This contract makes sure any erc20 tokens can be removed from the contract.


### `constructor(address[] _lockedTokens)` (public)





### `sweepTokens(contract IERC20[] tokens, address to)` (external)



Transfers erc20 tokens to owner
Only owner of contract can call this function

### `sweepNFTs(struct Sweeper.NFT[] nfts, address to)` (external)



Transfers NFT to owner
Only owner of contract can call this function

### `sweepTokensAndNFTs(contract IERC20[] tokens, struct Sweeper.NFT[] nfts, address to)` (public)



Transfers ERC20 and NFT to owner
Only owner of contract can call this function

### `lockToken(address token)` (public)



Lock single token so they can't be transferred from the contract.
Once locked it can't be unlocked

### `lockTokens(address[] tokens)` (public)



Lock multiple tokens so they can't be transferred from the contract.
Once locked it can't be unlocked


### `SweepWithdrawToken(address receiver, contract IERC20 token, uint256 balance)`





### `SweepWithdrawNFTs(address receiver, struct Sweeper.NFT[] nfts)`






### `NFT`


contract IERC721 nftaddress


uint256[] ids



