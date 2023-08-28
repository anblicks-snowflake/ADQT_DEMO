SELECT PRODUCT_GROUP,SUM(STOCK_QTY) TOTAL_QTY,SUM(COST) TOTAL_COST FROM  ADQT_METADATA.PUBLIC.SALES_DATA 
WHERE 0=(SELECT total_records_failed FROM {{ ref('VALIDATE_WITH_CHECKPOINT_TABLE') }})
GROUP BY PRODUCT_GROUP