// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract MyWallet{

address public  owner;
address [] public Funders ;
mapping (address => uint256) amountFunded;

    function fund()public payable{
       Funders.push(msg.sender);
       amountFunded[msg.sender] +=msg.value;


    }
      constructor(){
       owner = msg.sender ;
       

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
}
