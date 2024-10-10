SELECT 
id AS TelegramGroupMessageId,
sender_id AS SenderId,
recipient_id AS RecipientId,
content,
sent_on AS CreatedDate
FROM {{source('telegram', 'telegramapp_groupmessage')}}
QUALIFY ROW_NUMBER() OVER(PARTITION BY Id ORDER BY _airbyte_extracted_at ASC) = 1