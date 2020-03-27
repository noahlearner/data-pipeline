SELECT ga1.month,  
       Ifnull(Sum(gSrch.GAds_Search_clicks),0) AS Google_Search_clicks,
       Ifnull(Sum(gSrch.GAds_Search_impressions),0) AS Google_Search_impressions,
       Ifnull(SAFE_DIVIDE(Ifnull(Sum(gSrch.Google_Search_ads_cost), 0) ,Ifnull(Sum(gSrch.GAds_Search_clicks),0)),0) as Google_Search_CPC,
       ifnull(SAFE_DIVIDE(Ifnull(Sum(gSrch.GAds_Search_clicks),0),Ifnull(Sum(gSrch.GAds_Search_impressions),0)),0) AS Google_Search_CTR,
       
       Ifnull(Sum(mads.microsoft_cost), 0) AS Microsoft_Cost,
       Ifnull(Sum(mads.Microsoft_clicks),0) AS Microsoft_ads_clicks,
       Ifnull(Sum(mads.Microsoft_impressions),0) AS Microsoft_ads_impressions,
       Ifnull(SAFE_DIVIDE(Ifnull(Sum(mads.microsoft_cost), 0),Ifnull(Sum(mads.Microsoft_clicks),0)),0) AS Microsoft_CPC,
       Ifnull(SAFE_DIVIDE(Ifnull(Sum(mads.Microsoft_clicks),0),Ifnull(Sum(mads.Microsoft_impressions),0)),0) AS Microsoft_ads_CTR,
       
       Ifnull(Sum(fads.Facebook_Cost), 0) AS Facebook_cost,
       Ifnull(Sum(ftrends.Facebook_Reach), 0) AS Facebook_Reach,
       Ifnull(Sum(fads.Facebook_Clicks),0) AS Facebook_clicks,
       Ifnull(Sum(fads.Facebook_Link_Clicks),0) AS Facebook_link_clicks,
       Ifnull(Sum(fads.Facebook_CPM),0) AS Facebook_CPM,
       Ifnull(Sum(fads.Facebook_Impressions),0) AS Facebook_impressions,
       ifnull(SAFE_DIVIDE(Ifnull(Sum(fads.Facebook_Cost), 0),Ifnull(Sum(fads.Facebook_Clicks),0)),0) AS Facebook_CPC,
       ifnull(SAFE_DIVIDE(Ifnull(Sum(fads.Facebook_Clicks),0),Ifnull(Sum(fads.Facebook_Impressions),0)),0) AS Facebook_CTR,
       
       Sum(Ifnull(mads.microsoft_cost,0) + Ifnull(gads.Google_ads_cost,0)) AS Google_and_Microsoft_Ads_Cost,
       Ifnull(Sum(mads.Microsoft_clicks) + Sum(gads.GAds_clicks),0) AS Google_and_Microsoft_clicks,
       ifnull(Sum(mads.Microsoft_impressions) + Sum(gads.GAds_impressions),0) AS Google_and_Microsoft_impressions,
       ifnull(SAFE_DIVIDE(Sum(Ifnull(mads.microsoft_cost,0) + Ifnull(gads.Google_ads_cost,0)),Ifnull(Sum(mads.Microsoft_clicks) + Sum(gads.GAds_clicks),0)),0) AS Google_and_Microsoft_CPC,
       Ifnull(SAFE_DIVIDE(Sum(mads.Microsoft_clicks) + Sum(gads.GAds_clicks),Sum(mads.Microsoft_impressions) + Sum(gads.GAds_impressions)),0) AS Google_and_Microsoft_CTR,
       Ifnull(SAFE_DIVIDE(sum(Ifnull(mads.microsoft_cost,0) + Ifnull(gads.Google_ads_cost,0)), Avg(ga2.All_Paid_Goal_Completions)),0) AS G_Ads_and_Microsoft_Cost_Per_Conversion,
       Ifnull(SAFE_DIVIDE(sum(Ifnull(mads.microsoft_cost,0) + Ifnull(gads.Google_ads_cost,0)), Avg(ga2.All_Paid_Goal_Completions)),0) AS G_Ads_and_Microsoft_Conversion,

       Sum(Ifnull(mads.microsoft_cost, 0) + Ifnull(gSrch.Google_Search_ads_cost, 0)) AS Paid_Search_Cost,
       Ifnull(Sum(gSrch.GAds_Search_clicks),0) + Ifnull(Sum(mads.Microsoft_clicks),0) AS Paid_Search_Clicks,
       Ifnull(Sum(gSrch.GAds_Search_impressions),0) + Ifnull(Sum(mads.Microsoft_impressions),0) AS Paid_Search_Impressions,
       Ifnull(SAFE_DIVIDE(Ifnull(Sum(mads.microsoft_cost), 0) +Ifnull(Sum(gSrch.Google_Search_ads_cost), 0),Ifnull(Sum(gSrch.GAds_Search_clicks),0) + Ifnull(Sum(mads.Microsoft_clicks),0)),0) AS Paid_Search_CPC,
       ifnull(SAFE_DIVIDE(Ifnull(Sum(gSrch.GAds_Search_clicks),0) + Ifnull(Sum(mads.Microsoft_clicks),0) ,Ifnull(Sum(mads.Microsoft_impressions),0) +Ifnull(Sum(gSrch.GAds_Search_impressions),0)),0) AS Paid_search_CTR,
       Ifnull(SAFE_DIVIDE(sum(mads.microsoft_cost + gSrch.Google_Search_ads_cost), sum(gaSearch.Paid_Search_Goal_Completions)),0) AS Paid_Search_Cost_Per_Conversion,
       Ifnull(SAFE_DIVIDE(sum(gaSearch.Paid_Search_Goal_Completions), sum(gaSearch.Sessions)),0) AS Paid_Search_Conv_Rate,
       Ifnull(Avg(ga1.All_Goal_Completions), 0) AS All_Goal_Completions ,
       Ifnull(Avg(gaSearch.Paid_Search_Goal_Completions), 0) AS Paid_Search_Goal_Completions ,
       Ifnull(Avg(gad.Display_Goal_Completions), 0) AS Display_Goal_Completions ,
       Ifnull(Avg(ga2.All_Paid_Goal_Completions), 0) AS All_Paid_Goal_Completions ,
       Ifnull(SAFE_DIVIDE(Ifnull(Sum(mads.microsoft_cost), 0) +Ifnull(Sum(gads.Google_ads_cost), 0),Ifnull(Avg(ga2.All_Paid_Goal_Completions), 0)),0) AS Cost_per_paid_Conversion,
       Ifnull(Avg(ga2.Paid_Conv_Rate), 0) AS Paid_Conv_Rate ,
       Ifnull(Avg(gae.Goal_Conversion_Rate ), 0) AS Goal_Conv_Rate ,
       Ifnull(Sum(mf.Management_Fees), 0) AS EC_Management_Fees,
       Sum(Ifnull(mads.microsoft_cost,0) + Ifnull(gads.Google_ads_cost,0) + Ifnull(fads.Facebook_Cost,0)) AS Total_Ads_Cost,
       sum(Ifnull(mf.Management_Fees, 0) + Ifnull(mads.microsoft_cost,0) + Ifnull(gads.Google_ads_cost,0) + Ifnull(fads.Facebook_Cost,0)) AS Adspend_plus_management,
       Ifnull(SAFE_DIVIDE(sum(Ifnull(mads.microsoft_cost,0) + Ifnull(gads.Google_ads_cost,0) + Ifnull(fads.Facebook_Cost,0) + Ifnull(mf.Management_Fees, 0)), Avg(ga1.All_Goal_Completions)),0) AS Cost_Per_Lead,
      ifnull(sum(gaGoals.goal_1_completions),0) as goal_1_completions, 
      ifnull(sum(gaGoals.goal_2_completions),0) as goal_2_completions, 
      ifnull(sum(gaGoals.goal_3_completions),0) as goal_3_completions, 
      ifnull(sum(gaGoals.goal_4_completions),0) as goal_4_completions, 
      ifnull(sum(gaGoals.goal_5_completions),0) as goal_5_completions, 
      ifnull(sum(gaGoals.goal_6_completions),0) as goal_6_completions, 
      ifnull(sum(gaGoals.goal_7_completions),0) as goal_7_completions, 
      ifnull(sum(gaGoals.goal_8_completions),0) as goal_8_completions, 
      ifnull(sum(gaGoals.goal_9_completions),0) as goal_9_completions, 
      ifnull(sum(gaGoals.goal_10_completions),0) as goal_10_completions, 
      ifnull(sum(gaGoals.goal_11_completions),0) as goal_11_completions, 
      ifnull(sum(gaGoals.goal_12_completions),0) as goal_12_completions,
      ifnull(sum(gaGoals.goal_13_completions),0) as goal_13_completions, 
      ifnull(sum(gaGoals.goal_14_completions),0) as goal_14_completions, 
      ifnull(sum(gaGoals.goal_15_completions),0) as goal_15_completions, 
      ifnull(sum(gaGoals.goal_16_completions),0) as goal_16_completions, 
      ifnull(sum(gaGoals.goal_17_completions),0) as goal_17_completions,
      ifnull(sum(gaGoals.goal_18_completions),0) as goal_18_completions,
      ifnull(sum(gaGoals.goal_19_completions),0) as goal_19_completions, 
      ifnull(sum(gaGoals.goal_20_completions),0) as goal_20_completions,
      Ifnull(sum(gagmb.GMB_Conversions), 0) AS GMB_Conversions,
      Ifnull(sum(gagmb.GMB_Sessions), 0) AS GMB_Sessions,
      Ifnull(sum(gagmb.GMB_Conversion_Rate), 0) AS GMB_Conversion_Rate,
      Ifnull(sum(gaPh.GMB_Phone_Conversions), 0) AS GMB_Phone_Conversions,
      Ifnull(sum(gmb.GMB_Website_Visits), 0) AS GMB_Website_Visits,
      Ifnull(sum(gmb.GMB_Direct_Search_Impressions), 0) AS GMB_Direct_Search_Impressions,
      Ifnull(sum(gmb.GMB_Discovery_Search_Impressions), 0) AS GMB_Discovery_Search_Impressions,
      Ifnull(sum(gads.GAds_impressions),0) + Ifnull(sum(mads.Microsoft_impressions),0) + Ifnull(sum(fads.Facebook_Impressions),0) AS Combined_Impressions,
      Ifnull(sum(gads.GAds_clicks),0) + Ifnull(sum(mads.Microsoft_clicks),0) + Ifnull(sum(fads.Facebook_Clicks), 0) AS Combined_Clicks,
      
      Ifnull(SAFE_DIVIDE(
             Ifnull(Ifnull(sum(gads.GAds_clicks),0) + Ifnull(sum(mads.Microsoft_clicks),0) + Ifnull(sum(fads.Facebook_Clicks), 0),0),
             Ifnull(sum(gads.GAds_impressions),0) + Ifnull(sum(mads.Microsoft_impressions),0) + Ifnull(sum(fads.Facebook_Impressions),0)),0) AS Combined_Ctr,
       Ifnull(SAFE_DIVIDE(Ifnull(sum(gads.Google_ads_cost),0) + Ifnull(sum(mads.Microsoft_Cost),0) + Ifnull(sum(fads.Facebook_Cost), 0),
 Ifnull(sum(gads.GAds_clicks),0) + Ifnull(sum(mads.Microsoft_clicks),0) + Ifnull(sum(fads.Facebook_Clicks),0)), 0) AS Combined_Cpc
      
FROM   (SELECT Month as month,
               Ifnull(Sum( Goal_completions_all_goals ), 0) AS All_Goal_Completions 
        FROM   {{ref('GA')}}
        GROUP  BY month) ga1
        
        LEFT Join(SELECT Month,
               Ifnull(Sum( Goal_completions_all_goals ), 0) AS All_Paid_Goal_Completions, 
               ifnull(SAFE_DIVIDE(Ifnull(Sum( Goal_completions_all_goals ),0),Ifnull(Sum( Sessions ), 0)),0) as Paid_Conv_Rate
        FROM   {{ref('GA')}}
        WHERE REGEXP_CONTAINS(Medium, r"(display|ppc|cpc|CPC)")
        AND REGEXP_CONTAINS(Source, r"(google|bing|yahoo|Bing|display)")
        GROUP  BY Month) ga2
        
   on ga1.month = ga2.Month     
LEFT Join (SELECT Month,  Ifnull(Sum( Sessions ), 0) as Sessions,
               Ifnull(Sum( Goal_completions_all_goals ), 0) AS Paid_Search_Goal_Completions 
        FROM   {{ref('GA')}}
        WHERE NOT REGEXP_CONTAINS(Campaign, r"(.display.|isplay|youtube|Display|YouTube|youtube|remarketing|Remarketing)")
        AND Medium ="cpc"
        GROUP  BY Month) gaSearch
        ON ga1.month = gaSearch.month
       JOIN 
        (SELECT Month,
               Ifnull(Sum( Goal_completions_all_goals ), 0) AS All_Paid_Goal_Completions 
        FROM   {{ref('GA')}}
        WHERE Medium ="cpc"
        GROUP  BY Month) ga
        
        ON ga1.month = ga.month
LEFT Join (SELECT Month,
               Ifnull(Sum( Goal_completions_all_goals ), 0) AS Display_Goal_Completions 
        FROM   {{ref('GA')}}
        WHERE REGEXP_CONTAINS(Campaign, r"(.display.|isplay|outube|YouTube)")
        AND Medium ="cpc"
        GROUP  BY Month) gad
        
        ON ga1.month = gad.month
LEFT Join (SELECT Month,
               ifnull(SAFE_DIVIDE(Ifnull(Sum( Goal_completions_all_goals ),0),Ifnull(Sum( Sessions ), 0)),0) AS Goal_Conversion_Rate 
        FROM   {{ref('GA')}}
        GROUP  BY Month) gae
        
        ON ga1.month = gae.month
        
       LEFT JOIN (SELECT Date, 
                         Ifnull(Sum(Budget), 0) AS Management_Fees 
                  FROM   {{ref('Management')}} where Client = '{{ var("cleanClient") }}'
                  GROUP  BY Date) AS mf 
              ON ga1.month = mf.Date
       LEFT JOIN (SELECT month, 
                         Ifnull(Sum(cost__usd_), 0) AS Google_ads_cost, 
                         sum(Impressions) as GAds_impressions, 
                         sum(Clicks) as GAds_clicks  
                  FROM   {{ref('GoogleAds')}} 
                  GROUP  BY month) AS gads 
              ON ga1.month = gads.month
       LEFT JOIN (SELECT month, 
                         Ifnull(Sum(cost__usd_), 0) AS Google_Search_ads_cost, sum(Impressions) as GAds_Search_impressions, sum(Clicks) as GAds_Search_clicks  
                  FROM   {{ref('GoogleAds')}} 
                  WHERE NOT REGEXP_CONTAINS(Campaign_name, r"(.display.|youtube|Display|YouTube|youtube|remarketing|Remarketing)")
                  GROUP  BY month) AS gSrch 
              ON ga1.month = gSrch.month 
       LEFT JOIN (SELECT month, 
                         Ifnull(Sum(cost__usd_), 0) AS Google_display_cost, sum(Impressions) as Google_Display_impressions, sum(Clicks) as Google_Display_clicks  
                  FROM   {{ref('GoogleAds')}} 
                  WHERE REGEXP_CONTAINS(Campaign_name, r"(.display.|isplay)")
                  GROUP  BY month) AS gd 
              ON ga1.month = gd.month
       LEFT JOIN (SELECT month, 
                         Ifnull(Sum(cost__usd_), 0) AS Google_Youtube_cost, sum(Impressions) as Google_Youtube_impressions, sum(Clicks) as Google_Youtube_clicks  
                  FROM   {{ref('GoogleAds')}} 
                  WHERE REGEXP_CONTAINS(Campaign_name, r"(.outube|YouTube|ouTube)")
                  GROUP  BY month) AS gy 
              ON ga1.month = gy.month
       LEFT JOIN (SELECT month, 
                         Ifnull(Sum(cost__usd_), 0) AS Microsoft_Cost, sum(Impressions) as Microsoft_impressions, sum(Clicks) as Microsoft_clicks
                  FROM   {{ref('Microsoft')}} 
                  GROUP  BY month) AS mads 
              ON ga1.month = mads.month 
       LEFT JOIN (SELECT month, 
                         Ifnull(Sum(cost), 0) AS Facebook_Cost,
                         Ifnull(Sum(Impressions), 0) AS Facebook_Impressions,
                         Ifnull(Sum(CPM__cost_per_1000_impressions_), 0) AS Facebook_CPM,
                         Ifnull(Sum(Clicks__all_), 0) AS Facebook_Clicks,
                         Ifnull(Sum( Link_clicks ), 0) AS Facebook_Link_Clicks,
                         SAFE_DIVIDE(ifnull(Sum(Clicks__all_), 0),Ifnull(Sum(Impressions), 0)) AS Facebook_CTR,
                  FROM   {{ref('Facebook')}} 
                  GROUP  BY month) AS fads 
              ON ga1.month = fads.month
       LEFT JOIN (SELECT month, 
                         Ifnull(Sum(Reach), 0) AS Facebook_Reach,
                  FROM   {{ref('Facebook_trends')}} 
                  GROUP  BY month) AS ftrends 
              ON ga1.month = ftrends.month
      LEFT JOIN (SELECT Month,  
      ifnull(sum(Goal_completions_all_goals),0) as all_goal_completions,
      ifnull(sum(Goal_1_completions),0) as goal_1_completions, 
      ifnull(sum(Goal_2_completions),0) as goal_2_completions, 
      ifnull(sum(Goal_3_completions),0) as goal_3_completions, 
      ifnull(sum(Goal_4_completions),0) as goal_4_completions, 
      ifnull(sum(Goal_5_completions),0) as goal_5_completions, 
      ifnull(sum(Goal_6_completions),0) as goal_6_completions, 
      ifnull(sum(Goal_7_completions),0) as goal_7_completions, 
      ifnull(sum(Goal_8_completions),0) as goal_8_completions, 
      ifnull(sum(Goal_9_completions),0) as goal_9_completions, 
      ifnull(sum(Goal_10_completions),0) as goal_10_completions, 
      ifnull(sum(Goal_11_completions),0) as goal_11_completions, 
      ifnull(sum(Goal_12_completions),0) as goal_12_completions,
      ifnull(sum(Goal_13_completions),0) as goal_13_completions, 
      ifnull(sum(Goal_14_completions),0) as goal_14_completions, 
      ifnull(sum(Goal_15_completions),0) as goal_15_completions, 
      ifnull(sum(Goal_16_completions),0) as goal_16_completions, 
      ifnull(sum(Goal_17_completions),0) as goal_17_completions,
      ifnull(sum(Goal_18_completions),0) as goal_18_completions,
      ifnull(sum(Goal_19_completions),0) as goal_19_completions, 
      ifnull(sum(Goal_20_completions),0) as goal_20_completions,
                  FROM   {{ref('GA_Goals')}}
                  GROUP  BY Month) AS gaGoals 
              ON ga1.month = gaGoals.Month
       LEFT Join (SELECT Month,
               Ifnull(Sum( Goal_completions_all_goals ),0) AS GMB_Conversions, Ifnull(Sum( Sessions ),0) as GMB_Sessions, 
                SAFE_DIVIDE(ifnull(Sum(Goal_completions_all_goals), 0),Ifnull(Sum(Sessions), 0)) AS GMB_Conversion_Rate
        FROM   {{ref('GA')}}
        WHERE REGEXP_CONTAINS(Source, r"(GMB|gmb)") 
        GROUP  BY Month) gagmb
        ON ga1.month = gagmb.month
        LEFT Join (SELECT Month,
               Ifnull(Sum( Goal_completions_all_goals ),0) AS GMB_Phone_Conversions
        FROM   {{ref('GA')}}
        WHERE REGEXP_CONTAINS(Source, r"(GMB|gmb)") and REGEXP_CONTAINS(Campaign, r"(Phone|phone)") 
        GROUP  BY Month) gaPh
        ON ga1.month = gaPh.month
        LEFT Join (SELECT Year___month as month,
               Ifnull(Sum(Phone_calls),0) AS GMB_Phone_Calls, 
               Ifnull(Sum( Website_visits ),0) as GMB_Website_Visits,
               Ifnull(Sum( Direct_search_impressions ),0) as GMB_Direct_Search_Impressions,
               Ifnull(Sum( Discovery_search_impressions ),0) as GMB_Discovery_Search_Impressions 
        FROM   {{ref('GMB')}} 
        GROUP  BY Year___month) gmb
        
        ON ga1.month = gmb.month 
GROUP  BY ga1.month 
ORDER  BY ga1.month DESC 
