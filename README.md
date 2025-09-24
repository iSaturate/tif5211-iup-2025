# TIF5211 - Special Topics for Information Technology  

## Project Assignment 1: My First Smart Contract  
**Due Date:** Monday October 6, 2025, at 23.59

**Submission:** Submit your work by making a pull request to this GitHub repository. The PR must include all required files and documentation as described below. 


## 1. Introduction & Background  
In our lectures, we have discussed the foundational concepts of blockchain, distributed ledger technology, and smart contracts. We've explored how smart contracts can automate processes and create trustless agreements on a decentralized network like Ethereum.  

The purpose of this assignment is to move from theory to practice. You will get hands-on experience with the fundamental lifecycle of a decentralized application (dApp): writing, compiling, deploying, and interacting with a smart contract. You will use modern, industry-standard tools to deploy your contract onto the Sepolia Ethereum testnet, a public testing environment that mimics the real Ethereum network without using real money. 

## 2. Learning Objectives  
Upon successful completion of this assignment, you will be able to:  

- Write a basic smart contract using the Solidity programming language.  
- Understand and use state variables, functions, mappings, and events in Solidity.  
- Use the Remix IDE, a popular web-based tool for smart contract development.  
- Set up and use a MetaMask wallet to manage accounts and sign transactions.  
- Acquire test Ether from a public faucet.  
- Deploy a smart contract to a public Ethereum testnet (Sepolia).  
- Interact with your deployed smart contract's functions.  
- Verify your smart contract's source code on a block explorer (Etherscan).  

## 3. The Task: "Proof of Existence" Smart Contract  
You are tasked with creating a simple digital notary smart contract. The concept is straightforward: anyone can record the existence of a digital document at a specific point in time without revealing the document's contents. This is done by storing a cryptographic hash of the document on the blockchain. Because of the blockchain's immutable nature, this creates a permanent, timestamped proof that the document existed in that exact state.

There is a short tutorial in the [tutorial](./tutorial/) folder that may help you to get started in Solidity programming.

### Contract Requirements  
Your Solidity smart contract, named **ProofOfExistence**, must have the following features:  

1. **State Variables:**  
   - An address variable named `owner` to store the address that deployed the contract.  
   - A mapping named `proofs` that links a `bytes32` (the document hash) to a `uint256` (the timestamp of when it was notarized).  

2. **Constructor:**  
   - A constructor function that sets the `owner` variable to `msg.sender`.  

3. **Functions:**  
   - `notarizeDocument(bytes32 _documentHash)`:  
     - Must check if this hash has not already been stored (`require()`).  
     - If new, store it in `proofs` with `block.timestamp`.  
     - Emit a `DocumentNotarized` event.  
   - `verifyDocument(bytes32 _documentHash)`:  
     - Returns `true` if the hash exists (timestamp > 0), else `false`.  

4. **Events:**  
   - `DocumentNotarized`: Logs `msg.sender`, hash, and timestamp.

## 4. Development and Deployment Workflow  

### A. Setup Your Tools  
1. Install **MetaMask**: Create a new wallet and securely store your seed phrase.  
2. Switch to **Sepolia Test Network**.  
3. Get test ETH from [Sepolia Faucet](https://sepoliafaucet.com/). If you are having some issues, drop me [an email](mailto:gdputra@ugm.ac.id) to request for some test ETH. Include your public key in your email.

### B. Write the Contract using Remix IDE  
1. Open [Remix IDE](https://remix.ethereum.org/).  
2. Create `ProofOfExistence.sol`.  
3. Write your smart contract code according to the requirements.  

### C. Compile the Contract  
1. Open **Solidity Compiler** tab.  
2. Select compiler version (e.g., `0.8.20` or newer).  
3. Compile `ProofOfExistence.sol`.  

### D. Deploy to Sepolia Testnet  
1. Open **Deploy & Run Transactions** tab.  
2. Select environment: **Injected Provider - MetaMask**.  
3. Connect MetaMask when prompted.  
4. Select `ProofOfExistence` under "Contract".  
5. Click **Deploy** and confirm transaction in MetaMask.  
6. Wait for transaction to be mined.  

### E. Interact with Your Contract  
1. Generate a Keccak-256 hash at [online tool](https://emn178.github.io/online-tools/keccak_256.html).  
   - Example: `"TIF5211 is awesome"` → prefixed with `0x`.  
2. Call `notarizeDocument` with the hash. Approve in MetaMask.  
3. Call `verifyDocument` with the same hash → should return `true`.  
4. Call `verifyDocument` with a different hash → should return `false`.  

### F. Verify on Etherscan  
1. Open Sepolia Etherscan from your deployment transaction.  
2. Go to contract address → **Contract** tab → **Verify and Publish**.  
3. Select "Single File", compiler version, and "MIT" license.  
4. Paste Solidity source code and complete verification.  

## 5. Submission Requirements  
Submit your work by making a pull request (PR) to this GitHub repository. 

- Create a folder named with your Student ID (e.g., `12345678`) inside the `submission` directory.
- Place all required files inside this folder:
  - `INFO.md` or `README.md` (with your Name and Student ID)
  - `ProofOfExistence.sol` (Solidity source code)
  - `deployment.txt` or `INFO.md` (deployed contract address on Sepolia)
  - Verified contract URL on Sepolia Etherscan (in `deployment.txt` or `INFO.md`)
  - Screenshots:
    - `screenshots/deployment.png` (deployment in Remix)
    - `screenshots/notarize.png` (successful `notarizeDocument` call)
    - `screenshots/verify_true.png` (`verifyDocument` returning true)
    - `screenshots/verify_false.png` (`verifyDocument` returning false)
  - `reflection.md` (Reflection, 150–250 words)
  - Any auxiliary files (such as test scripts, Hardhat config, or additional documentation)

Make sure all files are organized and clearly named in your PR.

You may want to consult the [documentation](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request) from Github to learn how to make a PR.

## 6. Grading Rubric (Total 100 points)  

### Smart Contract Code (40 points)  
- (10) Correct state variables & constructor.  
- (15) `notarizeDocument` works (checks, stores, emits event).  
- (10) `verifyDocument` works as required.  
- (5) Code formatted & commented.  

### Deployment & Interaction (30 points)  
- (10) Contract deployed to Sepolia.  
- (10) Contract verified on Etherscan.  
- (10) Screenshots demonstrate interactions.  

### Report & Reflection (30 points)  
- (10) All required info present & correct.  
- (10) Screenshots clear & relevant.  
- (10) Reflection thoughtful & meets word count.  

---

**Academic Honesty:** All submitted work must be your own. Plagiarism will be dealt with according to university policy.  

Good luck!  
GDP
