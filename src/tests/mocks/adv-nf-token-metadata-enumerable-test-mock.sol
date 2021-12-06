// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

import "../../contracts/mocks/adv-nf-token-metadata-enumerable-mock.sol";

contract ADVNFTokenMetadataEnumerableTestMock is
ADVNFTokenMetadataEnumerableMock
{

  constructor(
    string memory _name,
    string memory _symbol
  )
    ADVNFTokenMetadataEnumerableMock(_name, _symbol)
  {
  }

  function checkUri(
    uint256 _tokenId
  )
    external
    view
    returns (string memory)
  {
    return idToUri[_tokenId];
  }

}
