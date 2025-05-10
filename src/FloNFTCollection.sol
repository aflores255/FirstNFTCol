// 1. License
//SPDX-License-Identifier: UNLICENSED

//2. Solidity
pragma solidity 0.8.28;

//3. Contract
import "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Strings} from "../lib/openzeppelin-contracts/contracts/utils/Strings.sol";

contract FloNFTCollection is ERC721 {
    using Strings for uint256;

    // Variables definition
    uint256 public currentTokenId; //0
    uint256 public NFTCollectionSupply;
    string public baseUri;

    //Events
    event MintNFT(address address_, uint256 tokenId_);

    /**
     * /* @notice Constructor of smart contract
     * /* @param name_ Name of the NFT Collection
     * /* @param symbol_ Symbol of the NFT Collection
     * /* @param NFTCollectionSupply_ Maximum number of NFTs that can be minted
     * /* @param baseURI_ Base URI used to construct the metadata URI for each token
     */
    constructor(string memory name_, string memory symbol_, uint256 NFTCollectionSupply_, string memory baseURI_)
        ERC721(name_, symbol_)
    {
        NFTCollectionSupply = NFTCollectionSupply_;
        baseUri = baseURI_;
    }

    // Functions
    /**
     * @notice Mints a new NFT to the caller's address.
     * @dev Ensures that the total supply does not exceed the predefined maximum.
     * Emits a {MintNFT} event upon successful minting.
     * Requirements:
     * - The current total supply must be less than the maximum supply.
     */
    function safeMint() external {
        require(currentTokenId < NFTCollectionSupply, "Max Supply reached");
        _safeMint(msg.sender, currentTokenId);
        uint256 actualId = currentTokenId;
        currentTokenId++;
        emit MintNFT(msg.sender, actualId);
    }

    /**
     * @notice Returns the base URI used for computing {tokenURI}.
     * @dev Overrides the OpenZeppelin ERC721 implementation to return a custom base URI.
     * @return The base URI string set during contract deployment.
     */
    function _baseURI() internal view virtual override returns (string memory) {
        return baseUri;
    }

    /**
     * @notice Returns the metadata URI for a given token ID.
     * @return A string representing the full metadata URI of the token.
     */
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        _requireOwned(tokenId);

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string.concat(baseURI, tokenId.toString(), ".json") : "";
    }
}
