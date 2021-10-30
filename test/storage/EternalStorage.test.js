require('@openzeppelin/test-helpers');
const { expectRevert } = require('@openzeppelin/test-helpers');
const { expect } = require('chai');

// Load compiled artifacts
const EternalStorage = artifacts.require('EternalStorage');

contract('EternalStorage', (accounts) => {
  
  const [owner, pablo, alice] = accounts;

  beforeEach(async () => {
    this.eternalStorage = await EternalStorage.new({ from: owner });
  });

  it('should persist a uint256 value', async () => {
    const routeId = web3.utils.keccak256("test-uint-value");
    await this.eternalStorage.setUIntValue(routeId, 123, { from: owner });
    const storedValue = await this.eternalStorage.getUIntValue(routeId);
    expect(storedValue.toString()).to.be.an('string').equal("123");
  });
  
  it('should update an existing uint256 value', async () => {
    const routeId = web3.utils.keccak256("test-uint-value");
    await this.eternalStorage.setUIntValue(routeId, 123, { from: owner });
    await this.eternalStorage.setUIntValue(routeId, 321, { from: owner });
    const storedValue = await this.eternalStorage.getUIntValue(routeId);
    expect(storedValue.toString()).to.be.an('string').equal("321");
  });

  it('should persist a int256 value', async () => {
    const routeId = web3.utils.keccak256("test-int-value");
    await this.eternalStorage.setIntValue(routeId, 123, { from: owner });
    const storedValue = await this.eternalStorage.getIntValue(routeId);
    expect(storedValue.toString()).to.be.an('string').equal("123");
  });
  
  it('should update an existing uint256 value', async () => {
    const routeId = web3.utils.keccak256("test-int-value");
    await this.eternalStorage.setUIntValue(routeId, 123, { from: owner });
    await this.eternalStorage.setUIntValue(routeId, 321, { from: owner });
    const storedValue = await this.eternalStorage.getUIntValue(routeId);
    expect(storedValue.toString()).to.be.an('string').equal("321");
  });


  it('should persist an address', async () => {
    const routeId = web3.utils.keccak256("address-key");
    await this.eternalStorage.setAddressValue(routeId, pablo, { from: owner });
    const storedValue = await this.eternalStorage.getAddressValue(routeId);
    expect(storedValue.toString()).to.be.an('string').equal(pablo);
  });
  
  it('should update an existing address', async () => {
    const routeId = web3.utils.keccak256("address-key");
    await this.eternalStorage.setAddressValue(routeId, pablo, { from: owner });
    await this.eternalStorage.setAddressValue(routeId, alice, { from: owner });
    const storedValue = await this.eternalStorage.getAddressValue(routeId);
    expect(storedValue.toString()).to.be.an('string').equal(alice);
  });


  it('should persist a boolean value', async () => {
    const routeId = web3.utils.keccak256("boolean-key");
    await this.eternalStorage.setBooleanValue(routeId, true, { from: owner });
    const storedValue = await this.eternalStorage.getBooleanValue(routeId);
    expect(storedValue.toString()).to.be.an('string').that.is.equal("true");
  });
  
  
  it('should update a boolean value', async () => {
    const routeId = web3.utils.keccak256("boolean-key");
    await this.eternalStorage.setBooleanValue(routeId, true, { from: owner });
    const storedValue = await this.eternalStorage.getBooleanValue(routeId);
    expect(storedValue.toString()).to.be.an('string').that.is.equal("true");
    await this.eternalStorage.setBooleanValue(routeId, false, { from: owner });
    const updatedValue = await this.eternalStorage.getBooleanValue(routeId);
    expect(updatedValue.toString()).to.be.an('string').that.is.equal("false");
  });

  // @todo: should return error instead of "0" ?
  it('should return empty when key doesnt exists', async () => {
    const routeId = web3.utils.keccak256("wrong-key");
    const updatedValue = await this.eternalStorage.getUIntValue(routeId);
    expect(updatedValue.toString()).to.be.an('string').that.is.equal("0");
  });

  it('should revert when EOA calls setUintValue', async () => {
    const routeId = web3.utils.keccak256("test-eoa-revert-key-uint-value");
    await expectRevert(
      this.eternalStorage.setUIntValue(routeId, 123, { from: pablo }), 'Ownable: caller is not the owner'
    );
  });

  it('should revert when EOA calls setAddressValue', async () => {
    const routeId = web3.utils.keccak256("test-eoa-revert-key-address-value");
    await expectRevert(
      this.eternalStorage.setAddressValue(routeId, alice, { from: pablo }), 'Ownable: caller is not the owner'
    );
  });

  it('should revert when EOA calls setBooleanValue', async () => {
    const routeId = web3.utils.keccak256("test-eoa-revert-key-boolean-value");
    await expectRevert(
      this.eternalStorage.setBooleanValue(routeId, 123, { from: pablo }), 'Ownable: caller is not the owner'
    );
  });

  it('should revert when EOA calls setIntValue', async () => {
    const routeId = web3.utils.keccak256("test-eoa-revert-key");
    await expectRevert(
      this.eternalStorage.setIntValue(routeId, 123, { from: pablo }), 'Ownable: caller is not the owner'
    );
  });

});
