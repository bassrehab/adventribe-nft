// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

import "../../contracts/mocks/adv-nf-token-mock.sol";
import "./adv-nf-token-receiver-test-mock.sol";

contract ConstructSelfSend is
  NFTokenReceiverTestMock
{
  uint constant TOKEN_ID = 1;

  constructor()
  {
    ADVNFTokenMock tokens = new ADVNFTokenMock();
    tokens.mint(address(this), TOKEN_ID);
    tokens.safeTransferFrom(address(this), address(this), TOKEN_ID);
  }

}
