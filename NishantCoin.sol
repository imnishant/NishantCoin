pragma solidity ^0.4.25;
import "./ERC20Interface.sol";
import "./Ownable.sol";
contract NishantCoin is ERC20Interface, Ownable
{
    string public symbol;
    string public name;
    uint8 public decimals;
    uint public totalSupply;
}
