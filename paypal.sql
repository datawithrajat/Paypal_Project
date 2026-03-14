
show tables;
Desc countries;

-- As a financial analyst at PayPal, you are tasked with analyzing transaction data to identify key markets.

-- top 5 countries by total transaction amount for both sending and receiving funds in the last quarter of 2023 (October to December 2023).
-- Additionally, round the totalsent and totalreceived amounts to 2 decimal places.

Alter table countries
change ï»¿country_id country_id int;

Alter table transactions 
change ï»¿transaction_id transaction_id int;

Alter table merchants
Change ï»¿merchant_id merchant_id INT;

Alter table CURRENCIES
Change ï»¿currency_code currency_code char(3);

Alter table users
change ï»¿user_id user_id int;

desc countries;
desc transactions;
desc merchants; 
desc users;
DESC CURRENCIES;

select * from currencies;


-- As a financial analyst at PayPal, you are tasked with analyzing transaction data to identify key markets.

-- top 5 countries by total transaction amount for both sending and receiving funds in the last quarter of 2023 (October to December 2023).
-- Additionally, round the totalsent and totalreceived amounts to 2 decimal places.

select * from transactions;
select * from users;

Select 
	c.country_name,
    Round(sum(t.transaction_amount),2) AS total_sent
from countries c 
join users u 
on c.country_id = u.country_id
join transactions t
on u.user_id = t.sender_id
group by c.country_name
order by total_sent desc
limit 5;
	
Select 
	c.country_name,
    Round(sum(t.transaction_amount),2) AS total_rescevied 
from countries c 
join users u 
on c.country_id = u.country_id
join transactions t
on u.user_id = t.recipient_id
group by c.country_name
order by total_rescevied desc
limit 5;

Select 
    c.country_name,
    round(sum(transaction_amount),2)AS Total_Sent
    from countries c 
    join users u 
    on c.country_id = u.country_id 
    join transactions t 
    on u.user_id = t.sender_id 
    group by   c.country_name
    limit 5;
    
    Select 
    c.country_name,
    round(sum(transaction_amount),2)AS total_recevied
    from countries c 
    join users u 
    on c.country_id = u.country_id 
    join transactions t 
    on u.user_id = t.recipient_id 
    group by   c.country_name
    order by total_recevied desc
    limit 5;
    
    Select 
    c.country_name,
    round (sum(transaction_amount),2) AS total_received
    from countries c 
    join users u 
    on c.country_id = u.country_id 
    join transactions t 
    on u.user_id = t.recipient_id 
    where t.transaction_date between '2023-10-01' and '2024-01-01' 
    group by   c.country_name
    order by total_received desc
    limit 5;

Select 
    transaction_id,
    sender_id,
    recipient_id,
    transaction_amount,
    currency_code
from transactions
where extract(year from transaction_date) = 2023 and transaction_amount > '10000';

Select
    m.merchant_id,
    m.business_name,
    sum(t.transaction_amount) as total_recevied
from merchants m 
join transactions t 
on m.merchant_id = t.recipient_id 
Where transaction_date between '2023-11-01' AND '2024 - 05 -01'
order by total_recevied desc
limit 10;

Select
    m.merchant_id,
    m.business_name,
    sum(t.transaction_amount) as total_recevied
from merchants m 
join transactions t 
on m.merchant_id = t.recipient_id 
Where t.transaction_date between '2023-11-01' AND '2024 - 05 -01'
group by m.merchant_id, m.business_name
order by total_recevied desc
limit 10;

Select
    m.merchant_id,
    m.business_name,
    sum(t.transaction_amount) as total_recevied
from users u 
join transactions t 
on u.user_id = t.recipient_id 
join merchants m
on u.user_id = m.merchant_id
Where t.transaction_date between '2023-11-01' AND '2024 - 05 -01'
group by m.merchant_id, m.business_name
order by total_recevied desc
limit 10;


Select
    m.merchant_id,
    m.business_name,
    sum(t.transaction_amount) as total_recevied
from users  u
join transactions t 
on u.user_id  = t.recipient_id 
join marchants m
m.marchant_id = u.user_id
Where t.transaction_date between '2023-11-01' AND '2024 - 05 -01'
group by m.merchant_id, m.business_name
order by total_recevied desc
limit 10;

Select
    m.merchant_id,
    m.business_name,
    (sum(t.transaction_amount)) as total_recevied,
    (avg(t.transaction_amount)) as average_transaction
from users  u
left join transactions t 
on u.user_id  = t.recipient_id 
join merchants m
on m.merchant_id = u.user_id
Where t.transaction_date between '2023-11-01' AND '2024-05-01'
group by m.merchant_id, m.business_name
order by total_recevied desc
limit 10;

Select  
    case 
        when transaction_amount > 10000 then 'High Value'
        else 'Regular' 
        End AS transaction_category
    from transactions 
    where extract(year from transaction_date) = '2023';
    
    select * from transactions;
    
    select * from users;
    
    Select 
		c.currency_code,
        sum(t.transaction_amount) as totalamount
from transactions t 
JOIN CURRENCIES C
ON T.currency_code = c.currency_code
where transaction_date between '2023-05-22' AND '2024-05-22'
GROUP BY CURRENCY_CODE
ORDER BY totalamount DESC
LIMIT 1;
    
   Select 
		m.Business_name,
        sum(t.transaction_amount) as totalamount
from MERCHANTS m
join transactions t 
on m.merchant_id = t.recipient_id 
Where t.transaction_date between '2023-11-01' and '2024-05-01'
group by 1
order by 2 desc;

Select 
    case
        when t.transaction_amount > 10000 and us.country_id <> ur.country_id
        then 'High Value International'
        When t.transaction_amount > 10000 
        and  us.country_id = ur.country_id
        then 'High Value Domestion' 
        When t.transaction_amount <= 10000 
        and  us.country_id<> ur.country_id then 'Regular International'
        Else 'Regular Domestic'
        End AS transaction_category,
    Count(*) as transaction_count
from transactions t 
join users us 
on t.sender_id = us.user_id
join users ur 
on t.recipent_id = ur.user_id 
where Extract(year from t.transaction_date) = 2023
group by 1
order by 2 desc;



Select 
    case
        when t.transaction_amount > 10000 and us.country_id <> ur.country_id
        then 'High Value International'
        
        When t.transaction_amount > 10000 and  us.country_id = ur.country_id
        then 'High Value Domestic' 
        When t.transaction_amount <= 10000 
        and  us.country_id<> ur.country_id then 'Regular International'
        Else 'Regular Domestic'
    End AS transaction_category,
    Count(*) as transaction_count
from transactions t 
join users us 
on t.sender_id = us.user_id
join users ur 
on t.recipent_id = ur.user_id 
where Extract(year from t.transaction_date) = 2023
group by 1
order by 2 desc;



Select 
    year(t.transaction_date) AS transaction_year,
    month(t.transaction_date) as transaction_month,
    case  when t.transaction_amount > 10000  then 'High Value'
      Else 'Regular' END AS value_category,
case when us.country_id <> ur.country_id then 'International' Else 'Domestic' END AS location_category,
Round(sum(t.transaction_amount),2) as total_amount,
Round(avg(t.transaction_amount),2) as average_amount
from transactions t 
join users us 
    on t.sender_id = us.user_id 
join users ur 
 on t.recipient_id - ur.user_id 
 where extract(year from transaction_date) = '2023'
 group by 1,2,3,4
 order by 1,2,3,4;









Select
    m.merchant_id,
    m.business_name,
    Round(sum(t.transaction_amount),2) as total_received,
    case
    when sum(t.transaction_amount)> 50000 then 'Excellent'
    When sum(t.transaction_amount)> 20000 then 'Good'
    When Sum(t.transaction_amount) > 10000 then 'Average'
Else 'Below Average' END AS performance_score,
ROUND(AVG(t.transaction_amount),2) as average_transaction
from transactions t 
join merchants m 
on t.recipient_id = m.merchant_id
where t.transaction_date between  '2023-11-01' AND '2024-04-30'
GROUP BY 1,2
ORDER BY 3 DESC;

















Select 
    u.user_id,
    u.email
from users u 
join(
        Select 
            t.sender_id as user_id,
            count(distinct date_format(t.transaction_date, '%Y-%M'))AS active_months
        from transactions t 
        where t.transaction_date between '2023-05-01' AND '2024-05-01'
        GROUP BY t.sender_id
)m 
on u.user_id = m.user_id 
where m.active_months >=6 
order by u.user_id;









Select 
    m.merchant_id,
    m.business_name,
    Year(t.transaction_date) as transaction_year,
    month(t.transaction_date) as transaction_month,
    Round(sum(t.transaction_amount),2) as total_transaction_amount,
    case
        When sum(t.transaction_amount)> 50000
            then 'Exceeded $50,000'
            else 'Did Not Exceed $50,000' END AS performance_status
    from transactions t 
    join merchants m 
    on t.recipient_id = m.merchant_id
    where t.transaction_date between '2023-11-01' and '2024-05-01'
    group by 1,2,3,4
    order by 1,2,3,4;
















