{{ config(materialized='table') }}


Select *, DATETIME(CURRENT_TIMESTAMP() , "America/New_York") as Create_Date
from `{{ var("client") }}.GMB_in` where Year___month is not null