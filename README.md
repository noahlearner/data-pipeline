# dbt-data-pipeline

## Setup Steps


### Google Sheets Setup
1. Copy this [Google Sheet](https://docs.google.com/spreadsheets/d/1EfFQGhvpjnEb5wUB3dRHQPNEwZq55w9rEAIqmejV92I/copy)
  * Set up Supermetrics queries to fill in each channel
  * Don't touch anything that is dark grey
2. Copy the url of the Sheet as you'll need it in the bigQuery setup
3. Make a copy of the the [Data Pipeline Reporting Client List](https://docs.google.com/spreadsheets/d/1JBsXYUCLM9qQ18pdXLH4pOpmra7nRtUVFsTmsKvLWOQ/copy);  This will serve as the file where you configure your clients.
  * Client - Add the Client Name
  * DMAM - is the account Manager.  Could also be your SEO or any other role.  You can change the heading but you'll have to chane the field names downstream in your SQL queries.
  * PPC - name of the PPc person on your account
  * MPA - name of the digital marketing assistant on the account
  * Content - Set the name of the content person on the account
  * Logo URL - please enter
  * Client Summary Sheet URL - add the URL of each client's Sheet
  * Client Dashboard URL - add url of their data studio report.
4. Make a copy of this [Google sheet](https://docs.google.com/spreadsheets/d/1PkOV-AzmeuVxmWAEaFRvj7dLUz7UTpCSiS4EDEERPVw/copy)
  * GDS Date - Enter date for each month on each row for each Client in yyyy-mm-dd format.
  * Client - Enter Client Name (must match the name in client list sheet.  You should create data validation in this column to refer to a unique list of names from the client list file you created before to limit opportuinities of data entry error.
  * budget - enter how much the client pays you to manage each month.  in this format: 1111.00 (don't use curreny symbols).

**** THis is a work in progress and more on the sheets setup to come 

### BigQuery Setup
1. Buid new Dataset in BigQuery to match the client name with multiple words separated by underscores.
2. Build external tables for each of the marketing channels with following process:
  * Click on Client's Dataset
  * Choose Create a Table
  * Table Settings:
    * Create table from Drive
    * Put Sheet URL in Select Drive URI
    * Set File Format to Google Sheets
    * Confirm Project name and Dataset name are correct
    * Set table name
    * Check autodetect schema and input parameters
    * Set "Header rows to skip" to 1.
    * Click Create Table
3. Tables include:
  * GA_in
  * GA_Goals_in
  * GMB_in
  * GoogleAds_in
  * Mailchimp_in
  * Management_in
  * Microsoft_in
  * Microsoft_in
  * Reporting_Client_List_in

#### BigQuery Gotchas
* If the created table doesn't have the correct header names from your Google Sheet, no big deal.  Just rebuild the table.
* Remember to check autodetect schema and input parameters
* Remember to Set "Header rows to skip" to 1.

### Github Setup
1. Clone this repo.
2. Name the new Repo "data-pipeline-<clientname> to match the Client name 
3. Edit the dbt_project.yml.
   * lines 6 (change name to client Name), 
   * Line 33 Change from CAM_Solar to the client name with underscores inbetween words.
   * Line 37 Change CAM_Solar to to match the Dataset name found in BigQuery
   * Line 38 Change from CAM Solar to match the real Client Name
4. Use this repo as the source for new dbt Project.


 
