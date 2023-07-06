# Import location data to Salesforce: A step-by-Step guide

## Objective of the tutorial

Adding location data to Salesforce lets you leverage features like its [territory planning](https://www.salesforce.com/products/sales-cloud/tools/territory-planning/) for creating and managing sales territories, optimizing sales coverage, and improving efficiency.

In this tutorial, you'll learn how to add location data from [GeoPostcodes](https://www.geopostcodes.com/) to [Salesforce](https://www.salesforce.com/).

## Case explanation

You’ll import account data for a fictitious Brazil-based coffee company using Salesforce's data import wizard.

You will see how to:

- obtain location data from GeoPostcodes and import it into Salesforce
- map the location data to account information for a fictitious coffee company in Brazil
- use the mapped data to filter and segment your `Accounts` data

## Prerequisites

To follow along, make sure you have the following accounts:

- [Salesforce](https://developer.salesforce.com/signup)
- [GeoPostcodes](https://public.geopostcodes.com/portal-signup)
  - GeoPostcodes' free thirty-day trial will give you access to the sample data you'll use in this tutorial.
    The file you'll use for this tutorial is in the CSV folder, titled **GPC-PLACES-GEO_SAMPLE-BR.csv**

## Content of this folder

[Accounts Data.csv](Accounts%20Data.csv) - Data for a fictitious Brazil-based coffee company using Salesforce's data import wizard.

[UpdateAccountsWithGeoPostCode.java](UpdateAccountsWithGeoPostCode.java) - code for the trigger that is fired every time an account is created or updated

[UpdateAllAccounts.java](UpdateAllAccounts.java) - Modified version of the trigger to make it run on all accounts in the developer console.

## Tutorial

You can find the blog tutorial on the following link: <https://www.geopostcodes.com/blog/>
