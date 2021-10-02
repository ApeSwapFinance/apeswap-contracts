## `MerkleProof`



These functions deal with verification of Merkle Trees proofs.

The proofs can be generated using the JavaScript library
https://github.com/miguelmota/merkletreejs[merkletreejs].
Note: the hashing algorithm should be keccak256 and pair sorting should be enabled.

See `test/utils/cryptography/MerkleProof.test.js` for some examples.


### `verify(bytes32[] proof, bytes32 root, bytes32 leaf) → bool` (internal)



Returns true if a `leaf` can be proved to be a part of a Merkle tree
defined by `root`. For this, a `proof` must be provided, containing
sibling hashes on the branch from the leaf to the root of the tree. Each
pair of leaves and each pair of pre-images are assumed to be sorted.




