{{
  config
  ( 
    materialized='table'    
  )
}}

SELECT 
    PRODUCT_GROUP
    ,SUM(STOCK_QTY) AS TOTAL_QTY
    ,SUM(COST) AS TOTAL_COST 
FROM  ADQT_METADATA.PUBLIC.{{ var('Input_Table') }} 
WHERE 0=(SELECT total_records_failed FROM {{ ref('VALIDATE_WITH_CHECKPOINT_TABLE') }})
GROUP BY 
    1