# dbt-data-pipeline

## Setup Steps

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


 
