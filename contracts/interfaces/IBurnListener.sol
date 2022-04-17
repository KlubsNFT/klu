pragma solidity ^0.5.6;

contract IBurnListener {
    function onBurn(address who, address account, uint256 amount) external returns (uint256 used);
}
