SELECT 
id AS CoreRelevanceId,
name,
value
FROM {{source('veesion_manager', 'core_relevance')}}
QUALIFY ROW_NUMBER() OVER(PARTITION BY Id ORDER BY _airbyte_extracted_at ASC) = 1