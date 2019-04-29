pragma solidity ^0.4.25;
import "./ERC20Interface.sol";
import "./safeMath.sol";
import "./Ownable.sol";
contract NishantCoin is ERC20Interface, Ownable, SafeMath
{
    string public symbol;
    string public name;
    uint8 public decimals;
    uint public _totalSupply;
    
    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;
    
    constructor() public
    {
        symbol = "NishantCoin";
        name = "Nishant Coin";
        decimals = 10;
        _totalSupply = 1000;
        balances[0x038a17768c21c8cff795E00C9526f3b253fe44d3] = _totalSupply;
        emit Transfer(address(0), 0x038a17768c21c8cff795E00C9526f3b253fe44d3, _totalSupply);
    }
    
    function totalSupply() public constant returns(uint)
    {
        return _totalSupply - balances[address(0)];
    }
    
    function balanceOf(address tokenOwner) public constant returns(uint)
    {
        return balances[tokenOwner];
    }
    
    function transfer(address to, uint tokens) public returns(bool)
    {
           
    }
}
