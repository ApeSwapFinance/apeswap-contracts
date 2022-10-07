const { expect } = require("chai");
const { ethers } = require("hardhat")

const PendingOwnable = artifacts.require('PendingOwnable');

contract("PendingOwnable", function (accounts) {
  const [owner, otherAccount] = accounts;

  beforeEach(async function () {
    this.pendingOwnable = await PendingOwnable.new();
  });

  it("Should set pending owner", async function () {
    await expect(this.pendingOwnable.setPendingOwner(otherAccount)).to.emit(this.pendingOwnable, 'SetPendingOwner')
    expect(await this.pendingOwnable.pendingOwner()).to.equal(otherAccount);
  });

  it("Should NOT set pending owner from NON owner account", async function () {
    await expect(this.pendingOwnable.setPendingOwner(otherAccount, { from: otherAccount })).to.be.revertedWith("Ownable: caller is not the owner");
  });

  it("Should accept pending owner", async function () {
    await this.pendingOwnable.setPendingOwner(otherAccount);
    await this.pendingOwnable.acceptOwnership({ from: otherAccount });

    expect(await this.pendingOwnable.owner()).to.equal(otherAccount);
  });

  it("Should NOT accept pending owner from NON pending owner account", async function () {
    await this.pendingOwnable.setPendingOwner(otherAccount);

    await expect(this.pendingOwnable.acceptOwnership()).to.be.revertedWith(
      "PendingOwnable: MUST be pendingOwner"
    );
  });

  it("Should NOT allow transferOwnership calls", async function () {
    await expect(this.pendingOwnable.transferOwnership(otherAccount)).to.be.revertedWith(
      "PendingOwnable: MUST setPendingOwner()"
    );
  });
});
