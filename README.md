##Avalanche subnets

## Description

This project includes an ERC20 token contract and a vault contract. The ERC20 token contract provides standard functionalities for creating, transferring, and approving tokens. The vault contract allows users to deposit ERC20 tokens and receive shares in return, which can be withdrawn later. This system can be used to create a decentralized finance (DeFi) application where users can lock their tokens and earn shares representing their stake in the vault.

## Getting Started

### Prerequisites

* Remix compiler


### Executing program

* Compile the smart contracts:
   
* Deploy the ERC20 token contract:

* Deploy the vault contract, passing the ERC20 token contract address:
   

## Usage

### Interacting with the Contracts

1. **Minting Tokens**: Only the owner can mint new tokens.
    ```javascript
    // Example of minting tokens in Hardhat console
    const token = await ERC20.deployed();
    await token.mint(1000);
    ```

2. **Transferring Tokens**: Transfer tokens to another address.
    ```javascript
    await token.transfer(recipient_address, amount);
    ```

3. **Approving Allowance**: Approve an allowance for another address.
    ```javascript
    await token.approve(spender_address, amount);
    ```

4. **Depositing Tokens in Vault**: Deposit tokens into the vault to receive shares.
    ```javascript
    const vault = await Vault.deployed();
    await vault.deposit(amount);
    ```

5. **Withdrawing Tokens from Vault**: Withdraw tokens from the vault by burning shares.
    ```javascript
    await vault.withdraw(shares);
    ```

## Help

Any advice for common problems or issues.

* Verify that you have sufficient ETH in your wallet for deploying the contracts.
* If you encounter issues with deployments, check the contract addresses and parameters passed during deployment.

## Authors

-Jiya Mittal

## License

This project is licensed under the MIT License 
