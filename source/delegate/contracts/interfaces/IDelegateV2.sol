/*
  Copyright 2020 Swap Holdings Ltd.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
*/


pragma solidity 0.5.12;
pragma experimental ABIEncoderV2;

import "@airswap/types/contracts/Types.sol";

interface IDelegateV2 {

  struct Rule {
    uint256 senderAmount;
    uint256 signerAmount;
    uint256 nextRuleID;
    uint256 prevRuleID;
  }

  event SetRule(
    address indexed owner,
    address indexed senderToken,
    address indexed signerToken,
    uint256 senderAmount,
    uint256 signerAmount
  );

  event UnsetRule(
    address indexed owner,
    uint256 indexed ruleID,
  );

  event ProvideOrder(
    address indexed owner,
    address tradeWallet,
    address indexed senderToken,
    address indexed signerToken,
    uint256 senderAmount,
    uint256 signerAmount,
  );

  function setRule(
    address senderToken,
    address signerToken,
    uint256 senderAmount,
    uint256 signerAmount
  ) external;

  function unsetRule(
    uint256 ruleID
  ) external;

  function provideOrder(
    Types.Order calldata order
  ) external;

  function getSignerSideQuote(
    uint256 senderAmount,
    address senderToken,
    address signerToken
  ) external view returns (
    uint256 signerAmount
  );

  function getSenderSideQuote(
    uint256 signerAmount,
    address signerToken,
    address senderToken
  ) external view returns (
    uint256 senderAmount
  );

  function getMaxQuote(
    address senderToken,
    address signerToken
  ) external view returns (
    uint256 senderAmount,
    uint256 signerAmount
  );

  function owner()
    external view returns (address);

  function tradeWallet()
    external view returns (address);

}
