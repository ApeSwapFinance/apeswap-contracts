const { BN, constants, expectEvent, expectRevert, ether } = require('@openzeppelin/test-helpers');
const { assert } = require('chai');

const Factory = artifacts.require('FactoryMock');
const ERC20Mock = artifacts.require('ERC20Mock');

contract('Factory', function (accounts) {
  const [admin] = accounts;

  beforeEach(async function () {
    this.token20 = await ERC20Mock.new('Mock Token', 'MOCK', admin, ether('100'));
    this.factory = await Factory.new(this.token20.address);
  });

  describe('Factory', function () {
    it('can deploy new contract', async function () {
      await this.factory.deployNewContract();
      assert.equal(
        await this.factory.getLengthContracts(),
        1,
      );
    });

    it('can deploy new contracts and get some', async function () {
      for (let i = 0; i < 5; i++) {
        await this.factory.deployNewContract();
      }
      assert.equal(
        await this.factory.getLengthContracts(),
        5,
      );

      let contracts = await this.factory.getSomeContracts(1, 3);
      assert.equal(
        await this.factory.getContractAtIndex(1),
        contracts[0],
      );
      assert.equal(
        await this.factory.getContractAtIndex(3),
        contracts[contracts.length - 1],
      );

      contracts = await this.factory.getSomeContracts(3, 10);
      assert.equal(
        await this.factory.getContractAtIndex(3),
        contracts[0],
      );
      assert.equal(
        await this.factory.getContractAtIndex(4),
        contracts[contracts.length - 1],
      );
    });

    it('can update implementation contract', async function () {
      this.newToken20 = await ERC20Mock.new('New Mock Token', 'NMOCK', admin, ether('1'));

      await this.factory.pushImplementationContract(this.newToken20.address);
      assert.equal(
        await this.factory.contractVersion(),
        1,
      );
      assert.equal(
        await this.factory.implementations(0),
        [this.token20.address],
      );
      assert.equal(
        await this.factory.activeImplementationContract(),
        this.newToken20.address,
      );
    });
  });
});
