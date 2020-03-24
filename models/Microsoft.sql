{{ config(materialized='table') }}


Select *, DATETIME(CURRENT_TIMESTAMP() , "America/New_York") as Create_Date
from `{{ var("client") }}.Microsoft_in` where Month is not null