SELECT 
Id AS CaseId,
AccountId,
OwnerId,
ClientID__c AS ClientId,
Opportunity__c AS OpportunityId,
RecordTypeId,
CaseNumber,
Team__c AS Team,
OPSTeam__c AS OPSTeam,
IsClosed,
IsDeleted,
IsStopped,
IsEscalated,
IsClosedOnCreate,
IsInSalesReturn__c AS IsInSalesReturn,
Priority,
CaseDelay__c AS CaseDelay,
StoreType__c AS StoreType,
SubReason__c AS SubReason,
TrelloLink__c AS TrelloLink,
CamerasType__c AS CameraType,
CameraGrading__c AS CameraGrading, 
GoogleMapsURL__c AS GoogleMapsURL,
S1CallArranged__c AS S1CallArranged,
OwnerTopManager__c AS OwnerManagerEmail,
InstallationType__c AS InstallationType, 
NumberOfCaseAsset__c AS NumberOfCase,
CCTVProviderContact__c AS CCTVProviderContact,
Sales_Return_Reason__c AS Sales_Return_Reason,
Hardware_Return_Reason__c AS HardwareReturnReason,

-- Qualification
Type AS CaseType,
Origin,
Reason,
Status,

-- Finnancial
CurrencyIsoCode,
SetupFeePaid__c AS SetupFeePaid,
Subscription__c AS SubscriptionId,
IsContractValid__c AS IsContractValid,
ClosedDate,

-- Localization
Language,
AccountCountry__c AS AccountCountry,
AccountLanguage__c AS AccountLanguage,
LanguageTimeZoneSet__c AS IsLanguageTimeZoneSet,

-- Events
CreatedDate,
LastViewedDate,
DeployedDate__c AS DeployedDate,
LastModifiedDate,
LogisticsDate__c AS LogisticsDate,
DeploymentDate__c AS DeploymentDate, 
PreparationDate__c AS PreparationDate,
InstallationDate__c AS InstallationDate,
VerificationDate__c AS VerificationDate,
IsEuropeanClient__c AS IsEuropeanClient,

-- Contact
ContactEmail,
ContactPreference__c AS ContactPreference,
ContactPhone,
ContactMobile,
SuppliedEmail,
SuppliedPhone,
EmailingType__c AS EmailingType,
EmailGDRPSent__c AS EmailGDRPSent,
EmailNoReachSent__c AS EmailNoReachSent,
EmailWelcomeSent__c AS EmailWelcomeSent,
EmailingLanguage__c AS EmailingLanguage

FROM {{source('salesforce', 'Case')}}
QUALIFY ROW_NUMBER() OVER(PARTITION BY Id ORDER BY _airbyte_extracted_at ASC) = 1