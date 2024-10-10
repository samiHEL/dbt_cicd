SELECT 
id AS CoreChannelId,
relevance_id AS RelevanceId,
uid,
anchor,
protocol,
is_active AS IsActive,
view_area AS ViewArea,
body_theft AS BodyTheft,
recheckings,
consumption,
channel_name AS ChannelName,
deblistering,
favor_factor AS FavorFactor,
channel_index AS ChannelIndex,
no_suspicious AS NoSuspicious,
channel_number AS ChannelNumber,
depth_of_field_id AS DepthOfFieldId,
video_recorder_id AS VideoRecorderId,
inference_machine_id AS InferenceMachineId
FROM {{source('veesion_manager', 'core_channel')}}
QUALIFY ROW_NUMBER() OVER(PARTITION BY Id ORDER BY _airbyte_extracted_at ASC) = 1