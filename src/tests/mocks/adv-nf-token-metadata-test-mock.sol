// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

import "../../contracts/mocks/adv-nf-token-metadata-mock.sol";

contract ADVNFTokenMetadataTestMock is
ADVNFTokenMetadataMock
{

  constructor(
    string memory _name,
    string memory _symbol
  )
    ADVNFTokenMetadataMock(_name, _symbol)
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
