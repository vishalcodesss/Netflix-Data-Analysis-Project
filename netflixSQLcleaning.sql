select * from netflixdf

-- remove duplicates

select show_id, COUNT(*)
from netflixdf
group by show_id
having COUNT(*) > 1


select *
from netflixdf
where concat(title, type) in (
select concat(title, type)
from netflixdf
group by title, type
having count(*)>1
) order by title


with cte as (
select *,
ROW_NUMBER() over(partition by title, type order by show_id) as rnk
from netflixdf
)
select * 
from cte 
where rnk = 1


-- Creating new tables for listed_in, director, country, cast

select * from netflixdf

select show_id, TRIM(value) as director 
into netflix_directors
from netflixdf
cross apply string_split(director,',')			-- This will split the directors and assign single director in each row

select show_id, TRIM(value) as genre
into netflix_genres
from netflixdf
cross apply string_split (listed_in, ',')

select show_id, TRIM(value) as cast_members
into netflix_cast
from netflixdf
cross apply string_split (cast, ',')

select show_id, TRIM(value) as country
into netflix_countries
from netflixdf
cross apply string_split (country, ',')

select * from netflix_cast order by show_id

-- Converting datatype of date_added column to date type

select column_name, data_type
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'netflixdf';

ALTER TABLE netflixdf
ALTER COLUMN date_added date;

-- populate missing values in country and duration columns

select *
from netflix_countries

-- populating missing values of country column
insert into netflix_countries
select show_id, m.country
from netflixdf nf
inner join (
select director, country
from netflix_countries nc
inner join netflix_directors nd on nc.show_id = nd.show_id
group by director, country
) m on nf.director = m.director
where nf.country is null

-- populating missing values of duration
select show_id, type, title, date_added, release_year, rating,
		case when duration is null then rating else duration end as duration, description
from netflixdf 
where date_added is null

-- creating a new table and inserting all the cleaned data into the new table (netflix table)
select show_id, type, title, date_added, release_year, rating,
		case when duration is null then rating else duration end as duration, description
		into netflix
from netflixdf 

select * from netflix


-------------------------------------
-- further cleaning for importing data to power bi
begin transaction;

UPDATE netflixdata
SET director = 'Unknown'
WHERE director IS NULL;

UPDATE netflixdata
SET cast = 'Unknown'
WHERE cast IS NULL;

UPDATE netflixdata
SET country = 'Unknown'
WHERE country IS NULL;

select * from netflixdata order by show_id

commit;

select * 
from netflixdata

SELECT 
    show_id,
    type,
    title,
    director,
    cast,
    LTRIM(RTRIM(value)) AS country,
    date_added,
    release_year,
    rating,
    duration,
    listed_in,
    description
	into netflixdata1
FROM 
    netflixdata
CROSS APPLY 
    STRING_SPLIT(country, ',')

	select * from netflixdata1