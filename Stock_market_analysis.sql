create database stock_market;
use stock_market;

select * from stock_market;

-- 1.Average Daily Trading Volume --

select ticker ,concat(format(avg(volume)/1000000,3),'M') 
as avg_trading_volume 
from stock_market
group by ticker
order by avg_trading_volume desc;

-- 2.Most Volatile Stocks --

select ticker,round(avg(beta),4)
as most_volatile_stocks
from stock_market
group by ticker
order by most_volatile_stocks desc;

-- 3.Stocks with Highest Dividend and Lowest Dividend --

select ticker, sum(`Dividend Amount`) 
as highest_stocks_dividend 
from stock_market
group by ticker
order by highest_stocks_dividend desc;

select ticker, sum(`Dividend Amount`) 
as lowest_stocks_dividend 
from stock_market
group by ticker
order by lowest_stocks_dividend desc;

-- 4.Highest and Lowest P/E Ratios --

select ticker,
max(`pe ratio`) as `highest pe ratio`,
min(`pe ratio`) as `lowest pe ratio`
from stock_market
group by ticker
order by `highest pe ratio` desc;

-- 5.Stocks with Highest Market Cap --

select ticker,
concat(round((sum(`market cap`)/1000000000000),2), 'T') as highest_market_cap
from stock_market
group by ticker;

-- 6.Stocks Near 52 Week High --

select ticker,
max(`52 week high`)
from stock_market
group by ticker;

-- 7.Stocks Near 52 Week Low --

select ticker,
min(`52 week low`)
from stock_market
group by ticker;

-- 8.Stocks with Strong Buy Signals and stocks with Strong Selling Signal --

select ticker, `RSI (14 days)` , MACD ,
case
when `RSI (14 days)` < 45 and MACD > 0 then 'buy'
when `RSI (14 days)` >- 60 and MACD < 0 then 'sell'
else 'neutral'
end as buy_sell_ntl
from stock_market;





