-- dbt deps
-- Improvado/macros/calculate_metric.sql

{{ calculate_metric(['stg_twitter', 'stg_facebook', 'stg_bing', 'stg_tiktok'], 'spend', 'engagements', 'cost_per_engage') }}
