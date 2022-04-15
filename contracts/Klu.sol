pragma solidity ^0.5.6;

import "./klaytn-contracts/ownership/Ownable.sol";
import "./klaytn-contracts/math/SafeMath.sol";
import "./klaytn-contracts/token/KIP7/KIP7.sol";
import "./klaytn-contracts/token/KIP7/KIP7Mintable.sol";
import "./klaytn-contracts/token/KIP7/KIP7Burnable.sol";
import "./klaytn-contracts/token/KIP7/KIP7Metadata.sol";

contract Klu is Ownable, KIP7, KIP7Mintable, KIP7Burnable, KIP7Metadata("", "", 18) {
    using SafeMath for uint256;

    event SetName(string name);
    event SetSymbol(string symbol);

    string public name = "Klu";
    string public symbol = "KLU";

    function setName(string calldata _name) external onlyOwner {
        name = _name;
        emit SetName(_name);
    }

    function setSymbol(string calldata _symbol) external onlyOwner {
        symbol = _symbol;
        emit SetSymbol(_symbol);
    }

    function removeMinter(address account) external onlyOwner {
        _removeMinter(account);
    }
}
