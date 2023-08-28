{{
  config(
    post_hook = "CALL ADQT_METADATA.PUBLIC.GX_VALIDATE_WITH_CHECKPOINT_TABLE('{{ var('Input_Table') }}','Sales Demo','Sales Demo Suite');"
  )
}}
select 1 as id