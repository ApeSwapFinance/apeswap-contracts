## `Counters`



Provides counters that can only be incremented, decremented or reset. This can be used e.g. to track the number
of elements in a mapping, issuing ERC721 ids, or counting request ids.

Include with `using Counters for Counters.Counter;`


### `current(struct Counters.Counter counter) → uint256` (internal)





### `increment(struct Counters.Counter counter)` (internal)





### `decrement(struct Counters.Counter counter)` (internal)





### `reset(struct Counters.Counter counter)` (internal)







### `Counter`


uint256 _value



