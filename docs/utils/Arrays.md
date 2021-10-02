## `Arrays`



Collection of functions related to array types.


### `findUpperBound(uint256[] array, uint256 element) → uint256` (internal)



Searches a sorted `array` and returns the first index that contains
a value greater or equal to `element`. If no such index exists (i.e. all
values in the array are strictly less than `element`), the array length is
returned. Time complexity O(log n).

`array` is expected to be sorted in ascending order, and to contain no
repeated elements.




