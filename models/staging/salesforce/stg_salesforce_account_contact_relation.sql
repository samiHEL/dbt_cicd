SELECT 
Id AS AccountContactRelationId,
AccountId,
ContactId,
Roles,
MQL__c AS MQL,
CreatedDate,
StartDate,
EndDate,
LastModifiedDate,
IsActive,
IsDirect,
IsDeleted,
CurrencyIsoCode,
Contact_Full_Name__c AS ContactFullName
FROM {{source('salesforce', 'AccountContactRelation')}}
QUALIFY ROW_NUMBER() OVER(PARTITION BY Id ORDER BY _airbyte_extracted_at ASC) = 1