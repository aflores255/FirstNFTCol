//1. License
// SPDX-License-Identifier: UNLICENSED

//2. Solidity
pragma solidity 0.8.28;

import "forge-std/Test.sol";
import "src/FloNFTCollection.sol";

//3. Contract
contract FloNFTCollectionTest is Test {
    
    FloNFTCollection nftCollection;
    address user = vm.addr(1);
    uint256 constant MAX_SUPPLY = 5;
    string constant BASE_URI = "ipfs://example/";

    function setUp() public {
        nftCollection = new FloNFTCollection("FloNFT", "FLO", MAX_SUPPLY, BASE_URI);
    }

    // test Supply
    function testInitialSupply() public view {
        assert(nftCollection.NFTCollectionSupply() == MAX_SUPPLY);
    }

    // Test mint
    function testMintNFT() public {
        vm.startPrank(user);
        nftCollection.safeMint();
        assert(nftCollection.ownerOf(0) == user);
        vm.stopPrank();
    }

    // Test mint different users
    function testMintNFTDifferentUsers() public {

       for (uint256 i = 0; i < MAX_SUPPLY; i++) {
            address userMint = vm.addr(i + 1);
            vm.prank(userMint);
            nftCollection.safeMint();
            assert(nftCollection.ownerOf(i) == userMint);
        }
    }

    function testMintUpToMaxSupply() public {
        vm.startPrank(user);
        for (uint256 i = 0; i < MAX_SUPPLY; i++) {
            nftCollection.safeMint();
        }

        vm.expectRevert("Max Supply reached");
        nftCollection.safeMint();
        vm.stopPrank();
    }

    function testTokenURI() public {
        vm.startPrank(user);
        nftCollection.safeMint();

        string memory expectedURI = string.concat(BASE_URI, "0.json");
        assertEq(nftCollection.tokenURI(0),expectedURI);
        vm.stopPrank();
    }
}