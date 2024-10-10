SELECT 
id AS CoreVideoRecorderId,
caching,
type_id AS TypeId,
password,
set_date AS SetDate,
store_id AS StoreId,
sub_type AS SubType,
username,
device_ip AS DeviceIp,
device_api_port AS DeviceAPIPort
FROM {{source('veesion_manager', 'core_videorecorder')}}
QUALIFY ROW_NUMBER() OVER(PARTITION BY Id ORDER BY _airbyte_extracted_at ASC) = 1