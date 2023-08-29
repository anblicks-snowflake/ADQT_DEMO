{{
  config
  ( 
    tags=["SALE"],
    pre_hook = "CALL ADQT_METADATA.PUBLIC.GX_VALIDATE_WITH_CHECKPOINT_TABLE('{{ var('Input_Table') }}','Sales Demo','Sales Demo Suite');" 
  )
}}

SELECT 
    MAIN.PARSED_JSON:total_records_failed::NUMBER AS total_records_failed
FROM 
    (SELECT PARSE_JSON(RESULT) PARSED_JSON FROM ADQT_METADATA.PUBLIC.VALIDATION_RESULTS main
WHERE 
    CREATED_DATE =(SELECT MAX(CREATED_DATE) CREATED_DATE 
                    FROM ADQT_METADATA.PUBLIC.VALIDATION_RESULTS)) MAIN