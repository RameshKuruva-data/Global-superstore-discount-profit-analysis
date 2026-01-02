# using buckets to group the discount in category to solve problem 
with  bucket as (
select 
Sales,
Profit,

case
when Discount = 0 then "NO"
when Discount > 0 and Discount <=  0.2  then "Low"
when Discount > 0.2 and Discount <= 0.4 then "Medium"
when Discount > 0.4 then "High"
end as Discount_Bucket 
from global_superstore2
)
select 

Discount_Bucket,
round(sum(Sales),2) as total_sales,
round(sum(Profit),2) as total_profit,
round((sum(Profit)/ sum(Sales) * 100),2) as Profit_Margin
from bucket 
group by Discount_Bucket
order by  case
Discount_Bucket
when "NO" then 1
when "Low" then 2
when "Medium" then 3
when "High" then 4
end ;




# using subcategory to find where the place we are lacking to find out 

with  bucket as (
select 
Sales,
Profit,
sub_category,
case
when Discount = 0 then "NO"
when Discount > 0 and Discount <=  0.2  then "Low"
when Discount > 0.2 and Discount <= 0.4 then "Medium"
when Discount > 0.4 then "High"
end as Discount_Bucket 
from global_superstore2
)
select 
sub_category,
Discount_Bucket,
round(sum(Sales),2) as total_sales,
round(sum(Profit),2) as total_profit,
round((sum(Profit)/ sum(Sales) * 100),2) as Profit_Margin
from bucket 
group by Discount_Bucket,sub_category
order by  case
Discount_Bucket
when "NO" then 1
when "Low" then 2
when "Medium" then 3
when "High" then 4
end ;

