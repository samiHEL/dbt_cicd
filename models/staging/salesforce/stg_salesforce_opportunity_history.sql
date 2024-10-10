SELECT 
Id AS OpportunityHistoryId,
OpportunityId,
Amount,
PrevAmount,
IsDeleted,
StageName,
CreatedDate,
CloseDate,
PrevCloseDate,
Probability,
ExpectedRevenue,
CurrencyIsoCode,
ForecastCategory
FROM {{source('salesforce', 'OpportunityHistory')}}
QUALIFY ROW_NUMBER() OVER(PARTITION BY Id ORDER BY _airbyte_extracted_at ASC) = 1