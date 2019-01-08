# taxes-in-smart-contracts

The Basic tax clauses for smart contracts samples

Taxes in smart contracts can be considered from two points of view:

Current rules for taxation of cryptocurrencies (for example IRS Notice 2014-21):

Virtual currency transactions are taxable by law just like transactions in any other property. Taxpayers who do not properly report the income tax consequences of virtual currency transactions can be audited for those transactions and, when appropriate, can be liable for penalties and interest.In more extreme situations, taxpayers could be subject to criminal prosecution for failing to properly report the income tax consequences of virtual currency transactions. 

The possible models for automatization of tax assessment for smart contracts:

Currently tax assessment for smart contracts is performed in traditional old-fashioned way - by separate team of tax accountants and lawyers out of blockchain environment. But very predictable, that smart contracts (not only in terms of Ethereum, but in more general sense) will finally replace paper contracts and relevant procedures for preparation and assessment of a contract will be moved to blockchain ecosystem (or other information processing system) as well.

The presented project is dedicated to research and model possible ways of tax processing within blockchain ecosystem in present and in future (using Ethereum). IRS Notice 2014-21 requirements are used for illustration.

Flows of models

- Model 1: Tax rules as a separate library of smart contracts
  Base contract (for payment, withdrawal, deposit etc.):
  Call to library for tax rules;
  Get required information from library;
  Perform tax calculations (before and after transaction);
  Perform base function of the contract (payment for example);
  Send information for further processing in accounting system etc.;

  Call for tax rules
  Library of smart contracts

  Provide tax rules

- Model 2: Tax rules as internal functions of the base contract

  Base contract (for payment, withdrawal, deposit etc.):
  Perform auxiliary functions (including tax);
  Perform base function of the contract (payment for example);
  Send information for further processing in accounting system etc.;


- Model 3: Tax rules as an oracle
  Base contract (for payment, withdrawal, deposit etc.):
  Call to oracle for required information;
  Get required information from oracle;
  Perform tax calculations (before and after transaction);
  Perform base function of the contract (payment for example);
  Send information for further processing in accounting system etc.;
  Contains all information required for tax processing
  Call for tax data

  Provide tax data

- Main conclusions:

The three models were tried in course of the project. Due to immutability of blockchain keeping tax rules as a separate library of contracts or as  internal functions of base contract seems inefficient (difficulties with update upon changes of legislation etc.);
The most promising model is to have required tax data and rules as oracle service (in-house or external);
In tax relations the last mile problem is to verify that declared conditions in the contract are not only matched with facts, but as well confirmed by proper documents (tax residence certificates, invoices etc.) and all of them: contract, facts and documents are matched (evidencing the same state of facts). It might be predicted that all information (including images of goods, shipments etc.) may be verified and stored by special service providers (some kind of service oracles);



References:

https://www.irs.gov/newsroom/irs-reminds-taxpayers-to-report-virtual-currency-transactions
