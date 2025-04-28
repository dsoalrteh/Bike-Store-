CREATE TABLE public.bike_share_yr(
dteday DATE NOT NULL,
season INTEGER, 
yr INTEGER,
mnth INTEGER,
hr INTEGER,
holiday INTEGER,
WEEKDAT INTEGER,
workingday INTEGER,
weathersit INTEGER,
temp FLOAT,
atemp FLOAT,
hum FLOAT,
windspeed FLOAT,
rider_type VARCHAR(25),
riders INTEGER
);

SELECT *
FROM public.bike_share_yr;

CREATE TABLE public.bike_share_yr_1(
dteday DATE NOT NULL,
season INTEGER, 
yr INTEGER,
mnth INTEGER,
hr INTEGER,
holiday INTEGER,
WEEKDAT INTEGER,
workingday INTEGER,
weathersit INTEGER,
temp FLOAT,
atemp FLOAT,
hum FLOAT,
windspeed FLOAT,
rider_type VARCHAR(25),
riders INTEGER
);

SELECT *
FROM public.bike_share_yr_1;

CREATE TABLE public.cost_table(
yr INTEGER,
price FLOAT,
COGS FLOAT
);

SELECT *
FROM public.cost_table;

--

WITH CTE AS (	
SELECT * FROM public.bike_share_yr
UNION ALL
SELECT * FROM public.bike_share_yr_1)
SELECT * FROM CTE a
LEFT JOIN cost_table b
ON a.yr = b.yr;

--multiplicación precio con riders

WITH CTE AS (	
SELECT * FROM public.bike_share_yr
UNION ALL
SELECT * FROM public.bike_share_yr_1)
SELECT dteday,
season,
a.yr,
WEEKDAT,
hr,
rider_type,
riders,
price,
COGS,
riders * price AS revenue,
riders * price - COGS AS profit
FROM CTE a
LEFT JOIN cost_table b
ON a.yr = b.yr;

