SELECT 
Id AS CaseHistoryId,
CaseId,
Field,
DataType,
NewValue,
OldValue,
IsDeleted,
CreatedDate
FROM {{source('salesforce', 'CaseHistory')}}
QUALIFY ROW_NUMBER() OVER(PARTITION BY Id ORDER BY _airbyte_extracted_at ASC) = 1