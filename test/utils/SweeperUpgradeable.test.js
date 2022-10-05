const { BN, constants, expectEvent, expectRevert, ether } = require('@openzeppelin/test-helpers');
const ethers = require('ethers');
const { assert } = require('chai');
const { EtherscanParser } = require('sol2uml');
const { web3 } = require('@openzeppelin/test-helpers/src/setup');

const SweeperUpgradeableMock = artifacts.require('SweeperUpgradeableMock');
const ERC20Mock = artifacts.require('ERC20Mock');
const ERC721Mock = artifacts.require('ERC721Mock');

contract('SweeperUpgradeable', function (accounts) {
  const [admin] = accounts;

  beforeEach(async function () {
    this.sweeperUpgradeable = await SweeperUpgradeableMock.new();
    await this.sweeperUpgradeable.initializeSweeper()
    this.token20 = await ERC20Mock.new('Mock Token', 'MOCK', this.sweeperUpgradeable.address, ether('100'));
    this.token721 = await ERC721Mock.new('Mock NFT', 'MNFT');

  });

  it('can sweep native', async function () {
    await web3.eth.sendTransaction({ from: admin, to: this.sweeperUpgradeable.address, value: web3.utils.toWei("0.5", "ether") })

    let balanceSweeperUpgradeable = await web3.eth.getBalance(this.sweeperUpgradeable.address);
    assert.equal(
      balanceSweeperUpgradeable.toString(),
      web3.utils.toWei("0.5", "ether").toString(),
    );
    await this.sweeperUpgradeable.sweepNative(admin);
    balanceSweeperUpgradeable = await web3.eth.getBalance(this.sweeperUpgradeable.address);
    assert.equal(
      balanceSweeperUpgradeable,
      0,
    );
  });

  it('can sweep erc20', async function () {
    const beforeBalance = await this.token20.balanceOf(admin);
    await this.sweeperUpgradeable.sweepTokens([this.token20.address], admin);
    const balance = await this.token20.balanceOf(admin);
    assert.equal(
      balance - beforeBalance,
      ether('100'),
    );
    const balanceSweeperUpgradeable = await this.token20.balanceOf(this.sweeperUpgradeable.address);
    assert.equal(
      balanceSweeperUpgradeable,
      0,
    );
  });

  it('can sweep erc721', async function () {
    await this.token721.mint(this.sweeperUpgradeable.address, 123);
    await this.token721.mint(this.sweeperUpgradeable.address, 456);
    await this.sweeperUpgradeable.sweepNFTs([{ nftaddress: this.token721.address, ids: [123, 456] }], admin);
    // await this.sweeperUpgradeable.sweepNFTs([[this.token721.address, [123, 456]]], admin);
    const owner123 = await this.token721.ownerOf(123);
    const owner456 = await this.token721.ownerOf(456);

    assert.equal(
      owner123,
      admin,
    );
    assert.equal(
      owner456,
      admin,
    );
  });

  it('can sweep erc20 and erc721', async function () {
    const beforeBalance = await this.token20.balanceOf(admin);
    await this.token721.mint(this.sweeperUpgradeable.address, 123);
    await this.token721.mint(this.sweeperUpgradeable.address, 456);

    await this.sweeperUpgradeable.sweepTokensAndNFTs([this.token20.address], [{ nftaddress: this.token721.address, ids: [123, 456] }], admin);
    const balance = await this.token20.balanceOf(admin);
    assert.equal(
      balance - beforeBalance,
      ether('100'),
    );
    const balanceSweeperUpgradeable = await this.token20.balanceOf(this.sweeperUpgradeable.address);
    assert.equal(
      balanceSweeperUpgradeable,
      0,
    );

    const owner123 = await this.token721.ownerOf(123);
    const owner456 = await this.token721.ownerOf(456);

    assert.equal(
      owner123,
      admin,
    );
    assert.equal(
      owner456,
      admin,
    );
  });

  it('can lock erc20', async function () {
    const beforeBalance = await this.token20.balanceOf(admin);
    await this.sweeperUpgradeable.lockTokens([this.token20.address]);
    expectRevert(this.sweeperUpgradeable.sweepTokens([this.token20.address], admin), 'Tokens can\'t be sweeped');
    const balance = await this.token20.balanceOf(admin);
    assert.equal(
      balance - beforeBalance,
      0,
    );
  });

  it('can lock erc721', async function () {
    await this.sweeperUpgradeable.lockTokens([this.token721.address]);

    await this.token721.mint(this.sweeperUpgradeable.address, 123);
    await this.token721.mint(this.sweeperUpgradeable.address, 456);
    expectRevert(
      this.sweeperUpgradeable.sweepNFTs([{ nftaddress: this.token721.address, ids: [123, 456] }], admin),
      'Tokens can\'t be sweeped');
    const owner123 = await this.token721.ownerOf(123);
    const owner456 = await this.token721.ownerOf(456);

    assert.equal(
      owner123,
      this.sweeperUpgradeable.address,
    );
    assert.equal(
      owner456,
      this.sweeperUpgradeable.address,
    );
  });
});
