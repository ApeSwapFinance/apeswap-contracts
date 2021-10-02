## `Factory`



Standardized Apeswap Clone Factory


### `constructor(address _implementation)` (public)





### `deployNewContract() → address newContract` (external)



deploy new contract of active implementation

### `getLengthContracts() → uint256` (external)



Get amount of deployed contracts

### `getAllContracts() → address[]` (external)



Get all deployed contract addresses

### `getSomeContracts(uint256 _index, uint256 _amount) → address[]` (external)



Pagination function for deployed contract addresses. Slicing contracts

### `getContractAtIndex(uint256 _index) → address` (external)



Get single deployed contract address based on index

### `activeImplementationContract() → address` (public)



Returns current active implementation address

### `pushImplementationContract(address _newImplementation)` (public)



Add and use new implemetation

### `setImplementationContract(uint256 _index)` (external)



Change active implemetation


### `ContractDeployed(address contractAddress)`





### `PushImplementationContract(address newImplementation, uint256 versionId)`





### `UpdateImplementationContract(uint256 previousVersion, uint256 newVersion)`







