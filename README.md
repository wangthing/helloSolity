# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a Hardhat Ignition module that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat ignition deploy ./ignition/modules/Lock.js
```


// 替换为你的 Counter 合约地址
const contractAddress = "0x1234...abcd";

// 获取 Counter 合约实例
const Counter = await ethers.getContractAt("Counter", contractAddress);

// 读取 count 值
const currentCount = await Counter.count();
console.log("当前 count 值:", currentCount.toString());

// 调用 increment 方法增加 count
const tx = await Counter.increment();
await tx.wait();  // 等待交易完成

// 再次读取 count 值
const newCount = await Counter.count();
console.log("新的 count 值:", newCount.toString());