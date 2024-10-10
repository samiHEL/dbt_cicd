{{config(tags=['daily'])}}

SELECT 
Id AS LeadID,
OwnerId,
RecordTypeId, 
Name,
LastName,
PhotoUrl,
Company AS CompanyName,
Email,
Phone,
MobilePhone,
Language__c,
Website,
IsDeleted,
IsConverted,
GoogleRating__c AS GoogleRating, 
OwnerTopManager__c AS OwnerManagerEmail,

-- Qualification
MQL__c AS MQL,
Status,
Source__c AS Source, 
JobRole__c AS JobRole,
LeadSource,
Category__c AS Category,
SubCategories__c AS SubCategories,
TopCategory__c AS TopCategory, 
ResellerType__c AS ResellerType,
TotalCameras__c AS TotalCameras,
NumberOfEmployees,
NumberOfStores__c AS NumberOfStores,
DisqualificationSubReason__c AS DisqualificationSubReason,

-- Finnancial
CurrencyIsoCode,
ForecastedMRR__c AS ForecastedMRR,

-- Events
CreatedDate,
ConvertedDate,
LastViewedDate,
LastActivityDate,
LastModifiedDate,
LastSalesActivity__c AS LastSalesActivity,
DaysSinceActivity__c AS DaysSinceActivity,
LastAssignmentDate__c AS LastAssignmentDate,
FirstCallDateTime,
-- Localization
Street,
Address,
City,
Country,
CountryCode,
PostalCode,
State,
StateCode,
Timezone__c AS Timezone,
Coordinates__c AS Coordinates,
Coordinates__Latitude__s AS CoordinatesLatitude,
Coordinates__Longitude__s AS CoordinatesLongitude

FROM {{source('salesforce', 'Lead')}}
QUALIFY ROW_NUMBER() OVER(PARTITION BY Id ORDER BY _airbyte_extracted_at ASC) = 1