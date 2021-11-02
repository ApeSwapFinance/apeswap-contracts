const { BN, constants, expectEvent, expectRevert, ether } = require('@openzeppelin/test-helpers');
const { assert } = require('chai');

const Sweeper = artifacts.require('Sweeper');
const ERC20Mock = artifacts.require('ERC20Mock');
const ERC721Mock = artifacts.require('ERC721Mock');

contract('Sweeper', function (accounts) {
  const [admin] = accounts;

  beforeEach(async function () {
    this.sweeper = await Sweeper.new([], true);
    this.token20 = await ERC20Mock.new('Mock Token', 'MOCK', this.sweeper.address, ether('100'));
    this.token721 = await ERC721Mock.new('Mock NFT', 'MNFT');
  });

  describe('Sweeper contract', function () {
    it('can sweep erc20', async function () {
      const beforeBalance = await this.token20.balanceOf(admin);
      await this.sweeper.sweepTokens([this.token20.address], admin);
      const balance = await this.token20.balanceOf(admin);
      assert.equal(
        balance - beforeBalance,
        ether('100'),
      );
      const balanceSweeper = await this.token20.balanceOf(this.sweeper.address);
      assert.equal(
        balanceSweeper,
        0,
      );
    });

    it('can sweep erc721', async function () {
      await this.token721.mint(this.sweeper.address, 123);
      await this.token721.mint(this.sweeper.address, 456);
      await this.sweeper.sweepNFTs([{ nftaddress: this.token721.address, ids: [123, 456] }], admin);
      // await this.sweeper.sweepNFTs([[this.token721.address, [123, 456]]], admin);
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
      await this.token721.mint(this.sweeper.address, 123);
      await this.token721.mint(this.sweeper.address, 456);

      await this.sweeper.sweepTokensAndNFTs([this.token20.address], [{ nftaddress: this.token721.address, ids: [123, 456] }], admin);
      const balance = await this.token20.balanceOf(admin);
      assert.equal(
        balance - beforeBalance,
        ether('100'),
      );
      const balanceSweeper = await this.token20.balanceOf(this.sweeper.address);
      assert.equal(
        balanceSweeper,
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
      await this.sweeper.lockTokens([this.token20.address]);
      expectRevert(this.sweeper.sweepTokens([this.token20.address], admin), 'Tokens can\'t be sweeped');
      const balance = await this.token20.balanceOf(admin);
      assert.equal(
        balance - beforeBalance,
        0,
      );
    });

    it('can lock erc721', async function () {
      await this.sweeper.lockTokens([this.token721.address]);

      await this.token721.mint(this.sweeper.address, 123);
      await this.token721.mint(this.sweeper.address, 456);
      expectRevert(
        this.sweeper.sweepNFTs([{ nftaddress: this.token721.address, ids: [123, 456] }], admin),
        'Tokens can\'t be sweeped');
      // await this.sweeper.sweepNFTs([[this.token721.address, [123, 456]]], admin);
      const owner123 = await this.token721.ownerOf(123);
      const owner456 = await this.token721.ownerOf(456);

      assert.equal(
        owner123,
        this.sweeper.address,
      );
      assert.equal(
        owner456,
        this.sweeper.address,
      );
    });
  });
});
