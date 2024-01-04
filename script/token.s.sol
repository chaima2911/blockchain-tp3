// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {Token} from "../src/token.sol";

contract TokenScript is Script {

    Token token;

    function run() public {
        vm.startBroadcast();
        token = new Token();
        vm.stopBroadcast();

    }
}