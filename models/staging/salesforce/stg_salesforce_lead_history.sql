SELECT 
Id AS LeadHistoryId,
Field,
LeadId,
DataType,
NewValue,
OldValue,
IsDeleted,
CreatedDate
FROM {{source('salesforce', 'LeadHistory')}}
QUALIFY ROW_NUMBER() OVER(PARTITION BY Id ORDER BY _airbyte_extracted_at ASC) = 1