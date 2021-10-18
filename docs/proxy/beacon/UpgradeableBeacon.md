## `UpgradeableBeacon`



This contract is used in conjunction with one or more instances of {BeaconProxy} to determine their
implementation contract, which is where they will delegate all function calls.

An owner is able to change the implementation the beacon points to, thus upgrading the proxies that use this beacon.


### `constructor(address implementation_)` (public)



Sets the address of the initial implementation, and the deployer account as the owner who can upgrade the
beacon.

### `implementation() → address` (public)



Returns the current implementation address.

### `upgradeTo(address newImplementation)` (public)



Upgrades the beacon to a new implementation.

Emits an {Upgraded} event.

Requirements:

- msg.sender must be the owner of the contract.
- `newImplementation` must be a contract.


### `Upgraded(address implementation)`



Emitted when the implementation returned by the beacon is changed.



