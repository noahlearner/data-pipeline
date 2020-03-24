{{ config(materialized='table') }}


Select *, DATETIME(CURRENT_TIMESTAMP() , "America/New_York") as Create_Date
from `Reporting.Reporting_Wins` where Timestamp is not null