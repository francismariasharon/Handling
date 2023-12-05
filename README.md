# Error Handling in Solidity

The EthAvax Domain Registrar is a Solidity smart contract that enables users to mint domains on the Ethereum blockchain. The contract is designed to manage domain ownership and ensure that certain conditions are met before allowing the minting of a domain. This includes a domain length check and a balance check to ensure users have sufficient funds to mint a domain.

## Description
### Features
Domain Length Check: The contract performs a length check on the provided domain string, ensuring it falls within the specified range of 3 to 10 characters.

Domain Mint Check: Before allowing domain minting, the contract checks the balance of the user. Users must have a balance greater than or equal to the product of the domain length and a predefined factor (in this case, 5).

Owner Privileges: Certain functions, such as defining the range for domain minting, can only be executed by the contract owner.

### Functions
domain_length_check(string memory str): Performs a domain length check and returns the length of the provided domain string.

domain_mint_check(): Checks the balance of the caller to determine if they have sufficient funds to mint a domain.

range_define(): Allows the owner to define the range for domain minting after performing necessary checks.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., domain.sol). Copy and paste the following code into the file:

```javascript
pragma solidity ^0.8.18;

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
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.18" (or another compatible version), and then click on the "Compile domain.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "domain" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it .
## Authors

Francis MS

@francismariasharon@gmail.com

## License

This project is licensed under the [MIT] License - see the LICENSE.md file for details
