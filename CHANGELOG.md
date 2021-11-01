# Changelog
<!-- https://keepachangelog.com/en/1.0.0/ -->

## [Unreleased]
### Added
### Changed


### Removed
## 0.1.2 - 2021-11-01
### Added
- `IApeSwapPool.sol`
- `IMasterApe.sol`
- `IMultiChainBridge.sol` Represents an adapter contract we use as glue code between Apeswap codebase and a third party bridges
- `ApeSwapPoolManager.sol` provides reusable logic to handle IApeSwapPool contracts
- `MasterApeManager.sol` provides reusable logic to handle IMasterApe contracts


### Removed
## 0.1.0 - 2021-10-20
### Added
- `Factory.sol` Use OZ `Clones` turn any contract into a factory using the contract as an implementation address.
- `FactoryUpgradeable.sol` Use OZ `TransparentUpgradeableProxy` turn any contract into a factory with with an upgradeable implementations.
- `Sweeter.sol` Add this library to contracts to allow token sweep functionality, which will unlock tokens accidentally sent to the contract.

