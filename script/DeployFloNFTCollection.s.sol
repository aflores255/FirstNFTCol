// 1. License
//SPDX-License-Identifier: UNLICENSED

//2. Solidity
pragma solidity 0.8.28;

//3. Contract

import {Script} from "forge-std/Script.sol";
import {FloNFTCollection} from "../src/FloNFTCollection.sol";

contract DeployFloNFTCollection is Script {
    function run() external returns (FloNFTCollection) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        string memory name_ = "Flo Collection NFT";
        string memory symbol_ = "FLO";
        uint256 NFTCollectionSupply_ = 5;
        string memory baseURI_ = "ipfs://bafybeig4gvg4nsxzpwtkwslxlxldorkivp5puhujlaqwbji3gr6k2cwbye/";
        FloNFTCollection floNFTCollection = new FloNFTCollection(name_, symbol_, NFTCollectionSupply_, baseURI_);
        vm.stopBroadcast();
        return floNFTCollection;
    }
}
