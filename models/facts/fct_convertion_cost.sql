with
    facebook_conversion_cost as (
        select 
            channel, 
            spend, 
            total_conversions
        from {{ ref("stg_facebook") }}
    ),

    tiktok_conversion_cost as (
        select 
            channel, 
            spend, 
            total_conversions
        from {{ ref("stg_tiktok") }}
    ),

    bing_conversion_cost as (
        select 
            channel, 
            spend, 
            total_conversions
        from {{ ref("stg_bing") }}
    ),

    twitter_conversion_cost as (
        select 
            channel, 
            0 as spend, 
            0 as total_conversions
        from {{ ref("stg_twitter") }}
    ),

    conversion_cost as (
        select * from facebook_conversion_cost
        union all
        select * from tiktok_conversion_cost
        union all
        select * from bing_conversion_cost
        union all
        select * from twitter_conversion_cost
    ),

    aggregated as (
        select 
            channel, 
            sum(spend) as total_spend, 
            sum(total_conversions) as total_conversion_cost
        from conversion_cost
        group by channel
    )

select 
    channel, 
    round(ifnull(total_spend / nullif(total_conversion_cost, 0), 0), 2) as conversion_cost
from aggregated
