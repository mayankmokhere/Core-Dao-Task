# Core-Dao-Task
Hacker House Goa Task Submission by Team : RUST.io
# UserManagement Solidity Contract

## Overview

The `UserManagement` contract is a basic user management system implemented in Solidity. It allows the contract owner to add, remove, and retrieve user information. This project includes a smart contract and a deployment script to interact with it using Hardhat.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Contract Overview](#contract-overview)
   
## Prerequisites

- Node.js
- npm (Node Package Manager)
- Hardhat

## Contract Overview

The `UserManagement` contract allows for managing user data on the Ethereum blockchain.

### Contract: UserManagement.sol

- **Structs**:
  - `User`: Stores user details such as `id`, `name`, and `age`.

- **Mappings**:
  - `users`: Maps an address to a `User` struct.
  - `userIds`: Maps a user ID to an address.

- **Events**:
  - `UserAdded`: Emitted when a new user is added.
  - `UserRemoved`: Emitted when a user is removed.

- **Modifiers**:
  - `onlyOwner`: Ensures only the contract owner can call certain functions.
  - `userExists`: Checks if a user exists before executing a function.

- **Functions**:
  - `addUser(address userAddress, string memory name, uint256 age)`: Adds a new user.
  - `removeUser(address userAddress)`: Removes an existing user.
  - `getUser(address userAddress)`: Retrieves user information by address.
  - `getUserById(uint256 userId)`: Retrieves user information by user ID.
  - `getOwner()`: Returns the contract owner.

### Contract Deployment and Interaction

#### deploy-and-call.js

This script deploys the `UserManagement` contract and interacts with it by:
1. Deploying the contract.
2. Adding a user.
3. Retrieving and logging user information.
4. Removing the user.
5. Attempting to retrieve the user information again to demonstrate error handling.

## License

This project is licensed under the MIT License.

---
