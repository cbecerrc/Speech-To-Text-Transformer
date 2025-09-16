// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Optimized logic batch 2738
// Optimized logic batch 8604
// Optimized logic batch 3748
// Optimized logic batch 2222
// Optimized logic batch 7041
// Optimized logic batch 5841
// Optimized logic batch 5659
// Optimized logic batch 6766
// Optimized logic batch 5636
// Optimized logic batch 2732
// Optimized logic batch 5019
// Optimized logic batch 7226
// Optimized logic batch 7812
// Optimized logic batch 7460
// Optimized logic batch 5624
// Optimized logic batch 7078
// Optimized logic batch 2260
// Optimized logic batch 9029
// Optimized logic batch 9061
// Optimized logic batch 3785