SELECT 
Id AS RecordTypeId,
Name,
IsActive,
CreatedDate,
SobjectType,
DeveloperName,
LastModifiedDate
FROM {{source('salesforce', 'RecordType')}}
QUALIFY ROW_NUMBER() OVER(PARTITION BY Id ORDER BY _airbyte_extracted_at ASC) = 1
