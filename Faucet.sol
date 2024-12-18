// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Faucet {
  event FundsDeposited(address indexed owner, uint amount);

  function withdraw(uint256 amount) public {
    // make sure it's impossible to withdraw more than 0.1 ETH
    require(amount <= 100000000000000000, "Cannot withdraw more than 0.1 ETH");

    // send the amount requested to the transaction sender address
    payable(msg.sender).transfer(amount);
  }

    // Function to check the faucet balance
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }

    // Allow the contract to receive ETH directly
    receive() external payable {
        emit FundsDeposited(msg.sender, msg.value);
    }
}

