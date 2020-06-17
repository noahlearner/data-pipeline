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

### Google Cloud Account 
1. Sign Up for a [Google Cloud Free Trial Account](https://console.cloud.google.com/freetrial)
2. Enable the BigQuery API [here](https://console.cloud.google.com/apis/library/bigquery.googleapis.com?q=bigquery)

### Create your BigQuery Project [courtesy of dbt's documentation](https://docs.getdbt.com/tutorial/setting-up)
1. Go to the [BigQuery Console](https://console.cloud.google.com/bigquery) — if you don't have a Google Cloud Platform account you will be asked to create one.
2. Create a new project for this tutorial — if you've just created a BigQuery account, you'll be prompted to create a new project straight away. If you already have an existing you can select the project drop down in the header bar, and create a new project from there.

### BigQuery Credentials for dbt
1. Go to the [BigQuery credential wizard](https://console.cloud.google.com/apis/credentials/wizard). Ensure that your new project is selected in the header bar.
2. Generate credentials with the following options:
 * Which API are you using? **BigQuery API**
 * Are you planning to use this API with App Engine or Compute Engine? **No**
 * Service account name: **dbt-user**
 * Role: **BigQuery User**
 * Key type: **JSON**
 * Download the JSON file and save it in an easy-to-remember spot, with a clear filename (e.g. dbt-user-creds.json)

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

### Set Up dbt Account + Project [courtesy of dbt](https://docs.getdbt.com/tutorial/create-a-project-dbt-cloud/)
1. Create a dbt Cloud account [here](https://cloud.getdbt.com/signup/). If your organization already has a dbt Cloud account, ask an admin to add you as a Developer.
2. Click the hamburger menu, then Account Settings, then Projects.
4. Click "New Project".
5. CLick "Begin" on next screen.
6. Name the project "pipeline", and click "Continue".
7. Click "BigQuery" on Next Screen.
8. Click "Upload a Service Account JSON file" and paste in the credentials file from the [BigQuery Credentials for dbt instructions above](https://github.com/noahlearner/data-pipeline/blob/master/README.md#bigquery-credentials-for-dbt).
9. scroll down to the "Development Credentials and rename the DATASET to match what was entered in line 37 of the [Github Setup Section](https://github.com/noahlearner/data-pipeline/blob/master/README.md#github-setup).
10. Scroll Up and Click "Test".
11. After you see "Connection Test Succeeded" Click "Continue".
12. On Next Screen Click "Github" Button.
13. You'll then be prompted to log into Github or you'll see your repos listed below in a table.
14. Click on the Repo you built in the [Github Setup](https://github.com/noahlearner/data-pipeline/blob/master/README.md#github-setup).
15. After the success message, Click the "Continue" buttonin top right of screen.
16. On next screen Click "Start Developing".

### Learn all about dbt Projects [here](https://docs.getdbt.com/docs/building-a-dbt-project/projects)

### Running dbt
[Follow dbt's documentation here](https://docs.getdbt.com/docs/running-a-dbt-project/using-the-dbt-ide#compiling-and-running-sql) 

### Scheduling dbt Runs
[dbt's docuumentation Here]()
