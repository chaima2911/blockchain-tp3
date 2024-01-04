// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import {ERC20} from "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20("ISIDS Token", "ISIDS"){
    error InsufficientBalance(uint requestedAmount, uint availableAmount);

    constructor () {
        _mint(msg.sender, 100e18); //1e18 = 10 ** 18
    }


    function deposit(uint amount) external payable {
        _mint(msg.sender, amount);
    }

    function withdraw(uint amount) external {
        if(balanceOf(msg.sender)< amount){
            revert InsufficientBalance(amount, balanceOf(msg.sender));
        }
        transfer(msg.sender, amount);
        _burn(msg.sender, amount);
        
    }

    function fallback() external payable {
    }

    receive() external payable {
    }

}