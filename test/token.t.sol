// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Test, console} from "forge-std/Test.sol";
import {Token} from "../src/token.sol";

contract TestToken is Test{
    Token token;
    address user;

    function setUp() public {
        token = new Token();
        user = makeAddr("user");
        vm.deal(user, 20 ether);

    }

    // 100e18 = 100 * 10 ** 18 = 100 ether

    function testTokenName() public {
        assertEq(token.name(), "ISIDS Token");
    }

    function testSymbol() public {
        assertEq(token.symbol(), "ISIDS");
    }

    function testTotalSupply() public{
        assertEq(token.totalSupply(), 100e18);
    }

    function testDeposit() public {
        vm.prank(user);
        token.deposit(10e18);

        assertEq(token.balanceOf(user), 10e18);
        assertEq(token.totalSupply(), 110e18);

    }

    function testWithdraw() public {
        vm.startPrank(user);
        token.deposit(10e18);
        token.withdraw(8e18);
        vm.stopPrank();



        assertEq(token.balanceOf(user), 2e18);
        //100+10-8 = 102
        assertEq(token.totalSupply(), 102e18);
    }

}