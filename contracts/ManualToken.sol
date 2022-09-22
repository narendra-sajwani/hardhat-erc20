// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ManualToken {
    uint256 initialSupply;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    // transfer tokens => subtract the amount from 'from' address and add to 'to' address
    function transfer(
        address from,
        address to,
        uint256 amount
    ) public {
        balanceOf[from] -= amount;
        balanceOf[to] += amount;
    }

    // to take funds from 'from' address
    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {
        // Check allowance of the caller to take funds from '_from' account
        require(_value <= allowance[_from][msg.sender]);
        allowance[_from][msg.sender] -= _value;
        transfer(_from, _to, _value);
        success = true;
    }
}
