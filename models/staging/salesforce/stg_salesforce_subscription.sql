SELECT 
Id AS SubscriptionId,
Opportunity__c AS OpportunityId,
Account__c AS AccountId,
Contact__c AS ContactId,
Name,
Cycle__c AS Cycle,
MRREUR2__c AS MRREUR,
SetupFees2__c AS SetupFees,
SetupFeesEUR2__c AS SetupFeesEUR,
CurrencyIsoCode,
MRRIsDifferent__c AS MRRIsDifferent,
CreatedDate,
StartDate__c AS StartDate,
ChurnDate__c AS ChurnDate,
LastViewedDate,
EndDate__c AS EndDate,
LastActivityDate,
LastModifiedDate,
IsDeleted,
IsActive__c AS IsActive,
EndReason__c AS EndReason,
ChurnReason__c AS ChurnReason,
IsActiveOld__c AS IsActiveOld,
ContractDuration2__c AS ContractDuration
FROM {{source('salesforce', 'Subscription__c')}}
QUALIFY ROW_NUMBER() OVER(PARTITION BY Id ORDER BY _airbyte_extracted_at ASC) = 1