// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SC_B {
    event Deposit(bytes32 indexed TrSC_A, bytes32 indexed Trproof, bytes32 S, uint256 timestamp);
    event NotifyRecipient(address recipient, bytes32 psi);

    function AuditConsolidation(bytes32 TrSC_A, bytes32 Trproof, bytes32 S1, bytes32 S2, bytes32 psi) public {
        bytes32 S = keccak256(abi.encodePacked(S1, S2, psi));

        emit Deposit(TrSC_A, Trproof, S, block.timestamp);

        address AddrU = msg.sender;

        call_recipient(AddrU, psi);
    }

    function call_recipient(address recipient, bytes32 psi) internal {
        emit NotifyRecipient(recipient, psi);
    }
}
