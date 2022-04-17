pragma solidity ^0.5.6;

import "../klaytn-contracts/token/KIP7/KIP7Burnable.sol";
import "./IBurnListener.sol";

contract IKluBurner {

    event SetKlu(KIP7Burnable klu);
    event SetBurnListener(IBurnListener burnListener);
    event Burn(address who, address account, uint256 amount, uint256 used);

    function totalBurned(address who) external view returns (uint256);
    function burn(address who, address account, uint256 amount) external returns (uint256 used);
}
