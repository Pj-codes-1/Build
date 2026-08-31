 // SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

contract MyWallet{

address public  owner;
address [] public Funders ;
mapping (address => uint256) amountFunded;
mapping(address=> mapping(address=> uint256 amount))public allowance;

    function fund()public payable{
       Funders.push(msg.sender);
       amountFunded[msg.sender] +=msg.value;


    }
      constructor(){
       owner = msg.sender ;
       

      }
      
         
      }
   function Balance()public view returns(uint256) {
       return amountFunded[msg.sender];

     

   }
   function withdraw(address receiver,uint256 _WithdrawalAmount)public {
    require(amountFunded[msg.sender] >= _WithdrawalAmount,"not enough balance");

    amountFunded[msg.sender] -= _WithdrawalAmount;

    (bool success,)=receiver.call{value:_WithdrawalAmount}("");
    require(success,"transfer failed");

   }
   function approve(address spender ,uint256 amount) public returns (bool){

      allowance[msg.sender][spender] = amount;
      return true ;
   }
   function transfer (address from,address to ,uint256 amount)internal{
      amountFunded[from] -= amount;
      amountFunded[to] += amount;
   }
   function TransferFrom(address from ,address to ,uint256 amount) public returns (bool){
      require(allowance[from][msg.sender]>= amount);
    allowance [from][msg.sender] -= amount;

    transfer(from ,to,amount);
    return true;
   }

   }

