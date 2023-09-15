# Foundry Fund Me

This is a Foundry project based on the Patrick Collins Solidity Course.

## Installation

You will need [git](https://github.com/git-guides/install-git) and [Foundry](https://book.getfoundry.sh/getting-started/installation) installed for this project to work.

Once those are installed, you should be able to have access to the entire project by using this commands:

```bash
git clone https://github.com/CaeraDenoir/foundry-fund-me.git
cd foundry-fund-me
forge build
```

## Usage
### Deploy the Smart Contract:
```bash
forge script script/DeployFundMe.s.sol
```
### Testing
There are different ways to test the smart contract.

You can test it locally with the use of a dummy chain created by foundry:
```bash
forge test
```
This will be running all the test functions.

You can also match and run the test functions with a regex:
```bash
forge test --match-test testFunctionName
```
or 
```bash
forge test --mt testFunctionName
```

For the test to use the sepolia chain as starting data you can add the following argument:
```bash
forge test --fork-url $SEPOLIA_RPC_URL
```
### Coverage
To check the code that is being covered by the test functions:
```bash
forge coverage
```

## Deployment
To deploy the contract to a live chain you will need to follow these steps:

1. Set the DEPLOY_RPC_URL and the PRIVATE_KEY as environment variables. Adding them in a .env file at the root of the project will be enough.(Check .env-example to get an idea)
2. get ETH or whatever native currency the chain you will be working with needs to deploy a contract.
3. Deploy
```bash
forge script script/DeployFundMe.s.sol --rpc-url $DEPLOY_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify
```
### Optional
If you wish to get your contract verified with metamask, you can add your own ETHERSCAN_API_KEY to the .env file and run this command instead to deploy:
```bash
forge script script/DeployFundMe.s.sol --rpc-url $DEPLOY_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY
```

## Scripts
Once the contract is deployed, you can use the Scripts to interact easily with it:

Fund example:

Using cast for a locally developed contract:
```bash
cast send <FUNDME_CONTRACT_ADDRESS> "fund()" --value 0.1ether --private-key <PRIVATE_KEY>
```
Or using forge and specifying the chain:
```bash
forge script script/Interactions.s.sol --rpc-url $DEPLOY_RPC_URL  --private-key $PRIVATE_KEY  --broadcast
```

## Estimate Gas
To estimate the gas of the functions:
```bash
forge snapshot
```
The result of the snapshot will be saved in .gas-snapshot

