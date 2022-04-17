pragma solidity ^0.5.6;

import "./klaytn-contracts/ownership/Ownable.sol";
import "./klaytn-contracts/math/SafeMath.sol";
import "./klaytn-contracts/token/KIP7/KIP7Burnable.sol";
import "./interfaces/IKluBurner.sol";
import "./interfaces/IBurnListener.sol";

contract KluBurner is Ownable, IKluBurner {
    using SafeMath for uint256;

    KIP7Burnable public klu;
    IBurnListener public burnListner;
    mapping(address => uint256) public totalBurned;

    constructor(KIP7Burnable _klu) public {
        klu = _klu;
    }

    function setKlu(KIP7Burnable _klu) external onlyOwner {
        klu = _klu;
        emit SetKlu(_klu);
    }

    function setBurnListener(IBurnListener _burnListner) external onlyOwner {
        burnListner = _burnListner;
        emit SetBurnListener(_burnListner);
    }

    function burn(address who, address account, uint256 amount) external returns (uint256 used) {
        if (address(burnListner) != address(0)) {
            klu.approve(address(burnListner), amount);
            used = burnListner.onBurn(account, amount);
            klu.burnFrom(account, amount.sub(used));
        } else {
            klu.burnFrom(account, amount);
        }
        totalBurned[who] = totalBurned[who].add(amount);
        emit Burn(who, account, amount, used);
    }
}
