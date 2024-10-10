SELECT 
id AS TelegramUserId,
is_bot AS IsBot,
is_admin AS IsAdmin,
is_staff AS IsStaff,
username,
last_name AS LastName,
first_name AS FirstName
FROM {{source('telegram', 'telegramapp_telegramuser')}}
QUALIFY ROW_NUMBER() OVER(PARTITION BY Id ORDER BY _airbyte_extracted_at ASC) = 1