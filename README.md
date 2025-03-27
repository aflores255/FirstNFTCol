# 🎨 FloNFTCollection

## 📌 **Description**
The **FloNFTCollection** is a Solidity-based smart contract for an ERC-721 NFT collection. It allows users to mint unique NFTs until the maximum supply is reached. The contract is built using **OpenZeppelin** for security and standard compliance and tested with **Foundry**.

You can see an example of the deployed contract here: https://arbiscan.io/address/0x55050fc686c301d1709c67309252c8c8b699aba8

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

---

## 🛠️ **How to Use**

### 🔧 **Prerequisites**
- Install **Foundry**: [Installation Guide](https://book.getfoundry.sh/)
- Ensure you have an Ethereum wallet and testnet ETH if deploying.

### 🚀 **Deployment Steps**
1. Clone the project repository.
2. Navigate to the project folder.
3. Install dependencies. 
4. Run the tests.
5. Deploy the contract.

### 📄 License
This project is UNLICENSED. Modify it as needed for your use case! 