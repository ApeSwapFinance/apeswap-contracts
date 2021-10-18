## `BitMaps`



Library for managing uint256 to bool mapping in a compact and efficient way, providing the keys are sequential.
Largelly inspired by Uniswap's https://github.com/Uniswap/merkle-distributor/blob/master/contracts/MerkleDistributor.sol[merkle-distributor].


### `get(struct BitMaps.BitMap bitmap, uint256 index) → bool` (internal)



Returns whether the bit at `index` is set.

### `setTo(struct BitMaps.BitMap bitmap, uint256 index, bool value)` (internal)



Sets the bit at `index` to the boolean `value`.

### `set(struct BitMaps.BitMap bitmap, uint256 index)` (internal)



Sets the bit at `index`.

### `unset(struct BitMaps.BitMap bitmap, uint256 index)` (internal)



Unsets the bit at `index`.



### `BitMap`


mapping(uint256 => uint256) _data



