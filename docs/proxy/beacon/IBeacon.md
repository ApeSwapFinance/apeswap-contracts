## `IBeacon`



This is the interface that {BeaconProxy} expects of its beacon.


### `implementation() → address` (external)



Must return an address that can be used as a delegate call target.

{BeaconProxy} will check that this address is a contract.




