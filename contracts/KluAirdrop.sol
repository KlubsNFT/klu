pragma solidity ^0.5.6;

import "./klaytn-contracts/ownership/Ownable.sol";
import "./klaytn-contracts/token/KIP7/KIP7Mintable.sol";

contract KluAirdrop is Ownable {

    KIP7Mintable public klu;

    constructor(KIP7Mintable _klu) public {
        klu = _klu;
    }

    function airdrop(address[] calldata tos, uint256[] calldata amounts) external onlyOwner {
        require(tos.length == amounts.length);
        for (uint256 i = 0; i < tos.length; i += 1) {
            klu.mint(tos[i], amounts[i]);
        }
    }
}
