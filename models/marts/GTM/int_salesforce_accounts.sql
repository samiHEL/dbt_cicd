SELECT

  -- Core data
  a.AccountId,
  a.CompanyName,
  a.LegalName,
  a.ClientId,
  a.Status,
  a.StatusDetail,
  a.OnboardedOnApp,
  a.Website,
  a.IsKA,
  a.IsMQL,
  a.Type,
  a.Language,
--   a.Referrer__c AS Referrer,
--   a.Leaser__c AS Leaser,
--   le.CompanyName AS LeaserName,
--   a.Reseller__c AS Reseller,
--   r.CompanyName AS ResellerName,
--   a.BusinessProvider__c AS BusinessProvider,
--   CASE WHEN a.Reseller__c IS NOT NULL OR a.BusinessProvider__c IS NOT NULL THEN 'Indirect' ELSE 'Direct' END AS TypeOfSale,
--   a.Timezone__c AS Timezone,
--   a.CameraRange__c AS CameraRange,
--   a.ChurnReason__c AS ChurnReason,
--   a.TotalCameras__c AS TotalCamerasCount,
--   a.EquippedCameras__c AS EquippedCamerasCount,
--   a.ExploitableCameras__c AS ExploitableCamerasCount,
--   a.ForecastedMRR__c AS ForecastedMrr,

--   -- Qualification
--   a.Source__c AS Source,
--   a.TopCategory__c AS TopCategory,
--   a.Category__c AS Category,
--   a.SubCategories__c AS Subcategories,
--   a.LeadRating__c AS UserRating,
--   a.RevOpsRating__c AS AutoRating,
--   a.NumberOfEmployees AS TotalEmployeesCount,
--   a.NumberOfStores__c AS StoreCount,
--   a.StoreSize__c AS StoreSize,
--   a.PlaceID__c AS PlaceId,
--   a.CompanyID__c AS CompanyId,

--   -- Call data
--   csm.NbOfCallsPrimaryCSM,
--   csm.PrimaryCSM,

--   -- Technical data
--   al.ClickRatePercent,
--   al.EscapedTheftsPercent,
--   al.TotalQualifiedThefts,
--   mi.NbMissedThefts,
--   mi.AvgCamerasRelevance,
--   mi.AvgCamerasDepthOfField,
--   mi.AvgCamerasScoringGrade,
--   a.DVRIP__c AS DvrIp,
--   a.DVRBrand__c AS DvrBrand,
--   a.LoginPassword__c AS LoginPassword,
--   a.PrivateInternet__c AS PrivateInternet,
--   a.ServerOwnership__c AS ServerOwnership,
--   a.TelegramChannel__c AS TelegramChannel,
--   a.TelegramGroupID__c AS TelegramGroupId,
--   a.TelegramGroupName__c AS TelegramGroupName,
--   a.RTSPPort__c AS RtspPort,

--   -- Financal data
--   a.PaymentType__c AS PaymentType,
--   a.PennylaneID__c AS PennylaneId,
--   a.VATNumber__c AS VatNumber,
--   a.PaymentInterval__c AS PaymentInterval,
  
--   -- Localization
--   a.StoreAddress__Street__s AS StoreStreet,
--   a.StoreAddress__City__s AS StoreCity,
--   a.StoreAddress__PostalCode__s AS StorePostalCode,
--   a.StoreAddress__CountryCode__s AS StoreCountryCode,
--   a.StoreAddress__Latitude__s AS StoreLatitude,
--   a.StoreAddress__Longitude__s AS StoreLongitude,
--   a.BillingStreet AS BillingStreet,
--   a.BillingCity AS BillingCity,
--   a.BillingPostalCode AS BillingPostalCode,
--   a.BillingCountryCode AS BillingCountryCode,
--   a.BillingLatitude AS BillingLatitude,
--   a.BillingLongitude AS BillingLongitude,
--   a.ShippingStreet AS ShippingStreet,
--   a.ShippingCity AS ShippingCity,
--   a.ShippingPostalCode AS ShippingPostalCode,
--   a.ShippingCountryCode AS ShippingCountryCode,
--   a.ShippingLatitude AS ShippingLatitude,
--   a.ShippingLongitude AS ShippingLongitude,
  
  -- Events
  a.CreatedDate,
  a.LastViewedDate,
  a.LastActivityDate,
  a.LastModifiedDate,
  
  -- Additional Metadata
  a.GoogleImagesCount,
  a.GoogleReviewsCount,
  a.GoogleRating,
  a.SecurityAgentsCount,

  -- Creator data
--   uc.Id AS CreatorId,
--   uc.FirstName AS CreatorFirstName,
--   uc.LastName AS CreatorLastName,
--   uc.FullName AS CreatorFullName,
--   uc.Email AS CreatorEmail,
--   uc.PhotoURL AS CreatorPhotoURL,
--   uc.Profile AS CreatorProfile,
--   uc.ManagerId AS CreatorManagerId,
--   uc.ManagerFirstName AS CreatorManagerFirstName,
--   uc.ManagerLastName AS CreatorManagerLastName,
--   uc.ManagerFullName AS CreatorManagerFullName,
--   uc.ManagerEmail AS CreatorManagerEmail,
--   uc.ManagerPhotoURL AS CreatorManagerPhotoURL,
--   uc.ManagerProfile AS CreatorManagerProfile,
  
-- Owner data
--   uo.Id AS OwnerId,
--   uo.LastName AS OwnerLastName,
--   uo.FullName AS OwnerFullName,
--   uo.Email AS OwnerEmail,
--   uo.PhotoURL AS OwnerPhotoURL,
--   uo.Profile AS OwnerProfile,
--   uo.ManagerId AS OwnerManagerId,
--   uo.ManagerFirstName AS OwnerManagerFirstName,
--   uo.ManagerLastName AS OwnerManagerLastName,
--   uo.ManagerFullName AS OwnerManagerFullName,
--   uo.ManagerEmail AS OwnerManagerEmail,
--   uo.ManagerPhotoURL AS OwnerManagerPhotoURL,
--   uo.ManagerProfile AS OwnerManagerProfile
  
FROM
  {{ref("stg_salesforce_accounts")}} AS a
-- -- Join curated user data on owners
-- LEFT JOIN `datawarehouse-384317.datamarts.dm_sf_users` AS uc ON a.CreatedById = uc.Id
-- -- Join curated user data on owners
-- LEFT JOIN `datawarehouse-384317.datamarts.dm_sf_users` AS uo ON a.OwnerId = uo.Id
-- --Join RecordType
-- LEFT JOIN `datawarehouse-384317.salesforce.RecordType` AS rt ON rt.Id = a.RecordTypeId
-- -- Join Alerts data
-- LEFT JOIN alerts al ON al.AccountId = a.Id
-- -- Join Missed Theft
-- LEFT JOIN  missedThefts mi ON mi.ClientId = a.ClientID__c
-- -- Join Calls
-- LEFT JOIN resellers AS r ON a.reseller__c = r.AccountId
-- LEFT JOIN leasers AS le ON a.leaser__c = le.AccountId
-- LEFT JOIN CSMWithMostCalls AS csm ON csm.AccountId = a.Id
-- WHERE
--   IsDeleted = FALSE