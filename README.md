# Marketing common data modelling
	Welcome to Marketing common data modelling!


## Hints:
	- *Cost per engage* is just a spended sum divided by sum of engagements
	- *Conversion cost* is calculated by dividing sum of spended by total conversions count
	- *Impressions by channel* is a sum of impressions for each channel
	- *CPC* gets like sum of spended divided by clicks count

### Tools
To complete this task, you might need the following tools:
-   dbt Cloud
-   Google Big Query
-   Google Looker Studio



### How to Use the Repository
This is the foundational repository for your project. Clone it and start your dbt Cloud from it.

The repository includes raw data from various ad platforms, as well as the MCDM structure for the ads_basic_performance report, which are provided as seeds:

-   src_ads_bing_all_data
-   src_ads_creative_facebook_all_data
-   src_ads_tiktok_ads_all_data
-   src_promoted_tweets_twitter_all_data
-   mcdm_paid_ads_basic_performance_structure

### Adding Data from New Ad Platforms

To incorporate data from new ad platforms into your dbt project, follow these steps:

-   Import the Data: Place the `.csv` data file from the new ad platform into the seeds directory. This directory is where dbt looks for raw data files. Once the file is in the seeds directory, run the `dbt seed` command in dbt Cloud. This command will load the data from the .csv file into your database so that it can be used in your dbt models.

-   Create a Staging Model: For each new ad platform, create a new .sql file in the `models/staging` directory. This file should contain a SQL query that transforms the raw data from the new ad platform into a format that matches the Marketing Common Data Model (MCDM). This typically involves renaming columns, converting data types, and possibly creating new calculated columns. You can look at the existing `.sql` files in the `models/staging` directory for examples of how to do this.

-   Create a Fact Model: Create a new `.sql` file in the `models/facts` directory. This file should contain a SQL query that calculates the metrics you want to include in your report from the data in the staging model. The resulting table will be a "fact" table that can be used for analysis.
