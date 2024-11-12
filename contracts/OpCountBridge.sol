// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./interface/ILayerZeroEndpoint.sol";

contract OpCountBridge {
    ILayerZeroEndpoint public endpoint; // 0x6EDCE65403992e310A62460808c4b910D972f10f
    uint16 public targetChainId; // Sepolia的LayerZero链ID 40161
    address public targetCounterAddress; // Sepolia上的Counter合约地址 0xa1A528aD33017276ea65a144705F0e4e739198Ca

    constructor(address _endpoint, uint16 _targetChainId, address _targetCounterAddress) {
        endpoint = ILayerZeroEndpoint(_endpoint);
        targetChainId = _targetChainId;
        targetCounterAddress = _targetCounterAddress;
    }

    // 在OpSepolia上调用此函数，发起跨链请求
    function incrementCounterOnOpSepolia() external payable {
        bytes memory payload = abi.encodeWithSignature("increment()");
        
        endpoint.send{value: msg.value}(
            targetChainId,             // 目标链的ID
            abi.encodePacked(targetCounterAddress),  // 目标合约地址
            payload,                   // 发送的负载（目标函数调用）
            payable(msg.sender),       // refund address
            address(0x0),              // zro payment address (LayerZero收费代币)
            bytes("")                  // 传递给relayer的适配器参数
        );
    }

    // 接收链上的跨链消息回调（用于确认消息已被目标链执行）
    function lzReceive() external view {
        require(msg.sender == address(endpoint), "Invalid endpoint caller");
        // 可以在此实现确认逻辑
        
    }
}
