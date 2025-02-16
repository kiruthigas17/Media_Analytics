create database media_analytics;
use media_analytics;

#Facebook Analysis 
#1.Total Cost 
select concat(round(sum(Cost)/100000,3),"L") as Total_Cost from facebook_data;

#2.Total Impression 
select concat(round(sum(Impressions)/1000000,2),"M") as Total_Impressions from facebook_data;

#3.Total Links Click
select concat(round(sum(Link_Clicks)/100000,2),"L") as Total_Links from facebook_data;

#4.Total Page Likes 
select concat(round(sum(Page_Likes)/1000,2),"k") as Total_Page_likes from facebook_data;

#5.Total People Reached 
select concat(round(sum(Reach)/1000000,2),"M") as Total_People_Reached from facebook_data;

#6.Total Post(Comments, Reactions,Share) 
select Concat(round(sum(Post_Comments)/1000,2),"k") as Total_Post_comments , 
concat(round(sum(Post_Reactions) /1000,2),"k")as Total_Post_reactions,
concat(round(sum(Total_Post_Shares)/1000,2),"k") as Total_Post_shares 
from facebook_data;

#7.Total Social Interactions 
select concat(round(sum(Total_Social_Interactions)/1000,2),"k") as Total_Social_Interactions 
from facebook_data;

#8.Total Website(Leads,Purchase,Purchase value)
select concat(round(sum(Total_Website_Leads)/1000,2),"k") as Total_Website_Leads, 
concat(round(sum(Website_Purchases)/1000,2),"k") as Total_Website_Purchases, 
concat(round(sum(Total_Website_Purchases_Value)/1000000,2),"M") as Total_Website_PurchaseValue 
from facebook_data;

#9.Total Campaign 
select concat(round(count(Campaign_Name)/1000,2),"k") as Total_Campaign from facebook_data;

#10.Avg Purchase Value : [Total Website Purchases Value] / [Total Website Purchases]
select round(sum(Total_Website_Purchases_Value)/sum(Website_Purchases),2) as Average_Purchase_Value 
from facebook_data;

#11.Cost per People Reached : [Total Cost] / [Total People Reached]
select round(sum(Total_Cost)/sum(Reach),2) as Cost_per_People_Reached 
from facebook_data;

#12.CPA (Cost per Action) : [Total Cost] / [Total Social Interactions]
select concat("$",round(sum(Cost)/sum(Total_Social_Interactions),2)) as CPA 
from facebook_data;

#13.CPC (Cost per Click) : [Total Cost] / [Total Link Clicks]
select concat("$",round(sum(Cost)/sum(Total_Link_Clicks),2))as CPC 
from facebook_data;

#14.CPL (Cost per Lead) : [Total Cost] / [Total Website Leads]
select concat("$",round(sum(Cost)/sum(Total_Website_Leads),2)) as CPL 
from facebook_data;

#15.CPM (Cost per 1'000 impressions) : [Total Cost] / [Total K. Impressions]
select concat("$",round((sum(Cost)/sum(Impressions))*1000,2))as CPM 
from facebook_data;

#16.CTR (Click-Through-Rate) : [Total Link Clicks] / [Total Impressions]
select concat(round((sum(Link_Clicks)/sum(Impressions))*100,2),"%") as CTR 
from facebook_data;

#17.LTR (Lead-Through-Rate) : [Total Website Leads] / [Total Link Clicks]
select concat(round((sum(Total_Website_Leads)/sum(Link_Clicks))*100,2),"%") as LTR 
from facebook_data;

#18.Page Likes per Impression : [Total Page Likes] / [Total Impressions]
select concat(round((sum(Page_Likes)/sum(Impressions))*100,2),"%") as Pages_Likes_per_Impressions 
from facebook_data;

#19.Post Comments per Impression : [Total Post Comments] / [Total Impressions]
select concat(round((sum(Post_Comments)/sum(Impressions))*100,3),"%") as Post_Comments_per_Impression 
from facebook_data;

#20.Post Reactions per Impression : [Total Post Reactions] / [Total Impressions]
select concat(round((sum(Post_Reactions)/sum(Impressions))*100,2),"%") as Post_Reactions_per_Impression
from facebook_data;

#21.Post Shares per Impression : [Total Post Shares] / [Total Impressions]
select concat(round((sum(Total_Post_Shares)/sum(Impressions))*100,3),"%") as Post_shares_per_Impressions 
from facebook_data;

#22.ROI % : [Total Margin] / [Total Cost]
select round((sum(Total_Website_Purchases_Value)-sum(Cost))/sum(Cost),2)as ROI 
from facebook_data;

#23.Social Interaction per Impression : [Total Social Interactions] / [Total Impressions]
select concat(round((sum(Total_Social_Interactions)/sum(Impressions))*100,2),"%") as Social_Interaction_per_Impressions 
from facebook_data;

#24.Total Margin : [Total Website Purchases Value] - [Total Cost]
select concat(round((sum(Total_Website_Purchases_Value)-sum(Cost))/100000,2),"L") as Total_Margin 
from facebook_data;

#EXTRA KPI 
#Gender Wise Post Comments , Reactions & Shares)
select Gender, sum(Post_Comments) as Total_Post_Comments 
from facebook_data
group by Gender;

select Gender, sum(Post_Reactions) as Total_Post_Reactions
from facebook_data
group by Gender;

select Gender,sum(Total_Post_Shares) as Total_Post_Shares
from facebook_data
group by Gender;

#Month wise Page likes,Social Interaction & Post Reactions
select monthname(Report_Start_Date) as Month_Name , concat(round(sum(Page_Likes)/1000,2),"k") as Total_Page_likes 
from facebook_data
group by Month_Name;

select monthname(Report_Start_Date) as Month_Name , concat(round(sum(Total_Social_Interactions)/1000,2),"k") as Total_Social_Comments 
from facebook_data
group by Month_Name;

select monthname(Report_Start_Date) as Month_Name , concat(round(sum(Post_Reactions)/1000,2),"k") as Total_Post_Reactions
from facebook_data
group by Month_Name;

#Age wise Website Purchase & Purchases_Value

select Age,round(sum(Website_Purchases),2) as Total_Website_Purchases 
from facebook_data 
group by Age;

select Age,round(sum(Total_Website_Purchases_Value),2) as Total_Website_Purchases 
from facebook_data 
group by Age;






#LinkedIn Analysis
# 1.Total views
select concat(round(sum(Views)/100000,2),"L") as Total_Views from linkedin_data;

# 2.Total reactions
select concat(round(sum(Reactions)/1000,2),"k") as Total_Reactions from linkedin_data;

# 3.Total Comments
select sum(Comments) as Total_Comments from linkedin_data;

# 4.Total Reposts
select sum(Reposts) as Total_Reposts from linkedin_data;

# 5.Average Enagagement per post
select round(sum(Comments+Reactions+Reposts)/count(Link_to_Post),2)
as  Average_Enagagement_per_post  from linkedin_data;

#6.Follower Growth over time 
select monthname(Date) as Month_name , concat(round(sum(Followers)/1000),"k") as Followers from linkedin_data
group by Month_name;

#7. Engagement Rate 
select concat(round((sum(Reactions+Comments+Reposts)/sum(Views))*100,2),"%")
as Engagement_rate 
from linkedin_data;

#8.Top performing posts 

select Topic, sum(Views)as Views from linkedin_data 
group by Topic
order by Views desc
limit 5;

select Topic, sum(Comments) as Comments  from linkedin_data 
group by Topic 
order by Comments desc
Limit 5;

select Topic, sum(Reactions) as Reactions  from linkedin_data 
group by Topic 
order by Reactions desc
Limit 5;

#9.Engagement by topic
select Topic, sum(Reactions+Comments+Reposts) as Enagagement_value  
from linkedin_data 
group by Topic ;

#10.Trend Analysis 
select monthname(Date) as Month_name , concat(round(sum(views)/1000),"k") as views from linkedin_data
group by Month_name;

#11.Reposts/View Ratio
select concat(round((sum(reposts)/sum(views))*100,3),"%") as Reposts_View_ratio from linkedin_data;

#12.Comments/View Ratio
select concat(round((sum(comments)/sum(views))*100,2),"%") as Comments_View_ratio from linkedin_data;

#13.Peak Posting times 
select monthname(Date) as Month_name , count(Link_to_Post) as Posts from linkedin_data
group by Month_name;

#14.Posts per topic 
select topic , count(Link_to_Post) as Posts from linkedin_data
group by topic;




