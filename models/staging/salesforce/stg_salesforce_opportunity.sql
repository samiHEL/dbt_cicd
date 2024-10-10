SELECT 
Id AS OpportunityId,
AccountId,
RecordTypeId, 
OwnerId,
Name,
MQL__c AS MQL,
IsWon,
IsClosed,
IsDeleted,
IsPrivate,
AgeInDays, -- Need to be check 

-- Qualification
StageName,
Type AS BusinessType,
LeadSource,
LostReason__c AS LostReason,
ForecastCategory,
HighPotential__c AS HighPotential,
LostSubReason__c AS LostSubReason,
OpportunityRating__c AS OpportunityRating,
OpportunitySource__c AS OpportunitySource,


-- Finnancial
Amount, -- Need to be check I don't understand the meaning for this column.
MRREUR__c AS MRREUR,
SetupFeesEUR__c AS SetupFeesEUR,
ExpectedRevenue,
CurrencyIsoCode AS CurrencyCode,
Payment_Method__c AS PaymentMethod,
PaymentProvider__c AS PaymentProvider,
TotalContractValue__c AS TotalContractValue,
AnnualContractValue__c AS AnnualContractValue,
ContractDuration__c AS ContractDuration,
Billing_Frequency__c AS BillingFrequency,
Fiscal,
FiscalYear,
FiscalQuarter,


-- Events
CreatedDate,
LastActivityDate,
LastModifiedDate,
LastActivityInDays,
CLoseDate,
LastActivityDate__c AS LastActivityDate,
NextActivityDate__c AS NextActivityDate,
DaysSinceActivity__c AS DaysSinceActivity,

-- Localization
BillingType__c AS BillingType,
BillingAddress__c AS BillingAddress,
StoreAddress__c AS StoreAddress


FROM {{source('salesforce', 'Opportunity')}}
QUALIFY ROW_NUMBER() OVER(PARTITION BY Id ORDER BY _airbyte_extracted_at ASC) = 1