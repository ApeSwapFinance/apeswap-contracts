 

<img src="logo.svg" alt="OpenZeppelin" height="100px">

# ApeSwap Contracts 

**A collection of smart contract tools and interfaces used by ApeSwap..** 

<!-- TODO:  -->
### Features:  
 * 



## Overview

### Installation

```console
yarn add @apeswapfinance/contracts
```

```console
npm install @apeswapfinance/contracts
```

<!-- TODO: Would be nice :P -->
<!-- OpenZeppelin Contracts features a [stable API](https://docs.openzeppelin.com/contracts/releases-stability#api-stability), which means your contracts won't break unexpectedly when upgrading to a newer minor version. -->

### Usage

Once installed, you can use the contracts in the library by importing them:

<!-- TODO: Import working example -->
```solidity
pragma solidity ^0.8.0;

import "@apeswapfinance/contracts/...";

contract MyContract is ERC721 {
    constructor() ERC721("MyCollectible", "MCO") {
    }
}
```

_If you're new to smart contract development, head to [Developing Smart Contracts](https://docs.openzeppelin.com/learn/developing-smart-contracts) to learn about creating a new project and compiling your contracts._

To keep your system secure, you should **always** use the installed code as-is, and neither copy-paste it from online sources, nor modify it yourself. The library is designed so that only the contracts and functions you use are deployed, so you don't need to worry about it needlessly increasing gas costs.


## Contribute

ApeSwap Contracts exists thanks to its contributors. There are many ways you can participate and help build high quality software. Check out the [contribution guide](CONTRIBUTING.md)!

## License

ApeSwap Contracts is released under the [MIT License](LICENSE).
