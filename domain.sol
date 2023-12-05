//1.SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
contract EthAvax{

    mapping(address=> uint) public balanceOf;
    uint internal length;
    address owner;
    function domain_length_check(string memory str)public returns(uint) {
       bytes memory strBytes = bytes(str);
       length=strBytes.length;
       require(length>=3 && length<=10,"The length of the domain should be within 3 to 10 characters");
       return length;
    }
    function domain_mint_check()public view returns(string memory){
        if(balanceOf[msg.sender]<length*5){
            revert("Insufficient funds");
        }
        else{
            return "Domain can be minted";
        }
    }
    function range_define()public view returns(string memory){
        assert(msg.sender==owner);
        domain_mint_check();
        return "Domain Minted successfully";
    }
}
