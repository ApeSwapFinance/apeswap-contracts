## `IAccessControlEnumerable`



External interface of AccessControlEnumerable declared to support ERC165 detection.


### `getRoleMember(bytes32 role, uint256 index) → address` (external)



Returns one of the accounts that have `role`. `index` must be a
value between 0 and {getRoleMemberCount}, non-inclusive.

Role bearers are not sorted in any particular way, and their ordering may
change at any point.

WARNING: When using {getRoleMember} and {getRoleMemberCount}, make sure
you perform all queries on the same block. See the following
https://forum.openzeppelin.com/t/iterating-over-elements-on-enumerableset-in-openzeppelin-contracts/2296[forum post]
for more information.

### `getRoleMemberCount(bytes32 role) → uint256` (external)



Returns the number of accounts that have `role`. Can be used
together with {getRoleMember} to enumerate all bearers of a role.




