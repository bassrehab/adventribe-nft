// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

import "./tokens/adv-nf-token-metadata.sol"
import "./ownership/ownable.sol"

contract adventribeNFT is ADVNFTokenMetadata, Ownable {

    constructor() {
        nftName = "Adventribe NFT";
        nftSymbol = "ADV";
    }

    function mint(address _to
        , uint256 _tokenId
        , string calldata _uri
        )
        external onlyOwner {
            super._mint(_to, _tokenId);
            super._setTokenUri(_tokenId, _uri);
        }

}
