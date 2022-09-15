use arnowa;
show tables;
desc stocks_google;
/* 1. highest opening and the lowest closing values of each
month for Google.*/
select *from stocks_google;

select Month(Str_to_date(Date, "%d-%m-%y")) as month,
max(Open) as Highest_Open,
min(Close) as Min_close
from stocks_google 
group by month
order by month;

/* 2. the Standard deviation of Volume per year for Netflix.*/

select Year(str_to_date(Date, "%d-%m-%Y")) as Yearwise,
Stddev(Volume) as StdevofVolume
from stocks_netflix
Group by Yearwise
Order by Yearwise;

/* 3. Find the difference between the opening values of Amazon and Apple.*/

select * from stocks_amazon;
select * from stocks_apple;

select stocks_amazon.Open as AmazonOpen,
stocks_apple.Open as AppleOpen,
stocks_amazon.Open - stocks_apple.Open as Difference
from stocks_amazon, stocks_apple
where stocks_amazon.Date = stocks_apple.Date

/* 4. Find the largest daily return for Amazon. */

Select  Date, Open, Close,
(Close-Open) as DailyReturn
from stocks_amazon;

/* 5. Print the company name with the highest opening value for each day. */

create temporary table AllTables as
select * from stocks_amazon
union
select * from stocks_apple
union
select * from stocks_google
union
select * from stocks_microsoft
union
select * from stocks_netflix
union
select * from stocks_tesla;

select Date, Company, max(Open) as HighestOpening
from AllTables
group by Date;




     









 
