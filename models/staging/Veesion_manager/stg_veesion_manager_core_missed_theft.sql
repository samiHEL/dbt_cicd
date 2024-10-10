SELECT 
id AS CoreMissedTheftId,
date,
channel_id AS ChannelId,
operating_mode_id AS OperatingModeId
FROM {{source('veesion_manager', 'core_missedtheft')}}
QUALIFY ROW_NUMBER() OVER(PARTITION BY Id ORDER BY _airbyte_extracted_at ASC) = 1