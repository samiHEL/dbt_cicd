SELECT 
Id AS MarketDataId,
OwnerId,
Name,
SAM__c AS SAM,
TAM__c AS TAM,
Flag__c AS Flag,
Type__c AS Type,
IsDeleted,
CreatedDate,
LastViewedDate,
LastModifiedDate,
Location__c AS Location,
Location__City__s AS City,
Location__Street__s AS Street,
Location__Latitude__s AS Latitude,
Location__Longitude__s AS Longitude,
Location__StateCode__s AS StateCode,
Location__PostalCode__s AS PostalCode,
Location__CountryCode__s AS CountryCode,
Location__GeocodeAccuracy__s AS GeocodeAccuracy,
TopCategory__c AS TopCategory,
CurrencyIsoCode

FROM {{source('salesforce', 'MarketData__c')}}
QUALIFY ROW_NUMBER() OVER(PARTITION BY Id ORDER BY _airbyte_extracted_at ASC) = 1