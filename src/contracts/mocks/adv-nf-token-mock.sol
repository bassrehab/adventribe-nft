// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

import "../../contracts/tokens/adv-nf-token.sol";
import "../ownership/ownable.sol";

/**
 * @dev This is an example contract implementation of NFToken.
 */
contract ADVNFTokenMock is
ADVNFToken,
  Ownable
{

  /**
   * @dev Mints a new NFT.
   * @param _to The address that will own the minted NFT.
   * @param _tokenId of the NFT to be minted by the msg.sender.
   */
  function mint(
    address _to,
    uint256 _tokenId
  )
    external
    onlyOwner
  {
    super._mint(_to, _tokenId);
  }

}
