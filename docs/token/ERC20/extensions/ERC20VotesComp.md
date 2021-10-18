## `ERC20VotesComp`



Extension of ERC20 to support Compound's voting and delegation. This version exactly matches Compound's
interface, with the drawback of only supporting supply up to (2^96^ - 1).

NOTE: You should use this contract if you need exact compatibility with COMP (for example in order to use your token
with Governor Alpha or Bravo) and if you are sure the supply cap of 2^96^ is enough for you. Otherwise, use the
{ERC20Votes} variant of this module.

This extension keeps a history (checkpoints) of each account's vote power. Vote power can be delegated either
by calling the {delegate} function directly, or by providing a signature to be used with {delegateBySig}. Voting
power can be queried through the public accessors {getCurrentVotes} and {getPriorVotes}.

By default, token balance does not account for voting power. This makes transfers cheaper. The downside is that it
requires users to delegate to themselves in order to activate checkpoints and have their voting power tracked.
Enabling self-delegation can easily be done by overriding the {delegates} function. Keep in mind however that this
will significantly increase the base gas cost of transfers.

_Available since v4.2._


### `getCurrentVotes(address account) → uint96` (external)



Comp version of the {getVotes} accessor, with `uint96` return type.

### `getPriorVotes(address account, uint256 blockNumber) → uint96` (external)



Comp version of the {getPastVotes} accessor, with `uint96` return type.

### `_maxSupply() → uint224` (internal)



Maximum token supply. Reduced to `type(uint96).max` (2^96^ - 1) to fit COMP interface.




