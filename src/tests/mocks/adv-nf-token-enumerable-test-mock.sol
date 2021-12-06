// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

import "../../contracts/mocks/adv-nf-token-enumerable-mock.sol";

contract ADVNFTokenEnumerableTestMock is
ADVNFTokenEnumerableMock
{

  function ownerToIdsLen(
    address _owner
  )
    external
    view
    returns (uint256)
  {
    return ownerToIds[_owner].length;
  }

  function ownerToIdbyIndex(
    address _owner,
    uint256 _index
  )
    external
    view
    returns (uint256)
  {
    return ownerToIds[_owner][_index];
  }

  function idToOwnerIndexWrapper(
    uint256 _tokenId
  )
    external
    view
    returns (uint256)
  {
    return idToOwnerIndex[_tokenId];
  }

  function idToIndexWrapper(
    uint256 _tokenId
  )
    external
    view
    returns (uint256)
  {
    return idToIndex[_tokenId];
  }

}
