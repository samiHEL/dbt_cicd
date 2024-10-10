SELECT 
id AS UserId,
mail,
name,
lastName,
firstName,
login,
culture,
manager,
department,
legalEntity,
dtContractEnd,
rolePrincipal,
dtContractStart
FROM {{source('lucca', 'Users')}}
QUALIFY ROW_NUMBER() OVER(PARTITION BY Id ORDER BY _airbyte_extracted_at ASC) = 1