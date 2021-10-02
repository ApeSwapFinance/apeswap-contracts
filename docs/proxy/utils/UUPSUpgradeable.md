## `UUPSUpgradeable`



An upgradeability mechanism designed for UUPS proxies. The functions included here can perform an upgrade of an
{ERC1967Proxy}, when this contract is set as the implementation behind such a proxy.

A security mechanism ensures that an upgrade does not turn off upgradeability accidentally, although this risk is
reinstated if the upgrade retains upgradeability but removes the security mechanism, e.g. by replacing
`UUPSUpgradeable` with a custom implementation of upgrades.

The {_authorizeUpgrade} function must be overridden to include access restriction to the upgrade mechanism.

_Available since v4.1._


### `upgradeTo(address newImplementation)` (external)



Upgrade the implementation of the proxy to `newImplementation`.

Calls {_authorizeUpgrade}.

Emits an {Upgraded} event.

### `upgradeToAndCall(address newImplementation, bytes data)` (external)



Upgrade the implementation of the proxy to `newImplementation`, and subsequently execute the function call
encoded in `data`.

Calls {_authorizeUpgrade}.

Emits an {Upgraded} event.

### `_authorizeUpgrade(address newImplementation)` (internal)



Function that should revert when `msg.sender` is not authorized to upgrade the contract. Called by
{upgradeTo} and {upgradeToAndCall}.

Normally, this function will use an xref:access.adoc[access control] modifier such as {Ownable-onlyOwner}.

```solidity
function _authorizeUpgrade(address) internal override onlyOwner {}
```




