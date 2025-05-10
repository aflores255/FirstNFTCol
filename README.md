# 🎨 First ERC-721 Flo NFTCollection

## 📌 **Description**
**FloNFTCollection** is a secure and efficient NFT smart contract built in Solidity using the **Foundry** framework. It implements the ERC-721 standard with a fixed maximum supply, ensuring scarcity and uniqueness across the collection. Leveraging battle-tested libraries from **OpenZeppelin**, the project follows industry best practices for smart contract development and security. Token metadata is served through structured URIs, enabling seamless integration with NFT marketplaces and metadata services. Deployed on the **Arbitrum network**, it offers low gas fees and high-speed transactions—making it ideal for creators, developers, and projects aiming to launch scalable and cost-effective NFT collections.

---

## 🚀 **Features**
| **Feature** | **Description** |
|------------|----------------|
| 🎭 **ERC-721 Standard** | Implements the ERC-721 standard for non-fungible tokens. |
| 🎨 **NFT Minting** | Users can mint NFTs until the maximum collection supply is reached. |
| 🔗 **Base URI** | Metadata URIs are structured as `<baseURI><tokenId>.json`. |
| 📜 **Event Emission** | Emits a `MintNFT` event upon successful minting. |

---

## 📜 **Contract Details**

### 🏗️ **Constructor**
| **Constructor** | **Description** |
|----------------|----------------|
| `constructor(string memory name_, string memory symbol_, uint256 NFTCollectionSupply_, string memory baseURI_)` | Initializes the NFT collection with a name, symbol, maximum supply, and base URI. Sets up ERC-721 inheritance and stores configuration parameters. |

### 📡 **Events**
| **Event** | **Description** |
|-----------|----------------|
| **`MintNFT(address indexed owner, uint256 indexed tokenId)`** | Emitted when a new NFT is minted. |

### 🔧 **Contract Functions**
| **Function** | **Description** |
|------------|----------------|
| **`safeMint()`** | Mints a new NFT to the caller, ensuring supply limits are respected. |
| **`_baseURI()`** | Returns the base URI for metadata storage. |
| **`tokenURI(uint256 tokenId)`** | Returns the full URI for a given token ID. |

---

---

## 🚀 Deployment & Usage

This section demonstrates the functionality of the `FloNFTCollection` contract deployed on the **Arbitrum One** network. It provides step-by-step instructions to interact with the deployed smart contract, including live transaction examples and how to mint your own NFT.

🔗 **Deployed Contract:** [0x55050fc686c301d1709c67309252c8c8b699aba8 on Arbiscan](https://arbiscan.io/address/0x55050fc686c301d1709c67309252c8c8b699aba8)

---

### 📥 How to Interact With the Deployed Contract

1. **Visit the Arbiscan contract page**:  
   [Contract on Arbiscan](https://arbiscan.io/address/0x55050fc686c301d1709c67309252c8c8b699aba8#writeContract)

2. **Connect your Web3 wallet (e.g., MetaMask)**.

3. **Go to "Write Contract" tab**:
   - Locate `safeMint()`
   - Click “Write” and confirm the transaction in your wallet.

4. **Confirm Minting**:  
   After minting, go to the **"Read Contract"** tab or use `tokenURI(tokenId)` to get the metadata URI.

   ✅ Example:
   - Token ID: `0`
   - View token URI: [tokenURI(0)]

5. **Check Events**:
   - View the emitted `MintNFT` event under the **“Contract → Events”** tab.

---

💡 You can use [OpenSea](https://opensea.io/) or other marketplaces that support Arbitrum to preview your NFTs once metadata is available.

## 🧪 **Testing with Foundry**
The contract has been thoroughly tested using Foundry. The test suite verifies minting, supply limits, and metadata retrieval.

### ✅ **Implemented Tests**
| **Test** | **Description** |
|-----------|----------------|
| **`testInitialSupply`** | Ensures the total supply is set correctly at deployment. |
| **`testMintNFT`** | Verifies that an NFT can be minted and assigned correctly. |
| **`testMintNFTDifferentUsers`** | Ensures multiple users can mint NFTs. |
| **`testMintUpToMaxSupply`** | Confirms that minting stops once the max supply is reached. |
| **`testTokenURI`** | Ensures metadata URIs are generated correctly. |

### 📊 Test Coverage

Below is the test coverage report for the main contract. All functions, branches, and statements are fully tested, ensuring reliability and correctness of the core logic.

| **File**                          | **% Lines**      | **% Statements** | **% Branches** | **% Functions** |
|----------------------------------|------------------|------------------|----------------|-----------------|
| `src/FloNFTCollection.sol`       | 100.00% (15/15)  | 100.00% (13/13)  | 100.00% (2/2)  | 100.00% (4/4)   |
---

### 📄 License
This project is UNLICENSED. Modify it as needed for your use case! 