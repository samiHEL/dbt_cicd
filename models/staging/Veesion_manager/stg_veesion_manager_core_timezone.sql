SELECT 
id AS CoreTimezoneId,
code
FROM {{source('veesion_manager', 'core_timezone')}}
QUALIFY ROW_NUMBER() OVER(PARTITION BY Id ORDER BY _airbyte_extracted_at ASC) = 1