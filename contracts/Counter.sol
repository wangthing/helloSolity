// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    // 定义一个状态变量来存储计数值
    uint256 public count;

    // 构造函数，初始化计数值为0
    constructor() {
        count = 0;
    }

    // 定义一个函数，用于计数+1
    function increment() public {
        count += 1;
    }
}
