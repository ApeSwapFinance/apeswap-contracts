## `ERC1967Upgrade`



This abstract contract provides getters and event emitting update functions for
https://eips.ethereum.org/EIPS/eip-1967[EIP1967] slots.

_Available since v4.1._




### `_getImplementation() → address` (internal)



Returns the current implementation address.

### `_upgradeTo(address newImplementation)` (internal)



Perform implementation upgrade

Emits an {Upgraded} event.

### `_upgradeToAndCall(address newImplementation, bytes data, bool forceCall)` (internal)



Perform implementation upgrade with additional setup call.

Emits an {Upgraded} event.

### `_upgradeToAndCallSecure(address newImplementation, bytes data, bool forceCall)` (internal)



Perform implementation upgrade with security checks for UUPS proxies, and additional setup call.

Emits an {Upgraded} event.

### `_getAdmin() → address` (internal)



Returns the current admin.

### `_changeAdmin(address newAdmin)` (internal)



Changes the admin of the proxy.

Emits an {AdminChanged} event.

### `_getBeacon() → address` (internal)



Returns the current beacon.

### `_upgradeBeaconToAndCall(address newBeacon, bytes data, bool forceCall)` (internal)



Perform beacon upgrade with additional setup call. Note: This upgrades the address of the beacon, it does
not upgrade the implementation contained in the beacon (see {UpgradeableBeacon-_setImplementation} for that).

Emits a {BeaconUpgraded} event.


### `Upgraded(address implementation)`



Emitted when the implementation is upgraded.

### `AdminChanged(address previousAdmin, address newAdmin)`



Emitted when the admin account has changed.

### `BeaconUpgraded(address beacon)`



Emitted when the beacon is upgraded.



