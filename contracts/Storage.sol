// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/**
 * @title UserManagement
 * @dev A basic user management system with access control and events.
 */
contract UserManagement {
    address owner;

    struct User {
        uint256 id;
        string name;
        uint256 age;
    }

    mapping(address => User) private users;
    mapping(uint256 => address) private userIds;
    uint256 private nextId;

    event UserAdded(address indexed userAddress, uint256 userId, string name, uint256 age);
    event UserRemoved(address indexed userAddress, uint256 userId);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    modifier userExists(address userAddress) {
        require(users[userAddress].id != 0, "User does not exist");
        _;
    }

    constructor() {
        owner = msg.sender;
        nextId = 1;
    }

    function addUser(address userAddress, string memory name, uint256 age) public onlyOwner {
        require(users[userAddress].id == 0, "User already exists");
        users[userAddress] = User(nextId, name, age);
        userIds[nextId] = userAddress;
        emit UserAdded(userAddress, nextId, name, age);
        nextId++;
    }

    function removeUser(address userAddress) public onlyOwner userExists(userAddress) {
        uint256 userId = users[userAddress].id;
        delete users[userAddress];
        delete userIds[userId];
        emit UserRemoved(userAddress, userId);
    }

    function getUser(address userAddress) public view userExists(userAddress) returns (uint256, string memory, uint256) {
        User memory user = users[userAddress];
        return (user.id, user.name, user.age);
    }

    function getUserById(uint256 userId) public view returns (address, string memory, uint256) {
        address userAddress = userIds[userId];
        require(userAddress != address(0), "User ID does not exist");
        User memory user = users[userAddress];
        return (userAddress, user.name, user.age);
    }
}
