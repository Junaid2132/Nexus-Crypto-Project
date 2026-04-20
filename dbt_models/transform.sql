{{ config(
    materialized='table',
    partition_by={"field": "event_timestamp", "data_type": "timestamp", "granularity": "day"},
    cluster_by=["symbol"]
) }}

SELECT 
    symbol, 
    CAST(price AS FLOAT64) as price,
    TIMESTAMP_SECONDS(timestamp) as event_timestamp
FROM {{ source('raw', 'prices') }}