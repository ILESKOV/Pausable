pragma solidity 0.8.13

contract Bank{

  mapping(address => uint) public balanceOf;
  address public owner;
  bool private _paused;
  
  constructor(){  
    owner == msg.sender;
    _paused = false;
  }
  
  modifier onlyOwner(){
    require(msg.sender ==owner);
    _;
  }
  
  //Allow to execute when contract is not paused
  modifier whenNotPaused(){
    require(!_paused);
    _;
  }
  
  modifier whenPaused(){
    require(_paused);
    _;
  }
  
  function pause() public onlyOwner whenPaused{
    _paused = true;
  }
  
  function unPause() public onlyOwner whenPaused{
    _paused = false;
  }
  
  function withdrawAll() public whenNotPaused{
    uint amountToWithdraw = balanceOf[msg.sender];
    balanceOf[msg.sender] = 0;
    require(msg.sender.call.value(amountToWithdraw);
  }
  
  function emergencyWithdrawal(address emergencyAddress)public onlyOwner whenPaused{
    //withdrawal to owner
  }
}
