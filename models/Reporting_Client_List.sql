{{ config(materialized='table') }}


Select *, DATETIME(CURRENT_TIMESTAMP() , "America/New_York") as Create_Date
from `{{ var("client") }}.Reporting_Client_List_in` where Client is not null