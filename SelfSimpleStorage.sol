// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract selfSimpleStorage{


    string  Name = "Prajjval";
    bool Alive = true;
    uint256  Age = 19;
    string MaritalStatus = "unmarried";
    string  Gender = "male";
    uint256 height = 6;
     mapping(string=>credentials) public NameToCredentials;

     struct credentials{
        string Name;
        bool Alive;
        uint256 Age;
        string MaritalStatus;
        string Gender;
        uint256 Height;
     }

     function StoreDetails(string memory _Name,bool _Alive,uint256 _Age ,string memory _MaritalStatus,string memory _Gender,uint256 _Height)public {

        
        NameToCredentials[Name] = credentials(_Name,
                                              _Alive ,
                                              _Age ,
                                              _MaritalStatus ,
                                              _Gender,
                                              _Height );
        
    }
    

 
}
