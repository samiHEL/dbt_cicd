SELECT 
id AS TelegramAlertLabelId,
name,
slug
FROM {{source('telegram', 'telegramapp_telegramalertlabel')}}
QUALIFY ROW_NUMBER() OVER(PARTITION BY Id ORDER BY _airbyte_extracted_at ASC) = 1