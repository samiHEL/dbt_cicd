SELECT 
  Id AS AccountId,
  Name AS CompanyName,
  Type AS RecordType,
  Phone,
  Email__c AS EmailClient,
  LegalName__c AS LegalName,
  Industry, 
  Language__c AS Language, 
  Timezone__c AS Timezone,
  KA__c AS isKA,
  MQL__c AS MQL,
  ClientID__c AS ClientId,
  OwnerId,
  Status__c AS Status,
  Statusdetail__c AS StatusDetail,
  OnboardedOnApp__c AS OnboardedOnApp,
  Website,
  RecordTypeId,
  Referrer__c AS Referrer,
  Leaser__c AS Leaser,
  Reseller__c AS Reseller,
  BusinessProvider__c AS BusinessProvider,
  CameraRange__c AS CameraRange,
  ChurnReason__c AS ChurnReason,
  ChurnDate__c AS ChurnDate,
  TotalCameras__c AS TotalCamerasCount,
  EquippedCameras__c AS EquippedCamerasCount,
  ExploitableCameras__c AS ExploitableCamerasCount,
  ForecastedMRR__c AS ForecastedMrr,

  -- Qualification
  Source__c AS Source,
  LeadSource__c AS LeadSource,
  TopCategory__c AS TopCategory,
  Category__c AS Category,
  SubCategories__c AS Subcategories,
  LeadRating__c AS UserRating,
  RevOpsRating__c AS AutoRating,
  NumberOfEmployees AS TotalEmployeesCount,
  NumberOfStores__c AS StoreCount,
  StoreSize__c AS StoreSize,
  PlaceID__c AS PlaceId,
  CompanyID__c AS CompanyId,

  -- Technical data
  DVRIP__c AS DvrIp,
  DVRBrand__c AS DvrBrand,
  LoginPassword__c AS LoginPassword,
  PrivateInternet__c AS PrivateInternet,
  ServerOwnership__c AS ServerOwnership,
  TelegramChannel__c AS TelegramChannel,
  TelegramGroupID__c AS TelegramGroupId,
  TelegramGroupName__c AS TelegramGroupName,
  RTSPPort__c AS RtspPort,

  -- Financal data
  PaymentType__c AS PaymentType,
  PennylaneID__c AS PennylaneId,
  VATNumber__c AS VatNumber,
  PaymentInterval__c AS PaymentInterval,
  AnnualRevenue,
  CurrencyIsoCode AS CurrencyCode,
  ActiveSubscriptions__c AS ActiveSubscriptions,
  TotalSubscriptions__c AS TotalSubscriptions,



  -- Localization
  StoreAddress__Street__s AS StoreStreet,
  StoreAddress__City__s AS StoreCity,
  StoreAddress__PostalCode__s AS StorePostalCode,
  StoreAddress__CountryCode__s AS StoreCountryCode,
  StoreAddress__Latitude__s AS StoreLatitude,
  StoreAddress__Longitude__s AS StoreLongitude,
  BillingStreet,
  BillingCity,
  BillingState,
  BillingPostalCode,
  BillingCountryCode,
  BillingLatitude,
  BillingLongitude,
  ShippingStreet,
  ShippingCity,
  ShippingPostalCode,
  ShippingCountryCode,
  ShippingLatitude,
  ShippingLongitude,

  -- Events
  CreatedDate,
  LastViewedDate,
  LastActivityDate,
  LastModifiedDate,

  -- Additional Metadata
  NumberOfGoogleImages__c AS GoogleImagesCount,
  NumberOfGoogleReviews__c AS GoogleReviewsCount,
  GoogleRating__c AS GoogleRating,
  NumberOfSecurityAgents__c AS SecurityAgentsCount

FROM {{source('salesforce', 'Account')}} 
QUALIFY ROW_NUMBER() OVER(PARTITION BY Id) = 1

