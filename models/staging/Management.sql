Select GDS_DATE as Date, Client,safe_cast(CleanBudget AS FLOAT64) as Budget 
from `{{ var("client") }}.Management_in` where Date is not null order by Date ASC
