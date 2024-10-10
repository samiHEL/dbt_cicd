SELECT 
Id AS AccountTeamMemberId,
UserId,
AccountId,
Title,
PhotoUrl,
IsDeleted,
CreatedDate,
LastModifiedDate,
TeamMemberRole,
CaseAccessLevel,
AccountAccessLevel,
ContactAccessLevel,
OpportunityAccessLevel,
CurrencyIsoCode
FROM {{source('salesforce', 'AccountTeamMember')}}
QUALIFY ROW_NUMBER() OVER(PARTITION BY Id ORDER BY _airbyte_extracted_at ASC) = 1