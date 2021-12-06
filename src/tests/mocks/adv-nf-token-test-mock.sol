// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

import "../../contracts/mocks/adv-nf-token-mock.sol";

contract ADVNFTokenTestMock is
ADVNFTokenMock
{

 /**
   * @dev Removes a NFT from owner.
   * @param _tokenId Which NFT we want to remove.
   */
  function burn(
    uint256 _tokenId
  )
    external
    onlyOwner
  {
    super._burn(_tokenId);
  }

}
