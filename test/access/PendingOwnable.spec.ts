import { time, loadFixture } from "@nomicfoundation/hardhat-network-helpers";
/**
 * hardhat-chai-matchers reference
 * https://hardhat.org/hardhat-chai-matchers/docs/reference
 *
 * The @nomicfoundation/hardhat-chai-matchers plugin is meant to be a drop-in replacement
 * for the @nomiclabs/hardhat-waffle plugin
 *
 * https://hardhat.org/hardhat-chai-matchers/docs/migrate-from-waffle
 *
 * VSCode + Hardhat:
 * https://marketplace.visualstudio.com/items?itemName=NomicFoundation.hardhat-solidity
 */
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Lock", function () {
  // We define a fixture to reuse the same setup in every test.
  // We use loadFixture to run this setup once, snapshot that state,
  // and reset Hardhat Network to that snapshot in every test.
  async function deployPendingOwnable() {
    // Contracts are deployed using the first signer/account by default
    const [owner, otherAccount] = await ethers.getSigners();

    const PendingOwnable = await ethers.getContractFactory("PendingOwnable");
    const pendingOwnable = await PendingOwnable.connect(owner).deploy();

    return {
      pendingOwnable,
      accounts: {
        owner,
        ownerAddress: await owner.getAddress(),
        otherAccount,
        otherAccountAddress: await otherAccount.getAddress(),
      },
    };
  }

  describe("PendingOwnable", function () {
    it("Should set pending owner", async function () {
      const {
        pendingOwnable,
        accounts: { otherAccountAddress },
      } = await loadFixture(deployPendingOwnable);

      await expect(pendingOwnable.setPendingOwner(otherAccountAddress)).to.emit(pendingOwnable, "SetPendingOwner");

      expect(await pendingOwnable.pendingOwner()).to.equal(otherAccountAddress);
    });

    it("Should NOT set pending owner from NON owner account", async function () {
      const {
        pendingOwnable,
        accounts: { otherAccount, otherAccountAddress },
      } = await loadFixture(deployPendingOwnable);

      await expect(pendingOwnable.connect(otherAccount).setPendingOwner(otherAccountAddress)).to.be.revertedWith(
        "Ownable: caller is not the owner"
      );
    });

    it("Should accept pending owner", async function () {
      const {
        pendingOwnable,
        accounts: { otherAccount, otherAccountAddress },
      } = await loadFixture(deployPendingOwnable);

      await pendingOwnable.setPendingOwner(otherAccountAddress);
      await pendingOwnable.connect(otherAccount).acceptOwnership();

      expect(await pendingOwnable.owner()).to.equal(otherAccountAddress);
    });

    it("Should NOT accept pending owner from NON pending owner account", async function () {
      const {
        pendingOwnable,
        accounts: { owner, otherAccount, otherAccountAddress },
      } = await loadFixture(deployPendingOwnable);

      await pendingOwnable.setPendingOwner(otherAccountAddress);

      await expect(pendingOwnable.connect(owner).acceptOwnership()).to.be.revertedWith(
        "PendingOwnable: MUST be pendingOwner"
      );
    });

    it("Should NOT allow transferOwnership calls", async function () {
      const {
        pendingOwnable,
        accounts: { owner, otherAccount, otherAccountAddress },
      } = await loadFixture(deployPendingOwnable);

      await expect(pendingOwnable.connect(owner).transferOwnership(otherAccountAddress)).to.be.revertedWith(
        "PendingOwnable: MUST setPendingOwner()"
      );
    });
  });
});
