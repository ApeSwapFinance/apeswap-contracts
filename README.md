 

<img src="logo.svg" alt="ApeSwap" height="100px">

# ApeSwap Contracts 

**A collection of smart contract tools and interfaces used by ApeSwap..** 

## Features

- **Factories**: Turn a contract into a factory using the contract address as an implementation with `Clones` or `TransparentUpgradeableProxy`

- **Sweeper**: Sweep any ERC-20 or NFT locked in a contract with this utility.


## Installation

1. Create a GitHub [personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)


2. Create a `.npmrc` file at the root of this repo or at your $HOME dir and add the following lines, replacing `<NPM_TOKEN>` with yours

```
//npm.pkg.github.com/:_authToken=<NPM_TOKEN>
//registry=https://npm.pkg.github.com/ApeSwapFinance
```

3. `yarn add @apeswapfinance/contracts` 

## Usage

Once installed, you can use the contracts in the library by importing them:

```solidity
pragma solidity ^0.8.0;

import "@apeswapfinance/contracts/utils/Sweeper";

contract MyContract is Sweeper {
    constructor(address[] lockedTokens) Sweeper(lockedTokens) {
    }
}
```

_If you're new to smart contract development, head to [Developing Smart Contracts](https://docs.openzeppelin.com/learn/developing-smart-contracts) to learn about creating a new project and compiling your contracts._

To keep your system secure, you should **always** use the installed code as-is, and neither copy-paste it from online sources, nor modify it yourself. The library is designed so that only the contracts and functions you use are deployed, so you don't need to worry about it needlessly increasing gas costs.


## Contribute

ApeSwap Contracts exists thanks to its contributors. There are many ways you can participate and help build high quality software. Check out the [contribution guide](CONTRIBUTING.md)!

## License

ApeSwap Contracts is released under the [MIT License](LICENSE).
