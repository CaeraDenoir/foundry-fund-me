//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";
import {FundFundMe} from "../../script/Interactions.s.sol";
contract FundMeTestIntegration is Test{
    FundMe fundMe;
    DeployFundMe deployFundMe;
    address USER = makeAddr("user");
    uint256 constant SEND_VALUE = 0.1 ether;
    uint256 constant STARTING_BALANCE = 100 ether;

    function setUp() external {
        deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
        
    }
    function testUserCanFundInteractions() public {
        //checks the user can fund the contract
        FundFundMe fundFundMe = new FundFundMe();
        fundFundMe.fundFundMe(address(fundMe));
        address funder = fundMe.getFunder(0);
        assertEq(funder, address(msg.sender));
    }
    function testOwnerCanWithdrawInteractions() public {
        //checks the owner can withdraw the funds
        FundFundMe withdrawFundMe = new FundFundMe();
        withdrawFundMe.withdrawFundMe(address(fundMe));
    }
}