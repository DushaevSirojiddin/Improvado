{{ config(materialized='table') }}

with src_facebook as (
    select
    ad_id as ad_id,
    add_to_cart as add_to_cart,
    adset_id as adset_id,
    campaign_id as campaign_id,
    channel as channel,
    clicks as clicks,
    comments as comments,
    creative_id as creative_id,
    __insert_date as date,
    clicks + comments + shares + purchase + views as engagements,
    impressions as impressions,
    mobile_app_install as installs,
    likes as likes,
    inline_link_clicks as link_clicks,
    NULL as placement_id,
    NULL as post_click_conversions,
    NULL as post_view_conversions,
    NULL as posts,
    purchase as purchase,
    complete_registration as registrations,
    NULL as revenue,
    shares as shares,
    spend as spend,
    purchase as total_conversions,
    views as video_views from {{ ref('src_ads_creative_facebook_all_data')}}
)

select * from src_facebook
