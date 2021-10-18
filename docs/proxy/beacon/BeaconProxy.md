## `BeaconProxy`



This contract implements a proxy that gets the implementation address for each call from a {UpgradeableBeacon}.

The beacon address is stored in storage slot `uint256(keccak256('eip1967.proxy.beacon')) - 1`, so that it doesn't
conflict with the storage layout of the implementation behind the proxy.

_Available since v3.4._


### `constructor(address beacon, bytes data)` (public)



Initializes the proxy with `beacon`.

If `data` is nonempty, it's used as data in a delegate call to the implementation returned by the beacon. This
will typically be an encoded function call, and allows initializating the storage of the proxy like a Solidity
constructor.

Requirements:

- `beacon` must be a contract with the interface {IBeacon}.

### `_beacon() → address` (internal)



Returns the current beacon address.

### `_implementation() → address` (internal)



Returns the current implementation address of the associated beacon.

### `_setBeacon(address beacon, bytes data)` (internal)



Changes the proxy to use a new beacon. Deprecated: see {_upgradeBeaconToAndCall}.

If `data` is nonempty, it's used as data in a delegate call to the implementation returned by the beacon.

Requirements:

- `beacon` must be a contract.
- The implementation returned by `beacon` must be a contract.




