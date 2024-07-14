// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ERC20 {
    uint public totalSupply;
    mapping(address=>uint) public balanceOf;
    mapping(address=>mapping(address => uint)) public allowance;
    string public name="TOKEN1";
    string public symbol="TOK1";
    uint8 public decimals=18;

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);

    function transfer(address recipient, uint amount) external returns (bool) {
        require(amount>0, "Amount must be greater than 0");
        require(balanceOf[msg.sender]>=amount,"Insufficient balance");
        balanceOf[msg.sender]-=amount;
        balanceOf[recipient]+=amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function approve(address spender, uint amount) external returns (bool) {
        allowance[msg.sender][spender]=amount;
        emit Approval(msg.sender,spender,amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool) {
        require(allowance[sender][msg.sender]>=amount, "Insufficient allowance");
        require(balanceOf[sender]>=amount, "Insufficient balance");
        allowance[sender][msg.sender]-=amount;
        balanceOf[sender]-=amount;
        balanceOf[recipient]+=amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }

    function mint(uint amount) external {
        require(msg.sender==owner, "Only the owner can mint");
        balanceOf[msg.sender]+=amount;
        totalSupply+=amount;
        emit Transfer(address(0), msg.sender, amount);
    }

    function burn(uint amount) external {
        require(balanceOf[msg.sender]>=amount, "Insufficient balance");
        balanceOf[msg.sender]-=amount;
        totalSupply-=amount;
        emit Transfer(msg.sender, address(0), amount);
    }

    address public owner;

    constructor() {
        owner=msg.sender;
        totalSupply=0;
    }
}