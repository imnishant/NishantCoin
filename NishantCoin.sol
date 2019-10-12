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
        balances[ADDRESS] = _totalSupply;                   //Change ADDRESS with your address
        emit Transfer(address(0), ADDRESS, _totalSupply);   //Change ADDRESS with your address
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
           balances[msg.sender] = safeSub(balances[msg.sender], tokens);
           balances[to] = safeAdd(balances[to], tokens);
           emit Transfer(msg.sender, to, tokens);
           return true;
           
    }
    
    function transferFrom(address from, address to, uint tokens) public returns(bool)
    {
        balances[from] = safeSub(balances[from], tokens);
        allowed[from][msg.sender] = safeSub(allowed[from][msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
        emit Transfer(from, to, tokens);
        return true;
    }
    
    function approve(address spender, uint tokens) public returns(bool)
    {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
        
    }
    function allowance(address tokenOwner, address spender) public constant returns(uint)
    {
        return allowed[tokenOwner][spender];
    }
}
  
  
  
