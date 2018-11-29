# taxes-in-smart-contracts

The Basic tax clauses for smart contracts samples

Virtual currency transactions are taxable by law just like transactions in any other property. The IRS has issued guidance in IRS Notice 2014-21 for use by taxpayers and their return preparers that addresses transactions in virtual currency, also known as digital currency.

IRS Notice 2014-21 is used for illustration of basic rules for developing tax clauses in smart contracts.

The Basic tax clauses for smart contracts are sample Solidity blockchain contracts to help you to get started with blockchain development and integration on Ethereum. You can use the Basic tax clauses for smart contracts to create a blockchain contract that tracks, stores and processe tax data for the respective commercial smart contract.

The following information is provided to help you to get started with the Basic tax clauses:

- Overview
- Requirements
- Developing your Ethereum contracts using Basic tax clauses
- Invoking the tax clause contract
- Generating code
- Next steps


Overview

The Basic tax samples are the smart contracts for getting started with writing blockchain contracts. The Basic contract includes operations for tracking tax data. The Basic tax samples are developed in the Solidity programming language. ormation, see Developing smart contracts for Watson IoT Platform blockchain integration.

The Basic tax samples code includes the following main methods:

Method	Description

deploy	Used to deploy a smart contract

invoke	Used to update a smart contract

Note: In the Basic tax contract samples, the deploy method is called init.

When you call any of the methods, you must first pass a JSON string that includes the function name and a set of arguments as key-value pairs to the chain code instance. You can define multiple methods within the same contract.

To create a simple contract to create, read, update, and delete asset data, use the following methods:

Method	    Provides

readSchemas The methods and associated properties of the JSON schema contract

readSamples An example of the sample JSON data


Requirements

To correctly map the tax properties to the corresponding Blockchain contract properties, use the following required functions:

Function	Used by the data mapping function to....

update 
Create records if one doesn't exist on the ledger
Update data for existing records
Map 
Accept  input data in the form of JSON strings

readSchemas	
Expose the function names and properties that are required by the contract so that the data mapper can correctly map the event properties to the contract properties.


Developing your Ethereum contracts using Basic tax clauses

The Basic tax contract is an example recipe that is designed for you to customize and use to experiment with tax contract development for Blockchain. The current version of the Basic tax contract is simplistic with similar functions to create and update tax data.

To use the Basic tax sample contract as a foundation to develop your own use cases into deployable chaincode, complete the following procedure:

Download the Basic tax contract sample;
Create the base contract and implement version control;
Define the tax data structure;
Initialize the contract;
Define the invoke methods.
Define the query methods for how the contract data is read;
Define the callbacks;
Develop the contract further;
Detailed information about how to complete each step is hyperlinked to the sections that follow;


1. Downloading the Basic tax samples

Download the Basic blockchain tax contract sample. You need the following Basic sample files, which are provided in the repository folder:

The Basic contract source file

2. Creating the base contract

To create the base source file for your Blockchain tax contract:

Create a copy, which is the main source file of the Basic tax contract.
Using an editor of your choice, open it.



Initialize the contract with a version number, as outlined in the following code snippet:


Define a contract state to keep track of the contract version.


Note: You can eventually increase the complexity of the ContractState code in your contract, for example, you can add more contract state details, introduce asset state alerts, and other items.

3. Defining the tax data structure

The Basic contract provides the Blockchain contract code that is required for a tax calculation.

The following code provides an example of how to define the data structure:

4. Initializing the contract

The init function is one of the three required functions of the chaincode and initializes the contract. The other required functions of the chaincode are invoke and query. The init function is called as a 'deploy' function to deploy the chaincode to the fabric. Notice the signature of the function.


5. Defining the invoke methods

Define the invoke methods for the create, read, update, and delete operations in your contract, which is where most of the contract action occurs. 


6. Defining the 'query' methods

Use a query method to define how the contract data is read. The Basic contract sample uses the following blockchain query implementation methods.


7. Defining the callbacks


8. Developing the contract further


9. Generating code


10. Next steps

