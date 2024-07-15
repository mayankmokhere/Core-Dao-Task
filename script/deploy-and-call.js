const hre = require("hardhat");

async function main() {
  const UserManagement = await hre.ethers.getContractFactory("UserManagement");
  const userManagement = await UserManagement.deploy();

  await userManagement.deployed();
  console.log("UserManagement contract deployed to:", userManagement.address);

  // Add a new user
  console.log("Adding user...");
  let tx = await userManagement.addUser("0x1234567890abcdef1234567890abcdef12345678", "Alice", 30);
  await tx.wait();

  // Retrieve the user information
  let userInfo = await userManagement.getUser("0x1234567890abcdef1234567890abcdef12345678");
  console.log(`User info: ID=${userInfo[0]}, Name=${userInfo[1]}, Age=${userInfo[2]}`);

  // Remove the user
  console.log("Removing user...");
  tx = await userManagement.removeUser("0x1234567890abcdef1234567890abcdef12345678");
  await tx.wait();

  // Attempt to retrieve the user information again (should fail)
  try {
    userInfo = await userManagement.getUser("0x1234567890abcdef1234567890abcdef12345678");
    console.log(`User info: ID=${userInfo[0]}, Name=${userInfo[1]}, Age=${userInfo[2]}`);
  } catch (error) {
    console.error("User does not exist.");
  }
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
