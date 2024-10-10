SELECT 
Id AS InvoiceId,
OwnerId,
Account__c AS AccountId,
Opportunity__c AS OpportunityId,
Subscription__c AS SubscriptionId,
Name,
Paid__c AS Paid,
Type__c AS Type,
Amount__c AS Amount,
IsDeleted,
DueDate__c AS DueDate,
FileURL__c AS FileURL,
PublicURL__c AS PublicURL,
CreatedDate,
LastViewedDate,
LastActivityDate,
LastModifiedDate,
EmissionDate__c AS EmissionDate,
CurrencyIsoCode,
CurrencyAmount__c AS CurrencyAmount, 
RemainingAmount__c AS RemainingAmount

FROM {{source('salesforce', 'Invoice__c')}}
QUALIFY ROW_NUMBER() OVER(PARTITION BY Id ORDER BY _airbyte_extracted_at ASC) = 1