// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

import "../tokens/adv-nf-token-metadata.sol";
import "../tokens/adv-nf-token-enumerable.sol";
import "../ownership/ownable.sol";

/**
 * @dev This is an example contract implementation of NFToken with enumerable and metadata
 * extensions.
 */
contract ADVNFTokenMetadataEnumerableMock is
ADVNFTokenEnumerable,
ADVNFTokenMetadata,
  Ownable
{

  /**
   * @dev Contract constructor.
   * @param _name A descriptive name for a collection of NFTs.
   * @param _symbol An abbreviated name for NFTokens.
   */
  constructor(
    string memory _name,
    string memory _symbol
  )
  {
    nftName = _name;
    nftSymbol = _symbol;
  }

  /**
   * @dev Mints a new NFT.
   * @param _to The address that will own the minted NFT.
   * @param _tokenId of the NFT to be minted by the msg.sender.
   * @param _uri String representing RFC 3986 URI.
   */
  function mint(
    address _to,
    uint256 _tokenId,
    string calldata _uri
  )
    external
    onlyOwner
  {
    super._mint(_to, _tokenId);
    super._setTokenUri(_tokenId, _uri);
  }

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

  /**
   * @dev Mints a new NFT.
   * @notice This is an internal function which should be called from user-implemented external
   * mint function. Its purpose is to show and properly initialize data structures when using this
   * implementation.
   * @param _to The address that will own the minted NFT.
   * @param _tokenId of the NFT to be minted by the msg.sender.
   */
  function _mint(
    address _to,
    uint256 _tokenId
  )
    internal
    override(ADVNFToken, ADVNFTokenEnumerable)
    virtual
  {
    ADVNFTokenEnumerable._mint(_to, _tokenId);
  }

  /**
   * @dev Burns a NFT.
   * @notice This is an internal function which should be called from user-implemented external
   * burn function. Its purpose is to show and properly initialize data structures when using this
   * implementation. Also, note that this burn implementation allows the minter to re-mint a burned
   * NFT.
   * @param _tokenId ID of the NFT to be burned.
   */
  function _burn(
    uint256 _tokenId
  )
    internal
    override(ADVNFTokenMetadata, ADVNFTokenEnumerable)
    virtual
  {
    ADVNFTokenEnumerable._burn(_tokenId);
    if (bytes(idToUri[_tokenId]).length != 0)
    {
      delete idToUri[_tokenId];
    }
  }

  /**
   * @notice Use and override this function with caution. Wrong usage can have serious consequences.
   * @dev Removes a NFT from an address.
   * @param _from Address from wich we want to remove the NFT.
   * @param _tokenId Which NFT we want to remove.
   */
  function _removeNFToken(
    address _from,
    uint256 _tokenId
  )
    internal
    override(ADVNFToken, ADVNFTokenEnumerable)
  {
    ADVNFTokenEnumerable._removeNFToken(_from, _tokenId);
  }

  /**
   * @notice Use and override this function with caution. Wrong usage can have serious consequences.
   * @dev Assigns a new NFT to an address.
   * @param _to Address to wich we want to add the NFT.
   * @param _tokenId Which NFT we want to add.
   */
  function _addNFToken(
    address _to,
    uint256 _tokenId
  )
    internal
    override(ADVNFToken, ADVNFTokenEnumerable)
  {
    ADVNFTokenEnumerable._addNFToken(_to, _tokenId);
  }

   /**
   * @dev Helper function that gets NFT count of owner. This is needed for overriding in enumerable
   * extension to remove double storage(gas optimization) of owner nft count.
   * @param _owner Address for whom to query the count.
   * @return Number of _owner NFTs.
   */
  function _getOwnerNFTCount(
    address _owner
  )
    internal
    override(ADVNFToken, ADVNFTokenEnumerable)
    view
    returns (uint256)
  {
    return ADVNFTokenEnumerable._getOwnerNFTCount(_owner);
  }

}
