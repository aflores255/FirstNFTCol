// 1. License
//SPDX-License-Identifier: UNLICENSED

//2. Solidity
pragma solidity 0.8.28;

//3. Contract
import "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Strings} from "../lib/openzeppelin-contracts/contracts/utils/Strings.sol";

contract FloNFTCollection is ERC721{
using Strings for uint256;
// Variables definition
uint256 public currentTokenId; //0
uint256 public NFTCollectionSupply;
string public baseUri;
//Events
event MintNFT(address address_, uint256 tokenId_);
// Constructor
constructor(string memory name_, string memory symbol_,uint256 NFTCollectionSupply_,string memory baseURI_) ERC721(name_,symbol_){
    NFTCollectionSupply=NFTCollectionSupply_;
    baseUri = baseURI_;
}

// Functions

function safeMint() external{
    require(currentTokenId<NFTCollectionSupply,"Max Supply reached");
    _safeMint(msg.sender, currentTokenId);
    uint256 actualId = currentTokenId;
    currentTokenId++;
    emit MintNFT(msg.sender, actualId);
}

function _baseURI() internal override view virtual returns (string memory) {
        return baseUri;
    }

 function tokenURI(uint256 tokenId) public override view virtual returns (string memory) {
        _requireOwned(tokenId);

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string.concat(baseURI, tokenId.toString(),".json") : "";
    }

}