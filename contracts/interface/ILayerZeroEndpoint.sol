// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ILayerZeroEndpoint {
    function send(
        uint16 _dstChainId,               // 目标链的ID
        bytes calldata _destination,      // 目标地址（目标合约地址）
        bytes calldata _payload,          // 传输的负载（函数调用数据）
        address payable _refundAddress,   // 退款地址
        address _zroPaymentAddress,       // zro支付地址
        bytes calldata _adapterParams     // 适配器参数
    ) external payable;
    
    // 其他LayerZero接口方法
}
