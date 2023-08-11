# Estate Ledger

# Estate Ledger Index

- [Introduction](#introduction)
- [Problem Statement](#problem-statement)
- [Solution](#solution)
- [Features](#features)
- [Smart Contracts](#smart-contracts)
- [Future Enhancements](#future-enhancements)
- [Conclusion](#conclusion)
- [Runing Locally](#running-a-haskell-project-using-cabal)
- [Contract Workflow](#smart-contract-workflow)

## Introduction

Real estate is one of the most lucrative investment sectors globally. However, it is often inaccessible to the average individual due to the high entry costs. Estate Ledger aims to change this by tokenizing real-world land assets. This approach allows individuals to invest in real estate at a fraction of the traditional cost, democratizing access to this lucrative sector. The project combines the strengths of blockchain technology, smart contracts, and tokenization to create a unique platform for land acquisition, development, and sales.

## Problem Statement

The traditional real estate industry is fraught with challenges such as high entry barriers, lack of transparency, and inefficiencies in land acquisition and sales processes. These challenges often deter potential investors and make it difficult for landowners to maximize their profits.

## Solution

Estate Ledger offers a blockchain-based solution that tokenizes real-world land assets. By tokenizing land into either stablecoins or fractional NFTs, Estate Ledger provides a more accessible, transparent, and efficient platform for land acquisition, development, and sales. This approach democratizes access to real estate investment and provides a platform for land development and profit distribution.

## Features

- **Tokenization**: Estate Ledger will tokenize real estate assets into either stablecoins or fractional NFTs. This will allow investors to buy and sell real estate in a more accessible and liquid form.

- **Marketplace**: Estate Ledger will provide a marketplace for buying, selling, and trading tokenized real estate assets. This marketplace will include features like search, filters, and detailed property listings.

- **Crowdfunding**: Estate Ledger will facilitate crowdfunding for real estate development projects. This will include features like project listings, fundraising progress tracking, and investor rewards.

- **Rental Management**: Estate Ledger will handle the rental of properties, including features like rental agreements, rent collection, and dispute resolution.

- **Governance**: Estate Ledger will allow token holders to vote on key decisions about the properties, such as how they should be developed or how the profits should be distributed.

- **Profit Distribution**: Estate Ledger will distribute profits from the commercial activities on the properties to the token holders and the original landowner.

- **Analytics**: Estate Ledger will provide analytics and insights about the real estate market, helping users make informed investment decisions.

- **Asset Management**: Estate Ledger will help users manage their portfolio of tokenized real estate assets, including features like performance tracking, risk assessment, and tax reporting.

- **Compliance**: Estate Ledger will ensure compliance with relevant real estate and blockchain regulations, providing peace of mind for users.

- **Interoperability**: Estate Ledger will be designed to be interoperable with other blockchain platforms and protocols, allowing for a wider range of use cases and integrations.

## Smart Contracts

EstateLedger will utilize a series of smart contracts to facilitate its features:

- **Land Acquisition Contract**
  - Inputs: Land details (location, size, price, etc.), Landowner details
  - Outputs: Confirmation of land acquisition
  - Mechanism: Verifies the landowner's ownership, transfers ownership to the Estate Ledger protocol, and records the transaction on the blockchain.

- **Tokenization Contract**
  - Inputs: Land details (location, size, guideline value, etc.), Tokenization method (stable coins or fractional NFTs)
  - Outputs: Tokens representing the land
  - Mechanism: [Details of the mechanism...]
- **Sales Contract**
    - Inputs: Buyer details, Number of tokens to buy, Payment
    - Outputs: Confirmation of sale, Tokens to the buyer
    - Mechanism: Verifies the buyer's payment, transfers the tokens to the buyer, and records the transaction on the blockchain.
- **Land Development Contract**
    - Inputs: Development project details (plan, budget, timeline, etc.)
    - Outputs: Confirmation of project initiation
    - Mechanism: Records the project details on the blockchain and triggers the start of the project.
- **Commercial Activities Contract**
    - Inputs: Commercial activity details (type of activity, income generated, etc.)
    - Outputs: Confirmation of commercial activity, Income to the protocol
    - Mechanism: Records the commercial activity on the blockchain and transfers the income to the protocol.
- **Profit Distribution Contract**
    - Inputs: Total profits, Number of tokens held by each token holder
    - Outputs: Profits to the token holders and the original landowner
    - Mechanism: Calculates the share of profits for each token holder and the original landowner, transfers the profits, and records the transactions on the blockchain.
- **Governance Contract**
    - Inputs: Proposals, Votes from token holders
    - Outputs: Results of the vote
    - Mechanism: Records proposals and votes on the blockchain, calculates the results of the vote, and updates the protocol accordingly.
- **Upgrade Contract**
    - Inputs: Upgrade proposal, Votes from token holders
    - Outputs: Confirmation of upgrade
    - Mechanism: Records the upgrade proposal and votes on the blockchain, calculates the results of the vote, and implements the upgrade if approved.

These smart contracts work together to ensure the secure and efficient operation of the Estate Ledger protocol. They provide a transparent and immutable record of all transactions and activities, making it easier for users to trust the protocol. 


## Future Enhancements

- **Identity Verification**: The protocol should have a mechanism for verifying the identity of users. This will be done through a decentralized identity solution that respects user privacy while ensuring that each user is unique.
- **Derivatives:**
    
    Estate Ledger will enable the development of a range of derivative contracts, including:
    
    - Real Estate Index Funds
    - Real Estate Derivatives
    - Real Estate Lending Platforms
    - Real Estate Insurance Products
    - Real Estate Prediction Markets
    - Real Estate DAOs
    
    These derivative contracts will provide additional opportunities for investment and engagement with the real estate market.
    
- **Application Layer**: This is where the dApps reside. Stakeholders can build various dApps on top of the protocol, tailored to their specific needs. For example, Enterprises can build  dApps for buying and selling, real estate rentals etc.
- **Interface Layer**: This layer will provide user-friendly interfaces for interacting with the dApps. This will include web interfaces, mobile apps, or even APIs for third-party integrations.
- **Interoperability**: Designing the protocol to be interoperable with other systems. This will increase its adoption and utility.
- **Privacy and Security**: Ensuring that the protocol complies with data protection regulations and also consider how to protect the system and its users from malicious activities.
- **Community Involvement**: As an open-source project, community involvement is crucial. Encouraging contributions from the community and provide clear documentation to help others understand and contribute to the project.
- **Sustainability**: Considering how to sustain the project in the long term. This will involve setting up a governance model, securing funding, or establishing a foundation to oversee the project.
- **Partnerships**: Form partnerships with organizations and enterprises that can benefit from the protocol. They can provide valuable feedback and help drive the adoption of the protocol.

## Conclusion

Estate Ledger aims to revolutionize the real estate market by making it more accessible, transparent, and efficient. By leveraging the power of blockchain technology, Estate Ledger will provide a range of features and derivative products that empower both investors and real estate developers.



## Running a Haskell Project using Cabal

This guide will walk you through the process of running a Haskell project using Cabal. We'll assume that you have cloned the repository containing the project source code.

### Step 1: Clone the Repository

First, clone the repository containing the Haskell project source code. You can do this by using the following command:

```bash
git clone https://github.com/KonmaLabzIO/Estate-Ledger/
```


### Step 2: Initialize Cabal Configuration

Navigate to the project directory and initialize the Cabal configuration. Cabal is a build tool for Haskell projects that helps manage dependencies and build processes. Run the following command:

```bash
cabal init
```

This command will guide you through the process of creating a `.cabal` file, which contains project configurations and metadata.

### Step 3: Build the Project

Once the `.cabal` file is generated, you can build the project by executing the following command:

```bash
cabal build
```

This command will compile the project source code and create executable files.

### Step 4: Execute the Application

To execute the application, use the `cabal exec` command followed by the name of the executable you want to run. For example, if the executable is named "Estate Ledger," use the following command:

```bash
cabal exec EstateLedger
```

This command will run the compiled application and display its output.

### Step 5: Build and Execute with a Single Command

You can also use the `cabal run` command to both build and execute the application. This command simplifies the process:

```bash
cabal run
```

Running this command will build the application, reveal executable links, and then execute the application, displaying its output.

---

With these steps, you should be able to successfully clone, initialize, build, and execute a Haskell project using Cabal. If you encounter any issues or need further assistance, refer to the official Cabal documentation for additional information.


## Smart Contract Workflow
- [Land Acquisition Contract](#land-acquisition-contract)
- [Tokenization Contract](#tokenization-contract)
- [Sales Contract](#sales-contract)
- [Land Development Contract](#land-development-contract)
- [Commercial Activities Contract](#commercial-activities-contract)
- [Profit Distribution Contract](#profit-distribution-contract)

### Land Acquisition Contract
This contract involves acquiring land from a seller. It requires the following inputs:

```haskell
-- Contract Step 1
Output: Enter land location:
Input: <Location>
```
**Land location:** The geographical location of the land.

```haskell
-- Contract Step 2
Output: Enter land size (in square feet):
Input: <Size>
```
**Land size:** Size must be in square feet; any other measurement must be converted to square feet.

```haskell
-- Contract Step 3
Output: Enter land price (Ada):
Input: <Price>
```
**Land price:** The price of the land in Ada (Cardano's cryptocurrency).

```haskell
-- Contract Step 4
Output: Enter land owner's name:
Input: <LandOwnerName>
```
**Land owner's name:** The name of the current owner of the land.

```haskell
-- Contract Step 5
Output: Enter the escrow wallet address for the NFT:
Input: <EscrowWallet>
```
**Escrow wallet address:** The wallet address where the payment will be temporarily held.

```haskell
-- Contract Step 6
Output: Enter the land owner's wallet address:
Input: <LandOwnerWallet>
```
**Land owner's wallet address:** The wallet address of the land owner to transfer the land price.

**Explanation:** The contract begins by requesting various inputs related to the land acquisition, such as location, size, price, and owner information. It simulates the process of confirming the land acquisition and transferring the payment.

### Tokenization Contract
This contract involves generating NFTs (Non-Fungible Tokens) for the acquired land. It requires the following inputs:

```haskell
-- Contract Step 1
Output: NFT generated for the acquired land!
Transferring NFT from land owner's wallet to escrow account: <LandOwnerWallet> -> <EscrowWallet>
NFT transfer complete.
Choose your option:
1. Fractionalize the NFT
2. Keep it as a single NFT
Input: <Choice>
```
**NFT choice:** The user's choice between fractionalizing the NFTs or keeping them as a single NFT.

**Explanation:** This contract generates NFTs for the land and simulates their transfer from the land owner's wallet to the escrow account. It allows the user to choose between fractionalizing the NFTs or keeping them as a single NFT.

### Sales Contract
This contract facilitates the sale of NFTs to buyers. It requires the following inputs:

```haskell
-- Contract Step 1
Output: Enter buyer's name:
Input: <BuyerName>
```
**Buyer's name:** The name of the buyer.

```haskell
-- Contract Step 2
Output: Enter number of NFTs to buy:
Input: <NumberOfNFTs>
```
**Number of NFTs to buy:** The quantity of NFTs the buyer wants to purchase.

```haskell
-- Contract Step 3
Output: Enter buyer's receiving wallet address:
Input: <BuyerWalletAddress>
```
**Buyer's wallet address:** The wallet address where the NFTs will be transferred.

**Explanation:** This contract prompts the user for buyer's information and the number of NFTs they want to buy. If the requested number of NFTs is available, it simulates payment verification and the transfer of NFTs to the buyer's wallet.

### Land Development Contract
This contract involves the initiation or cancellation of a land development project. It requires the following inputs:

```haskell
-- Contract Step 1
Output: Enter project plan:
Input: <ProjectPlan>
```
**Project plan:** Details about the development project.

```haskell
-- Contract Step 2
Output: Enter project budget (ada):
Input: <ProjectBudget>
```
**Project budget:** The budget of the project in Ada.

```haskell
-- Contract Step 3
Output: Enter project timeline (in months):
Input: <ProjectTimeline>
```
**Project timeline:** The duration of the project in months.

```haskell
-- Contract Step 4
Output: Enter developer's wallet address:
Input: <DeveloperWallet>
```
**Developer's wallet address:** The wallet address of the developer responsible for the project.

```haskell
-- Contract Step 5
Output: Enter number of milestones required for the project:
Input: <Milestones>
```
**Number of milestones:** The total number of milestones for the project.

```haskell
-- Contract Step 6
Output: Escrow account holder, choose your option:
1. Yes, Stage is confirmed. Release Fund
2. Cancel, Need Improvement
Input: <Choice>
```
**Project choice:** The user's choice to either confirm a stage and release funds or cancel it.

**Explanation:** This contract prompts the user for project details, developer's information, and milestone data. It simulates the process of confirming or cancelling a stage of the project and releasing funds based on the confirmed milestones.

### Commercial Activities Contract
This contract involves recording and confirming commercial activities. It requires the following inputs:

```haskell
-- Contract Step 1
Output: Enter type of activity:
Input: <ActivityType>
```
**Activity type:** The nature of the commercial activity.

```haskell
-- Contract Step 2
Output: Enter name of activity:
Input: <ActivityName>
```
**Activity name:** The name of the specific activity.

```haskell
-- Contract Step 3
Output: Enter income generated by this activity:
Input: <IncomeGenerated>
```
**Income generated:** The income generated by the activity.

```haskell
-- Contract Step 4
Output: Escrow wallet holder, choose your option:
1. Yes, Confirm Activity
2. Need Improvement
Input: <Choice>
```
**Activity choice:** The user's choice to confirm the activity or suggest improvements.

**Explanation:** This contract records the details of a commercial activity and the income it generates. It provides the option to confirm the activity or suggest improvements.

### Profit Distribution Contract
This contract involves distributing profits from commercial activities among investors and the land owner. It requires the following inputs:

```haskell
-- Contract Step 1
Output: Enter wallet addresses of each investor:
Input: <InvestorCount>
```
**Investor count:** The number of investors participating.

```haskell
-- Contract Step 2
Output: Enter total profit generated from Commercial activities:
Input: <TotalProfit>
```
**Total profit:** The total profit from commercial activities.

**Explanation:** This contract collects wallet addresses and names of each investor. It calculates the profit to be distributed to each recipient (investors and land owner) equally and simulates transferring profits to their respective wallets.
