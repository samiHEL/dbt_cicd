SELECT 
id AS CoreButtonsTypeId,
name
FROM {{source('veesion_manager', 'core_buttonstype')}}
QUALIFY ROW_NUMBER() OVER(PARTITION BY Id ORDER BY _airbyte_extracted_at ASC) = 1