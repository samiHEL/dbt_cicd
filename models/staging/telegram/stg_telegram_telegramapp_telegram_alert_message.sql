SELECT 
id AS TelegramAlertMessageId,
sender_id AS SenderId,
message_id AS MessageId,
alert_label_id AS AlertLabelId,
responded_user_id AS RespondedUserId,
telegram_group_id AS TelegramGroupId,
sent_time AS SentTime,
location,
alert_name AS AlertName,
theft_value AS TheftValue,
action_detail AS ActionDetail,
video_removed AS IsVideoRemoved,
generated_time AS GeneratedTime,
responded_time AS RespondedTime,
response_action AS ResponseAction
FROM {{source('telegram', 'telegramapp_telegramalertmessage')}}
QUALIFY ROW_NUMBER() OVER(PARTITION BY Id ORDER BY _airbyte_extracted_at ASC) = 1