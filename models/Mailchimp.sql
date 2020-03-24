{{ config(materialized='table') }}


Select *, DATETIME(CURRENT_TIMESTAMP() , "America/New_York") as Create_Date
from `{{ var("client") }}.Mailchimp_in` where Date is not null