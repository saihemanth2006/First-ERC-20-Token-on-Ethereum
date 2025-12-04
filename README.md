# MyToken (MTK)

## Overview
**MyToken (MTK)** is a simple ERC-20 compliant cryptocurrency token built on the Ethereum blockchain.  
This project was created to understand how smart contracts, blockchain transactions, and token standards work in practice.

ERC-20 tokens follow a standard interface that ensures compatibility with wallets, exchanges, and decentralized applications.  
Thousands of cryptocurrencies such as USDT, LINK, and UNI follow this standard, and this project demonstrates the core logic behind them.

---

## Token Details
| Property       | Value                    |
|----------------|---------------------------|
| **Name**       | MyToken                   |
| **Symbol**     | MTK                       |
| **Decimals**   | 18                        |
| **Total Supply** | 1,000,000 MTK (1 million tokens) |

**Note:**  
Since ERC-20 tokens use 18 decimals, the total supply entered during deployment is:

1,000,000 × 10^18 = 1000000000000000000000000

markdown
Copy code

---

## Features Implemented
This token includes all core ERC-20 functions:

### ✅ **Core ERC-20 Functionalities**
- `balanceOf` – Check balance of any address  
- `transfer` – Send tokens to another address  
- `approve` – Authorize someone else to spend your tokens  
- `allowance` – Check how much someone is allowed to spend  
- `transferFrom` – Spend approved tokens on someone’s behalf  

### ✅ **Events (for transparency)**
- `Transfer`  
- `Approval`

### ✅ **Security Checks**
- Prevent transferring to zero address  
- Prevent transferring more than balance  
- Prevent spending more than approved allowance  

### ✅ **Helper Functions**
- `getTotalSupply()`
- `getTokenInfo()`

---

## How to Deploy the Token (Using Remix IDE)

### **1. Open Remix**
Visit: https://remix.ethereum.org/

### **2. Create Contract File**
- Go to **File Explorer**
- Create a new file named: `MyToken.sol`
- Paste the full smart contract code

### **3. Compile the Contract**
- Open **Solidity Compiler** tab  
- Select version **0.8.x**  
- Click **Compile MyToken.sol**

### **4. Deploy the Contract**
1. Open **Deploy & Run Transactions**  
2. Environment: **JavaScript VM**  
3. In constructor input, enter total supply:  
1000000000000000000000000

markdown
Copy code
4. Click **Deploy**

### **5. Interact with Contract**
Under **Deployed Contracts**, you can now call:
- name
- symbol
- decimals
- totalSupply
- balanceOf
- transfer
- approve
- transferFrom

---

## Usage Examples

### **1. Check Balance**
```solidity
balanceOf(0xYourAddress)
2. Transfer Tokens
solidity
Copy code
transfer(0xRecipientAddress, 1000000000000000000)   // 1 MTK
3. Approve Someone to Spend on Your Behalf
solidity
Copy code
approve(0xSpenderAddress, 5000000000000000000)     // 5 MTK
4. Spend Tokens via Allowance
(Executed from the spender’s account)

solidity
Copy code
transferFrom(0xOwnerAddress, 0xReceiverAddress, 2000000000000000000)  // 2 MTK
5. View Allowance
solidity
Copy code
allowance(0xOwnerAddress, 0xSpenderAddress)
Testing Performed
1. Basic Transfer Test
Sent 1 MTK from Account 1 to Account 2

Verified:

Sender balance decreased

Receiver balance increased

Transfer event emitted

2. Approve & transferFrom Test
Account 1 approved Account 2 to spend 5 MTK

Account 2 successfully used transferFrom to send 2 MTK to Account 3

Allowance decreased automatically

Transfer event emitted

3. Edge Case Testing
Test Case	Expected	Result
Transfer > balance	Revert	Passed
transferFrom > allowance	Revert	Passed
Transfer to zero address	Revert	Passed
Approve zero address	Revert	Passed
Transfer exact balance	Success	Passed